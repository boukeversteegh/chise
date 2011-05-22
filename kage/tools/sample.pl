use chise;

$chise = new chise;

@feature = $chise->get_feature_list();
print join("\n", @feature)."\n";

print $chise->db_format_version()."\n";
print $chise->db_dir()."\n";
print $chise->ds_location()."\n";
print $chise->system_db_dir()."\n";

print $chise->char_gets_feature_value(0x5555, "ideographic-structure")."\n";
printf "%x\n", $chise->ds_decode_char("=daikanwa", 8);
printf "%x\n", $chise->char_gets_feature_value($chise->ds_decode_char("=gt-k", 1873), "=gt-pj-k2");

print $chise->feature_gets_property_value("=daikanwa", "description")."\n";
print $chise->feature_gets_property_value('=ucs@JP', "mother")."\n";

printf "%x\n", $chise->get_newid();

#&set_feature_value('glyph@kage', 0x4e00, "abcdefghijkl");
#&set_feature_value('glyph@kage', 0x4e00);

#print &get_feature_value('glyph@kage', 0x4e00)."\n";
#print &get_feature_value('glyph@kage', 0x4e01)."\n";

#print &create_new_char('glyph@kage', "aaaaaaaaaaaaaaaaaaaaaaaa")."\n";

#print &get_feature_value('glyph@kage', 987587)."\n";

#&update_chise;

