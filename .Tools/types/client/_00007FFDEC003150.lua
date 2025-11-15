---@meta
---@class Barotrauma.PropertyConditional : System.Object
---`Field Public Instance`
---@field Type Barotrauma.PropertyConditional.ConditionType
---`Field Public Instance`
---@field ComparisonOperator Barotrauma.PropertyConditional.ComparisonOperatorType
---`Field Public Instance`
---@field AttributeName Barotrauma.Identifier
---`Field Public Instance`
---@field AttributeValue System.String
---`Field Public Instance`
---@field AttributeValueAsTags (System.Collections.Immutable.ImmutableArray*1Barotrauma*Identifier)|(Barotrauma.Identifier[])
---`Field Public Instance`
---@field FloatValue System.Nullable*1System*Single
---`Field Private Instance`
---@field cachedHostilityValue Barotrauma.WorldHostilityOption
---`Field Public Instance`
---@field TargetItemComponent System.String
---`Field Public Instance`
---@field ItemComponentComparison Barotrauma.PropertyConditional.LogicalOperatorType
---`Field Public Instance`
---@field TargetSelf System.Boolean
---`Field Public Instance`
---@field TargetContainer System.Boolean
---`Field Public Instance`
---@field TargetGrandParent System.Boolean
---`Field Public Instance`
---@field TargetContainedItem System.Boolean
---`Getter Private Instance`
---@field ComparisonOperatorIsNotEquals System.Boolean
_G['PropertyConditional'] = {}

---`Method Public Static`
---@param element Barotrauma.ContentXElement
---@param predicate? (System.Predicate*1System*Xml*Linq*XAttribute)|(fun(obj:System.Xml.Linq.XAttribute):(System.Boolean))
---@return (System.Collections.Generic.IEnumerable*1Barotrauma*PropertyConditional)|(fun():(Barotrauma.PropertyConditional))
_G['PropertyConditional'].FromXElement = function(element, predicate) end

---`Method Private Static`
---@param attribute System.Xml.Linq.XAttribute
---@return System.Boolean
_G['PropertyConditional'].IsValid = function(attribute) end

---`Method Public Static`
---@param str System.String
---@return System.ValueTuple*1Barotrauma*PropertyConditional*ComparisonOperatorType*1System*String
_G['PropertyConditional'].ExtractComparisonOperatorFromConditionString = function(str) end

---`Method Public Static`
---@param op System.String
---@return Barotrauma.PropertyConditional.ComparisonOperatorType
_G['PropertyConditional'].GetComparisonOperatorType = function(op) end

---`Method Public Instance`
---@param target Barotrauma.ISerializableEntity
---@return System.Boolean
_G['PropertyConditional'].Matches = function(target) end

---`Method Private Instance`
---@param target Barotrauma.ISerializableEntity
---@return System.Boolean
_G['PropertyConditional'].MatchesContained = function(target) end

---`Method Private Instance`
---@param target Barotrauma.ISerializableEntity
---@return System.Boolean
_G['PropertyConditional'].MatchesDirect = function(target) end

---`Method Private Instance`
---@param target Barotrauma.ISerializableEntity
---@return System.Boolean
_G['PropertyConditional'].CheckOnlyEquality = function(target) end

---`Method Private Instance`
---@param matches System.Int32
---@return System.Boolean
_G['PropertyConditional'].SufficientTagMatches = function(matches) end

---`Method Private Instance`
---@param predicate (System.Func*1Barotrauma*Identifier*1System*Boolean)|(fun(arg:Barotrauma.Identifier):(System.Boolean))
---@return System.Boolean
_G['PropertyConditional'].CheckMatchingTags = function(predicate) end

---`Method Public Instance`
---@param targetTag Barotrauma.Identifier
---@return System.Boolean
_G['PropertyConditional'].TargetTagMatchesTagCondition = function(targetTag) end

---`Method Private Instance`
---@param testedValue System.Single
---@return System.Boolean
_G['PropertyConditional'].NumberMatchesRequirement = function(testedValue) end

---`Method Private Instance`
---@param target Barotrauma.ISerializableEntity
---@param property Barotrauma.SerializableProperty
---@return System.Boolean
_G['PropertyConditional'].PropertyMatchesRequirement = function(target, property) end

---`Method Public Static`
---@param val1 System.Single
---@param val2 System.Single
---@param op Barotrauma.PropertyConditional.ComparisonOperatorType
---@return System.Boolean
_G['PropertyConditional'].CompareFloat = function(val1, val2, op) end

---`Method Public Static`
---@param leftValue Barotrauma.PropertyConditional.T
---@param rightValue Barotrauma.PropertyConditional.T
---@param comparisonOperator Barotrauma.PropertyConditional.ComparisonOperatorType
---@return System.Boolean
_G['PropertyConditional'].Compare = function(leftValue, rightValue, comparisonOperator) end

---`Method Public Static`
---@param element Barotrauma.ContentXElement
---@param defaultOperatorType? Barotrauma.PropertyConditional.LogicalOperatorType
---@return Barotrauma.PropertyConditional.LogicalComparison
_G['PropertyConditional'].LoadConditionals = function(element, defaultOperatorType) end

---`Method Public Static`
---@param conditionalTarget Barotrauma.ISerializableEntity
---@param conditionals (System.Collections.Generic.IEnumerable*1Barotrauma*PropertyConditional)|(fun():(Barotrauma.PropertyConditional))
---@param logicalOperator Barotrauma.PropertyConditional.LogicalOperatorType
---@return System.Boolean
_G['PropertyConditional'].CheckConditionals = function(conditionalTarget, conditionals, logicalOperator) end

---`Constructor Private Instance`
---@param attributeName Barotrauma.Identifier
---@param comparisonOperator Barotrauma.PropertyConditional.ComparisonOperatorType
---@param attributeValue System.String
---@param targetItemComponent System.String
---@param itemComponentComparison Barotrauma.PropertyConditional.LogicalOperatorType
---@param targetSelf System.Boolean
---@param targetContainer System.Boolean
---@param targetGrandParent System.Boolean
---@param targetContainedItem System.Boolean
---@param conditionType Barotrauma.PropertyConditional.ConditionType
---@return Barotrauma.PropertyConditional
_G['PropertyConditional'] = function(attributeName, comparisonOperator, attributeValue, targetItemComponent, itemComponentComparison, targetSelf, targetContainer, targetGrandParent, targetContainedItem, conditionType) end

---`Constructor Private Instance`
---@param attributeName Barotrauma.Identifier
---@param comparisonOperator Barotrauma.PropertyConditional.ComparisonOperatorType
---@param attributeValue System.String
---@param targetItemComponent System.String
---@param itemComponentComparison Barotrauma.PropertyConditional.LogicalOperatorType
---@param targetSelf System.Boolean
---@param targetContainer System.Boolean
---@param targetGrandParent System.Boolean
---@param targetContainedItem System.Boolean
---@param conditionType Barotrauma.PropertyConditional.ConditionType
---@return Barotrauma.PropertyConditional
_G['PropertyConditional'].__new = function(attributeName, comparisonOperator, attributeValue, targetItemComponent, itemComponentComparison, targetSelf, targetContainer, targetGrandParent, targetContainedItem, conditionType) end

