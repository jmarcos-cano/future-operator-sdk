
image:=mcano/timemachine-operator:1.0
.PHONY: build push all crd demo deploy undo
build:
	operator-sdk build ${image}
	docker push ${image}

crd:
	kubectl apply -f deploy/crds/helm.operator-sdk_timemachines_crd.yaml


demo: crd
	operator-sdk run local --reconcile-period="1s"

deploy:
	kubectl apply -f deploy/crds/helm.operator-sdk_v1alpha1_timemachine_cr.yaml

undo:
	kubectl delete -f deploy/crds/helm.operator-sdk_v1alpha1_timemachine_cr.yaml