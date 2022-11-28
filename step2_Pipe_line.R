#Validation LDscore
python /BiO//hae/ldsc/ldsc.py --bfile test --l2 --ld-wind-cm 1 --out test_ld --yes-really


library(data.table)
library(corrplot)

c <- fread("v3.40268_v2")
c <- data.frame(c)
m <- read.table("../v2_UKB_chr16_hm3.bim")


#SNP 1i
m2 <- m [ m$V4 < 90172696 + 250000,]
m2 <- m2 [ m2$V4 > 90172696 - 250000,]
extract <- c [ ,c(m2$V2)]
Matrix_ld <- cor(extract)
Matrix_ld_score <- data.frame(rowSums(Matrix_ld))
Matrix_ld_score <- Matrix_ld_score * Matrix_ld_score
Specific_SNP_result <- Matrix_ld_score[ attributes(Matrix_ld_score)$row.names == "rs9924610",]
Specific_SNP_result

rs9924610 12.64049
지금 하나만 뽑아야되 ㄱㄷ
