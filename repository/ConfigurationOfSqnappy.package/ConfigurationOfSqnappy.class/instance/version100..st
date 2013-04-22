versions
version100: spec 
	<version: '1.0' imports: #('1.0-baseline')>
	spec
		for: #common
		do: [spec blessing: #beta.
			spec description: 'Sqnappy 1.0'.
			spec author: 'mu'.
			spec package: 'Snappy-Core' with: 'Snappy-Core-mu.24';
				 package: 'Snappy-Stream' with: 'Snappy-Stream-mu.61';
				 package: 'Snappy-Tests' with: 'Snappy-Tests-mu.6';
				 package: 'Snappy-Plugin' with: 'Snappy-Plugin-mu.34']