test:
	pylint --rcfile=.pylintrc --reports=y --exit-zero analytics | tee pylint.out
	flake8 --max-complexity=10 --statistics analytics > flake8.out || true

release:
	python setup.py sdist bdist_wheel
	twine upload dist/*

e2e_test:
	.buildscripts/e2e.sh

.PHONY: test release e2e_test
