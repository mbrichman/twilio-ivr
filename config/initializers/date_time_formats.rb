Time::DATE_FORMATS[:default] = "%B %-e, %Y - %-l:%M%P"

Time::DATE_FORMATS[:standard] = "%Y-%m-%e %H-%M-%S %z"
Time::DATE_FORMATS[:time] = "%-l:%M%P"
Time::DATE_FORMATS[:time_with_zone] = "%-k:%M%P %z"
Time::DATE_FORMATS[:long_date] = Date::DATE_FORMATS[:long_date] = "%B %-e, %Y"
Time::DATE_FORMATS[:short_date] = Date::DATE_FORMATS[:short_date] = "%b %-e"
Time::DATE_FORMATS[:long_date_with_day] = Date::DATE_FORMATS[:long_date_with_day] = "%A, %B %-e, %Y"
Time::DATE_FORMATS[:short_date_with_day] = Date::DATE_FORMATS[:short_date_with_day] = "%a, %b %-e"

Time::DATE_FORMATS[:table_date] = Date::DATE_FORMATS[:table_date] = "%m/%d/%y"
Date::DATE_FORMATS[:calendar_date] = "%b-%e-%Y"

