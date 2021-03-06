--TEST--
Indented Standalone
--DESCRIPTION--
All standalone comment lines should be removed.
--SKIPIF--
<?php if(!extension_loaded('mustache')) die('skip '); ?>
--FILE--
<?php
$test = array (
  'name' => 'Indented Standalone',
  'desc' => 'All standalone comment lines should be removed.',
  'data' => 
  array (
  ),
  'template' => 'Begin.
  {{! Indented Comment Block! }}
End.
',
  'expected' => 'Begin.
End.
',
);
$mustache = new Mustache();
echo $mustache->render($test["template"], $test["data"]);
?>
--EXPECTREGEX--
Begin\.\s*End\.\s*