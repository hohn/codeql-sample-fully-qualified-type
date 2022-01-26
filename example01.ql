/**
 * @name Function Signature
 * @kind graph
 * @id cpp/example/function-signature-1
 */

import cpp

/*
 * This that also works.
 * Following the hierarchy, the getQualifiedName() of  (UserType).getQualifiedName() is
 * in fact the one from Declaration…
 */

string getQualifiedName(Type t) {
  result = t.(UserType).getQualifiedName()
  or
  result = t.(BuiltInType).getName()
  or
  // derived types
  result = getQualifiedName(t.(PointerType).getBaseType()) + "*"
  // or
  // etc...
}

from FunctionCall call, Function func, Parameter param, Type funcType, Type parType
where
  func = call.getTarget() and
  func.hasName("foo") and
  param = func.getAParameter() and
  funcType = func.getType() and
  parType = param.getType()
select "signatures: ",
  //
  call, func, funcType, getQualifiedName(funcType),
  //
  param, parType, getQualifiedName(parType)
