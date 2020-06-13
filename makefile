SHARED_FOLDER:=public/
GIT_URL:=https://jmarcos-cano.github.io/future-operator-sdk/
CHART_FOLDER=helm/mychart/


.PHONY: index package

index: package
	@echo "Indexing yaml file"
	@helm repo index --url ${GIT_URL} .

package:
	@echo "Packaging my ${CHART_FOLDER}"
	@helm package ${CHART_FOLDER} -d ${SHARED_FOLDER}

build-app:
	cd app/
	${MAKE}
build-operator:
	cd helm/timeMachine
	${MAKE}
