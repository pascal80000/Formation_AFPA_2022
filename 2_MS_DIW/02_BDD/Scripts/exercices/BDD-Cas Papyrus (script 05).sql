# 5 Quels sont les fournisseurs situés dans les départements 75, 78, 92, 77 ? 

SELECT fournis.posfou, fournis.nomfou
FROM fournis
WHERE posfou = '75014' OR posfou = '78250' OR posfou = '78440' OR posfou = '92200'
ORDER BY fournis.posfou DESC, fournis.nomfou;
