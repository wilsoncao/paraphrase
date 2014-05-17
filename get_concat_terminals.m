function out = get_concat_terminals( root , tree )
   global allSKids;
   global allSNum;
   out = [];
   if ((allSKids(root,1)~=0) && (allSKids(root,2)~=0))
       out = [out get_concat_terminals(allSKids(root,1),tree) get_concat_terminals(allSKids(root,2),tree)];
   else
       out = [out tree(:,root)];

end

