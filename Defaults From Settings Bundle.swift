func setDefaultsFromSettingsBundle() {
	//Read PreferenceSpecifiers from Root.plist in Settings.Bundle
	if let settingsURL = Bundle.main.url(forResource: "Root", withExtension: "plist", subdirectory: "Settings.bundle"),
		let settingsPlist = NSDictionary(contentsOf: settingsURL),
		let preferences = settingsPlist["PreferenceSpecifiers"] as? [NSDictionary] {
		
		for prefSpecification in preferences {
			
			if let key = prefSpecification["Key"] as? String, let value = prefSpecification["DefaultValue"] {
				
				//If key doesn't exists in userDefaults then register it, else keep original value
				if UserDefaults.standard.value(forKey: key) == nil {
					
					UserDefaults.standard.set(value, forKey: key)
					NSLog("registerDefaultsFromSettingsBundle: Set following to UserDefaults - (key: \(key), value: \(value), type: \(type(of: value)))")
				}
			}
		}
	} else {
		NSLog("registerDefaultsFromSettingsBundle: Could not find Settings.bundle")
	}
}
