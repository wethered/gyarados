#
# Battery
#

function __gyarados_section_battery -d "Displays battery symbol and charge"
	# ------------------------------------------------------------------------------
	# Configuration
	# ------------------------------------------------------------------------------

	# ------------------------------------------------------------------------------
	# | GYARADOS_BATTERY_SHOW | below threshold | above threshold | fully charged |
	# |------------------------+-----------------+-----------------+---------------|
	# | false                  | hidden          | hidden          | hidden        |
	# | always                 | shown           | shown           | shown         |
	# | true                   | shown           | hidden          | hidden        |
	# | charged                | shown           | hidden          | shown         |
	# ------------------------------------------------------------------------------

	__gyarados_util_set_default GYARADOS_BATTERY_SHOW true
	__gyarados_util_set_default GYARADOS_BATTERY_PREFIX ""
	__gyarados_util_set_default GYARADOS_BATTERY_SUFFIX " "
	__gyarados_util_set_default GYARADOS_BATTERY_SYMBOL_CHARGING ⇡
	__gyarados_util_set_default GYARADOS_BATTERY_SYMBOL_DISCHARGING ⇣
	__gyarados_util_set_default GYARADOS_BATTERY_SYMBOL_FULL •
	__gyarados_util_set_default GYARADOS_BATTERY_THRESHOLD 10

	# ------------------------------------------------------------------------------
	# Section
	# ------------------------------------------------------------------------------

	# Show section only if any of the following is true
	# - GYARADOS_BATTERY_SHOW = "always"
	# - GYARADOS_BATTERY_SHOW = "true" and
	#	- battery percentage is below the given limit (default: 10%)
	# - GYARADOS_BATTERY_SHOW = "charged" and
	#	- Battery is fully charged

	# Check that user wants to show battery levels
	[ $GYARADOS_BATTERY_SHOW = false ]; and return

	set -l battery_data
	set -l battery_percent
	set -l battery_status
	set -l battery_color
	set -l battery_symbol

	# Darwin and macOS machines
	if type -q pmset
		set battery_data (pmset -g batt | grep "InternalBattery")

		# Return if no internal battery
		if test -z (echo $battery_data)
			return
		end

		set battery_percent (echo $battery_data | grep -oE "[0-9]{1,3}%")
		# spaceship has echo $battery_data | awk -F '; *' 'NR==2 { print $2 }', but NR==2 did not return anything.
		set battery_status (echo $battery_data | awk -F '; *' '{ print $2 }')

	# Linux machines
	else if type -q upower
		set -l battery (upower -e | grep battery | head -1)

		[ -z $battery ]; and return

		set -l IFS # Clear IFS to allow for multi-line variables
		set battery_data (upower -i $battery)
		set battery_percent (echo $battery_data | grep percentage | awk '{print $2}')
		set battery_status (echo $battery_data | grep state | awk '{print $2}')

	# Windows machines.
	else if type -q acpi
		set -l battery_data (acpi -b 2>/dev/null | head -1)

		# Return if no battery
		[ -z $battery_data ]; and return

		set battery_percent ( echo $battery_data | awk '{print $4}' )
		set battery_status ( echo $battery_data | awk '{print tolower($3)}' )
	else
		return
	end

	 # Remove trailing % and symbols for comparison
	set battery_percent (echo $battery_percent | string trim --chars=%[,;])

	if test "$battery_percent" -eq 100 -o -n (echo (string match -r "(charged|full)" $battery_status))
		set battery_color green
	else if test "$battery_percent" -lt "$GYARADOS_BATTERY_THRESHOLD"
		set battery_color red
	else
		set battery_color yellow
	end

	# Battery indicator based on current status of battery
	if test "$battery_status" = "charging"
		set battery_symbol $GYARADOS_BATTERY_SYMBOL_CHARGING
	else if test -n (echo (string match -r "^[dD]ischarg.*" $battery_status))
		set battery_symbol $GYARADOS_BATTERY_SYMBOL_DISCHARGING
	else
		set battery_symbol $GYARADOS_BATTERY_SYMBOL_FULL
	end

	if test "$GYARADOS_BATTERY_SHOW" = "always" \
	-o "$battery_percent" -lt "$GYARADOS_BATTERY_THRESHOLD" \
	-o "$GYARADOS_BATTERY_SHOW" = "charged" \
	-a -n (echo (string match -r "(charged|full)" $battery_status))
		__gyarados_lib_section \
			$battery_color \
			$GYARADOS_BATTERY_PREFIX \
			"$battery_symbol$battery_percent%" \
			$GYARADOS_BATTERY_SUFFIX
	end
end
