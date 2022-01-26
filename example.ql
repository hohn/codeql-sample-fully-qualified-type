/**
 * @name Function Signature
 * @kind graph
 * @id cpp/example/function-signature
 */

import cpp

from FunctionCall call, Function func, Parameter param, Declaration pardec, Declaration funcDec
where
  func = call.getTarget() and
  func.hasName("foo") and
  param = func.getAParameter() and
  pardec.getADeclarationEntry().getType() = param.getType() and
  funcDec.getADeclarationEntry().getType() = func.getType() and
  // Ignore the function name from the set of Declarations
  funcDec.getName() != func.getName()
select "signatures: ", call, func,
  //
  func.getType() as funcType, func.getType().getUnderlyingType() as underlyingType,
  //
  funcDec, funcDec.getQualifiedName() as funcDecName,
  //
  param, param.getType() as paramType, pardec, pardec.getQualifiedName() as pardecName
