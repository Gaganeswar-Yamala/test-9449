public class Foo {
    public List<Entitlement__c> selectAmendableByLicenseOrSerialNumbers(Set<String> licenseNumbers, List<String> fieldList){

            fflib_QueryFactory query = newQueryFactory(false);
            String hardware = cpq_ProductConstants.PRODUCT_TYPE_HARDWARE;

            String recurring = om_OrderConstants.RECURRING;

            Set<String> invalidStatusSet = new Set<String>{'Draft', 'Inactive', 'Lapsed'};

            Set<String> validOppTypes = new Set<String>{

                opp_OpportunityConstants.NFR_TYPE,
                opp_OpportunityConstants.POS_TYPE,
                opp_OpportunityConstants.RUN_RATE_TYPE,
                opp_OpportunityConstants.STANDARD_TYPE
            };
            String condition = '(le_License_Number__c IN :licenseNumbers ' +
                        'OR (Parent_Entitlement__r.Product__r.cpq_Downstream_Product_Type__c = :hardware ' +
                            'AND Parent_Entitlement__r.le_License_Number__c IN :licenseNumbers)) ' +
                    'AND Subscription__r.cpq_Subscription_Fully_Renewed__c = FALSE ' +
                    'AND Subscription__r.SBQQ__ChargeType__c = :recurring ' +
                    'AND Subscription__r.SBQQ__RenewalQuantity__c > 0 ' +
                    'AND Subscription__r.SBQQ__Contract__r.cpq_Opportunity_Type__c IN :validOppTypes ' +
                    'AND Subscription__r.SBQQ__Contract__r.Status NOT IN :invalidStatusSet ' +
                    'AND Is_Superseded__c = FALSE';
            query.selectFields(fieldList);
            query.setCondition(condition);
            return (List<Entitlement__c>) Database.query(query.toSOQL());
        }

}