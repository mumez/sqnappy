baselines
baseline100: spec
    <version: '1.0-baseline'>
    spec
        for: #'common'
        do: [ 
            spec blessing: #'baseline'.
            spec repository: 'http://smalltalkhub.com/mc/MasashiUmezawa/Sqnappy/main'.
            spec package: 'Snappy-Core'; package: 'Snappy-Plugin';
			 package: 'Snappy-Stream' with: [ spec requires: 'Snappy-Core'];
			 package: 'Snappy-Tests' with: [ spec requires: #('Snappy-Core' 'Snappy-Stream')].
            spec group: 'default' with: #('Snappy-Core' 'Snappy-Stream' 'Snappy-Tests');
			group: 'Core' with: #('Snappy-Core');
			group: 'Stream' with: #('Snappy-Stream');
			group: 'Tests' with: #('Snappy-Tests');
			group: 'Plugin' with: #('Snappy-Plugin')]
    