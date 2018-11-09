.PHONY: deploy.aws

ENV             ?= dev
DEPLOY_DIR       = deploy
BUILD_DIR        = build
DEPLOY_REGION   ?= eu-west-1
DEPLOY_BUCKET    = $(ENV)-orbis-training
DEPLOY_USER_NAME = 'janet.huacahuasi'

define deploy_bucket
    @aws s3 sync \
    ${PWD}/${DEPLOY_DIR}/${BUILD_DIR} \
    s3://${DEPLOY_BUCKET}/${DEPLOY_USER_NAME} \
    --delete \
    --acl public-read \
    --region ${DEPLOY_REGION}
endef

define show_deploy_url
    @echo ""
    @echo "Publicado en: https://training.orbis.pe/$(DEPLOY_USER_NAME)/index.html"
    @echo ""
endef

deploy.aws: ## Desplegando bucket.: make deploy.aws
    @echo "Desplegando cambios al bucket: $(DEPLOY_BUCKET)"
    $(call deploy_bucket)
    $(call show_deploy_url)