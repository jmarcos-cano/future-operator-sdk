
image:=mcano/timemachine-operator:1.0
.PHONY: build push all crd demo deploy undo full-demo timemachine
build:
	operator-sdk build ${image}
	docker push ${image}

crd:
	kubectl apply -f deploy/crds/helm.operator-sdk_timemachines_crd.yaml


demo: crd
	operator-sdk run local --reconcile-period="1s"

deploy:
	kubectl apply -f deploy/crds/helm.operator-sdk_v1alpha1_timemachine_cr.yaml
timemachine: deploy

full-demo: crd
	kubectl apply -f deploy/
	${MAKE} deploy


undo:
	kubectl delete -f deploy/crds/helm.operator-sdk_v1alpha1_timemachine_cr.yaml || true
	kubectl delete -f deploy/crds/helm.operator-sdk_timemachines_crd.yaml || true
	kubectl delete -f deploy/ || true