--TEST--
MustacheAST::__wakeup() member function
--SKIPIF--
<?php 
if( !extension_loaded('mustache') ) die('skip ');
 ?>
--FILE--
<?php
$tmpl = new MustacheAST("MU         MU         test ");
$tmpl = unserialize(serialize($tmpl));
var_dump($tmpl);
var_dump($tmpl->__toString());
var_dump(bin2hex($tmpl->__toString()));
//var_dump($m->render($tmpl, array('test' => 'baz')));
?>
--EXPECT--
object(MustacheAST)#2 (1) {
  ["binaryString":protected]=>
  string(33) "MU         MU         test "
}
string(33) "MU         MU         test "
string(66) "4d550001000000000001000000134d550010010000050000000000007465737400"