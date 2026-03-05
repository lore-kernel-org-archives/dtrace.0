Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 857FBAD2C
	for <dtrace@lists.linux.dev>; Thu,  5 Mar 2026 05:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772686887; cv=fail; b=euH8+HiFlp91w0FeQK9jOobRn5/dohPVGKm5HEt5vIAjF6za88QgVE+6cRNPZHtDPET/6v0bwcBKT76M9b8P/i2dNmmOYsDVnKTMwniuNdKBu0Wa25C/Bk0tKZgfyxNdhA6LDOGyYFnCTfK0nC5iUSndQUOOgoeq6Z2YHCbv0H8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772686887; c=relaxed/simple;
	bh=BAMJzp9vZiTMf+FO5qHyPe3YRNHqQfV6MUrMdxXEdyk=;
	h=Date:From:To:Subject:Content-Type:Message-ID:MIME-Version; b=cWWEr5Am1CCOlVr3Z1tT+/OGDVal+VDx7QM0WY2Ezg7tPfPF3k9/BykDG5z1nIV8WHt6jD4TZhoSrK9TezRZkUTaj02v3+9rJQGYHwcmUonxJ2GV5rTYBbvUxWYT4dgDlAuqvYTk91BiGUI0qtD5v40UGL0Kx+Tbt2Vl0/velnI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=SrZJS4D+; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=VS8wIMsM; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="SrZJS4D+";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="VS8wIMsM"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6253MImA095819
	for <dtrace@lists.linux.dev>; Thu, 5 Mar 2026 05:01:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=VAW0eGr355DjzmwZZXLbxtALf4wZNi2Jfb2U/V6oJxk=; b=
	SrZJS4D+Ut52h1HmQt5u3jV9tfGtniTnNpt93gAGcCFEpd/lEWoMdxdLYDUQhspg
	SvXusJsNWz8in4YZKU9Q5JqOgNIMJ/ezCmbLqy7FhKsjvtMhrvCIv8oxiD0j+gM0
	42Z+aIRgKpzESTukE2jDcIEeE+gEsucmVOctXsq6kaeRGLsn3f54LT/JydjOJHzH
	JbooZXU1hfBMrhaj42k+/8DOpqcm4SFfIi3kbOwgfszwWfAmeaSY88zkAd31qcwz
	Nyz32e5LXiS2I4HPMVkOAsNN19W1DLONin+YRpbgQ2b+KTmnNUwpH+uX3ikH1sQM
	svRTgjToklcUayqjiKDMyw==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4cq1uur205-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 05 Mar 2026 05:01:24 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 6254P22X021362
	for <dtrace@lists.linux.dev>; Thu, 5 Mar 2026 05:01:23 GMT
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010037.outbound.protection.outlook.com [52.101.85.37])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4ckptcg3ge-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 05 Mar 2026 05:01:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LEGzwOa/Nuv/L3af+slv8ZLyi8Bgo8nC3TY1QtfOI02KYXk8PYD0MCPnvqv2cTFtglfiVgO+wuIEADKiiTNITjgiGtiw8gshvHQ1a3SFX+z/NobVNOcANfWOdHryjWXDMWJB3ICXAUIMekMiFpjRTZUXTzj/j+YwLZxFvSEp4A+U3oRM8/KnELDU1llVMr5JTIq+QkV7FCM5R8mH0wXQxLf/mxILFay35Xj3sdV+HaVaZ+aFVv3z2rg/2mdr72iOrY602wCMHu1oG/5frFh5vco9uUrfcVGCDahItY1XEgfnHIJedbYg1/q1fCGHXo5NdH4kp8VWi+QAY7CGn/W+Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VAW0eGr355DjzmwZZXLbxtALf4wZNi2Jfb2U/V6oJxk=;
 b=v9kFyc2jXuXmBQK4AfbcHOo9YbjT59AjD/cugFJ4DYefDcFZ94Dh70LLFQk+bSa3u4h0P1pTbcF7P9vldBUZEfgH/BOicgOMdT4YvNgmMuudYi5uLPFr04Gq6egua4GC1/V+Ai1OLoMczcSXFZ6aMNHaAj2d+0J1bJZASYyjRx+WUxhwML63LvgmKoWh4eQplhSRAsDG85FZEtYC1PiR3OQlfh1tu/l+V4jivFRM50q71fmTo57u25V1Oz/x6IhVq+06zunI4lI/ivCnJEbFQUWZc7BbXAz248R8GgdlB8cUI8DnAMkKV8YAk4popuwmfAKBVjYKUiTzsKm2G9f1jQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VAW0eGr355DjzmwZZXLbxtALf4wZNi2Jfb2U/V6oJxk=;
 b=VS8wIMsMT0JmeU2b/4qUw+IvP+GF7jnCtcHDNnnpYt62dLe76WYHvWIHZaQKkNReClRw2o3HHCiGNkYGQ8zpeOcVEKnX6kdTXuaE6fj2n1IMbls0B0LamkVZT74K+Wo8L9ksiaNDBX1r1zuRSJKWzAIibSFSdc0XQyVcOcrR6M0=
Received: from DS0PR10MB7522.namprd10.prod.outlook.com (2603:10b6:8:15e::16)
 by DM6PR10MB4378.namprd10.prod.outlook.com (2603:10b6:5:211::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Thu, 5 Mar
 2026 05:01:20 +0000
Received: from DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a]) by DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a%6]) with mapi id 15.20.9678.016; Thu, 5 Mar 2026
 05:01:20 +0000
Date: Thu, 05 Mar 2026 00:01:19 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v2] configure: accept standard installation directory options
Content-Type: text/plain
X-ClientProxiedBy: BLAPR05CA0002.namprd05.prod.outlook.com
 (2603:10b6:208:36e::12) To DS0PR10MB7522.namprd10.prod.outlook.com
 (2603:10b6:8:15e::16)
Message-ID:
 <DS0PR10MB752207E7760FDCC141576F8FC27DA@DS0PR10MB7522.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB7522:EE_|DM6PR10MB4378:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c640b1c-22bd-484b-5cd1-08de7a743da1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	dDvefopDlZ4R1jSmc03FWuVcRrJUi4Ea1H4MSH/N0zOMLFvR9D0R6rc0ih55syhg1GLRv5qTq7rHxHzxE8SSD8KDEcqDeItrGJuYJhsWXIH1gPJDZo5rVnDdLrcdpORhRZovb2wuWRIolX5/37XwbzCWmzTc3S40E/xUZKXEQ7yEcuF7bLa+vUjSKIiJARrI8i0GaYgw8bXCcIi1ynXWRNw0spbb2sxJF+lwLh7iuzqgx/kLknktM3POnb3KcacaaI5WIRxPkMEIo3ugnerk/VMMQFohBObQdx1UlPmrzbTAOFw3tPn+8tuKt5lR+3UGm0aBH3wp2AyfhAMaHytEMnMMbsrL6RzGrmqRvrQ+YJ3J28F9ZD3jsGYJAGpefmbW7cqfYHVDT8iagrpvyhmXjsImrBVZimWQF8xiyUSAeSY5Q+Tvz8oaiTFPD6HMFIVA1mAqGTCLZZ7utt7piB9FQPOEOUeCePgzAgpOEhl9dgFucwXhy2UqmzW0PPv4f9WDLW06g8Y/qTPH0dagZgqIjwoE2tB3Ud416tVaD2rXzq1/fCdBbxJ52Vs//stxe3CH1CJliGpQUknVIJKzYDeKAwnle50rmcdKbCMsP4V10vmKOfzW1/wIqbglvbozPXjEbGnFJC2r+MbzM3LHNgOiqrA7N7K38wtO1dC1RRo8yig0lpXeUTKMhrg0U6DScW+gc6h+AW6OCW3eour7izbOgh7QGzzG9foEoM0g/1rADN4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB7522.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?kRwH5ia6vQlZ9WieoDp0kOIKZsKGkqPx7+Wh0oF+X9P7uKiDZ3eH7oN7O3JZ?=
 =?us-ascii?Q?MNeEeKKMG0Z70+QtMgUOFH0Ac9Id0PgpwVfjhTczRGdVanbuG9XiHUKaVaxH?=
 =?us-ascii?Q?uub4pk7szZ2ljOyJdDsE/OkiSZnqnqQwfmb1JStlRzfBTlSAGSpz60XF8hJm?=
 =?us-ascii?Q?Cv30MtZ2kHgG+r70WWCz/e1fIZQ86Q9S4q094o0bBM0IdcD012cbv4ow8EqE?=
 =?us-ascii?Q?H9WfEUyER2NDv0pMV11s7I7aPlZrs47FK0qbIsl8G7ZrmHM49d2P6lykVzjU?=
 =?us-ascii?Q?GZ+x1EOofqUuXawhf//neqa6nXMbN8HcYCowB2gHh22tWiDXOFQdP3rsjLZ3?=
 =?us-ascii?Q?wi4RxRv5SOzibpomtVAIeY1UqMEVGMyedyjTpOkYPvEm/dDiqALeS2gAsG8f?=
 =?us-ascii?Q?Avjkih1wACkgBTidGUQd6boB0rfvDEm5EZMIh3R8YYiD9LHB/BZNkHq547pw?=
 =?us-ascii?Q?Qb3MyaBrMkswZzzrsGwwIOhEnlOZkuJBA0teYC/VolAEngCjmLrixv/tw0Ag?=
 =?us-ascii?Q?ZBGefOCpMGMUFGtrHSZ3pvjyfgnhz3KL6G+IPfAauC8I5sMQZYKyUKtDKhU6?=
 =?us-ascii?Q?VD9Ems6Db/q5VYabDzmcauhNsN2jlpknIWZgJGYXsL/eezQLgt/k1sIoq/E8?=
 =?us-ascii?Q?Wvjiq6JfUW+eBz8t+Lq+cMlZNDput4Yyw+aG6yMKEqK1d6xZkohLCyDy6cA+?=
 =?us-ascii?Q?a6aBe3WbfHO1M0wT2TZRvnFGmM/E0B2kQM/BIn1cq7p2RfvvbvCfPB0z80Ao?=
 =?us-ascii?Q?0h9BtVc4UY4tR9uk3E3YETCqoW+Gi2rLfsriJtEn5jzKqaOgcTQ35lqKiMIL?=
 =?us-ascii?Q?koHPZ/XQaHuygVkQEW8HrA/EXKtfUths2IlVvuaIPiQZYr8TaqIs1KIHp+LW?=
 =?us-ascii?Q?YFbWG+9CJmnRiyEBEVWWUjZ+AbOV7EVMIfI43Qv0g8O+0iHrdwlPYXq6Zhd6?=
 =?us-ascii?Q?OEoOLjigHDu+4Bkvzuk91mwEEbU/Qzq9GMUCVkrGVHRehiRkKW9NFI/fw0i9?=
 =?us-ascii?Q?mxQhe5iMQDP710nb49bpxaLiUU9CDg4uP1sxMSVZ1KGoja0wHY0hu3rYsctX?=
 =?us-ascii?Q?SQRK+KYi8W41N0kJdAY/ibrY4u4Xs5aIw+3mUTrh6Lqd4FvUn0clFEJbVfLN?=
 =?us-ascii?Q?iT9PeGOCYyv6hV/2jwrsIeFUdopFwatTMyltVtzc5e8X5f5rm+m37Zq38s5O?=
 =?us-ascii?Q?J3oLVU2NMWhF0XGVdj18VJDkk0rrdV6ZyWZb2Ma9/oz/LDbcrGsJ/uc/STGB?=
 =?us-ascii?Q?xCQKz0ZmZ2QYpYRtyT5N8hZXj05FBYRrLXJsgMXSLGGmHQsl67LFLfh0+lNR?=
 =?us-ascii?Q?EWUEYLiZDWgnxCNxNAnVIllthlIHeovCd5CsXJhlcOXqMVjnrewS8TWn6ynK?=
 =?us-ascii?Q?h13l/XBcDs/f1ORg0O4PodYZMsM04FCtybcRkWkTDs/PwNI1OW+sa1c1VINN?=
 =?us-ascii?Q?AqQNT3w9zCdsmzc6E54YZM8WUMCInfw5D1ZjU9Dk5RTxtvJk+ppFlD1E4tRU?=
 =?us-ascii?Q?N52NJMAGPwh67j97bNSbHYPWtvXCDCOWxFNfx9FrMp2bhacaHbgyIKpAqOjV?=
 =?us-ascii?Q?7QnkAu0cM7861CXwCJWF5afhoNisAx5zWjqg2jIwIj+HPdyChtvKNVZ0YFvi?=
 =?us-ascii?Q?L+bw29Ddv2QyJz03I8F68eqmumgkjrYc57Z0h9//84RHexeR4ThZ1KC87qVA?=
 =?us-ascii?Q?/7tXtVjbi8QsfdmawDt/WsLOfHQm8iEQ5SRQcXAy44QHhCr5yUF4DgnLPxTj?=
 =?us-ascii?Q?k9uSWXL1xA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	5+BLwGFbbxsOrwK7o1+pyaERBY0vZn9r+K3icaK0qo5OYnkfzNEtv+2RBEsbb9gPWCXaQGDNniUC2TgIeUZVTdrwdzBjLBwkC7+S3laVA5MEuhu0wFEktUVDs1Z5NKRjgDMhVcv0Pdvoii1N2g4Dj8vP26BykhhcNMt2Cr5aXx1dGJHbS97pPEKs2NG1Q9UvQd/5H+asEYk0uG0y3EWOlq2rei75PuHsV3bkKzqz4i73+wtjCui70QzqZj1DFAh4WfRy2Yw3vr2Kf3UkMVrGdh149KQdYask5rZuIXJH+i0QTn8gOuGCFjInHzlUWxKs0KVw0QYSnsQc0uaLskD7R7PeV5YnsIZZKpedQKkDbqg8FxXy0DI0F7VLrv5sr0qqAye4aqXaTYnWKlsEverT/2npe++y84W14lWKRRRSwuL9F/A6tVebvDs6NEupHRPx/mspyK31oNNQiOh/fnBvPAFsEulzmbn2S7h5MDDXuAwj5B0xnJ+hif7weJwzO8RH17oXPrwmFT9CEQrrLDddesfGYWwECT674bgw3iMW/+usMgWCdVf5azro9sykSleMQsrX7pPNG9us4b/syrHUyblGuNlMEZPJalE0DIIgORo=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c640b1c-22bd-484b-5cd1-08de7a743da1
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB7522.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 05:01:20.3772
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b56Q41NdBQYoiAjcUOxALbnyKMuOPCk3dKQDFMxFmm4DO6D2x9Jb+wf9Fy/KAZ6vplbyJzVxP3HoGqGhFaMFEyKbugFQm7fYOXUXsQ1LYKs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB4378
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_01,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 bulkscore=0 mlxscore=0
 malwarescore=0 spamscore=0 suspectscore=0 adultscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2602130000
 definitions=main-2603050034
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDAzNiBTYWx0ZWRfXx0azaSE54QGj
 pmqvo6RHaUMMfrKl9gjglUZu2t4y0tTkNRBkEkNdtu1f5ztOaeyFi2zQXXvr+lo9b/UbP5CnZB2
 W2IuBYEVFlaDNsrn2UdHrLAISAI5qQKA5Qc7NjyEMjLMzAZwT46coxmZhUJTty1I7oDK5+W0LDS
 rXgUzeqlQQxl/rfsN3NspZ+u6HlwH7RWOecdJFcxd2FzsdAeRHdjzyqsAT19pbMaLOnTVWx7xbF
 ry6s0vbZDSrElQnGATP/A+WaPlDt2cgIoExL3btqPTkUkyFEF1NMMwolWLO85oHeNvkW7F32a/Y
 MaD3+sRry5FFVNuWHvic66hnp/HLjPj4DJQjt/3ZKm57biS5WLsVHSX8/GgGcFTYK4NS5yFLjG4
 bgtj31lGMPgVQiR+tx3HPCbpiPHSFI1+/22+3uYL36CgJr9X5RPFYruYvwt3Nfu884GcYGCzigg
 RVpBp4aErmwKDOVHQ7g==
X-Authority-Analysis: v=2.4 cv=Q+7fIo2a c=1 sm=1 tr=0 ts=69a90e24 cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22
 a=3I1J8UUJPc9JN9BFgKH3:22 a=yPCof4ZbAAAA:8 a=1_7tDlk0DE1bGOvobekA:9
X-Proofpoint-GUID: fQ0DrjGsHePFc__0EqyoJ7sLjMqYGswh
X-Proofpoint-ORIG-GUID: fQ0DrjGsHePFc__0EqyoJ7sLjMqYGswh

Even though we do not use them, the GNU Coding Standards expect configure
to accept the following installation directory options as well:

	--libexecdir=PREFIX/libexec	Program executables directory
	--sysconfdir=PREFIX/etc		System configuration directory
	--sharedstatedir=PREFIX/com	Arch-independent data directory
	--localstatedir=PREFIX/var	Runtime system data directory
	--runstatedir=PREFIX/var/run	Per-process data directory
	--oldincludedir=PREFIX/include	#include directory (non-gcc)
	--infodir=DATADIR/info		Info documentation directory
	--localedir=DATADIR/locale	locale specific data directory
	--htmldir=DOCDIR		Html documentation directory
	--pdfdir=DOCDIR			PDF documentation directory
	--psdir=DOCDIR			PS documentation directory

This patch also redefines some of the make variables in terms of one
another now that a larger set is supported.

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 GNUmakefile | 13 ++++++++-----
 configure   | 47 +++++++++++++++++++++++++++++++++++++++--------
 2 files changed, 47 insertions(+), 13 deletions(-)

diff --git a/GNUmakefile b/GNUmakefile
index 38ae5423..835bc9b5 100644
--- a/GNUmakefile
+++ b/GNUmakefile
@@ -90,15 +90,18 @@ SBINDIR = $(prefix)/sbin
 INSTSBINDIR = $(DESTDIR)$(SBINDIR)
 UDEVDIR = $(prefix)/lib/udev/rules.d
 INSTUDEVDIR = $(DESTDIR)$(UDEVDIR)
-SYSTEMDPRESETDIR = $(prefix)/lib/systemd/system-preset
-SYSTEMDUNITDIR = $(prefix)/lib/systemd/system
+SYSTEMDDIR = $(prefix)/lib/systemd
+SYSTEMDPRESETDIR = $(SYSTEMDDIR)/system-preset
+SYSTEMDUNITDIR = $(SYSTEMDDIR)/system
 INSTSYSTEMDPRESETDIR = $(DESTDIR)$(SYSTEMDPRESETDIR)
 INSTSYSTEMDUNITDIR = $(DESTDIR)$(SYSTEMDUNITDIR)
-DOCDIR = $(prefix)/share/doc/dtrace-$(VERSION)
+DATAROOTDIR = $(prefix)/share
+DATADIR = $(DATAROOTDIR)
+DOCDIR = $(DATADIR)/doc/dtrace-$(VERSION)
 INSTDOCDIR = $(DESTDIR)$(DOCDIR)
-MANDIR = $(prefix)/share/man
+MANDIR = $(DATADIR)/man
 INSTMANDIR = $(DESTDIR)$(MANDIR)
-PKGCONFIGDIR = $(prefix)/share/pkgconfig
+PKGCONFIGDIR = $(DATADIR)/pkgconfig
 INSTPKGCONFIGDIR = $(DESTDIR)$(PKGCONFIGDIR)
 TESTDIR = $(LIBDIR)/dtrace/testsuite
 INSTTESTDIR = $(DESTDIR)$(TESTDIR)
diff --git a/configure b/configure
index cb2f585a..403b1a09 100755
--- a/configure
+++ b/configure
@@ -53,20 +53,37 @@ help()
 Installation paths:
 
 --prefix=/usr					Prefix of all installed paths
+--exec-prefix=PREFIX				Prefix of arch-dependent paths
 --objdir=build					Build directory
 --libdir=PREFIX/lib64				Library directory
 --bindir=PREFIX/sbin				Binary directory
 --sbindir=PREFIX/sbin				Alias for --bindir
 --includedir=PREFIX/include			#include directory
---mandir=PREFIX/share/man			Manpage directory
---pkg-config-dir=PREFIX/share/pkgconfig		Pkg-config directory
---udevdir=PREFIX/lib/udev/rules.d		udev rules directory
---systemd-unit-dir=PREFIX/lib/systemd/system	systemd unit directory
---docdir=PREFIX/share/doc/dtrace		Documentation directory
+--udevdir=PREFIX/lib/udev/rules.d		Udev rules directory
+--systemd-dir=PREFIX/lib/systemd		Systemd config directory
+--datarootdir=PREFIX/share			Arch-independent data root
+--datadir=DATAROOTDIR				Arch-independent data directory
+--pkg-config-dir=DATADIR/pkgconfig		Pkg-config directory
+--mandir=DATADIR/man				Manpage documentation directory
+--docdir=DATADIR/doc/dtrace			Documentation root directory
 --testdir=LIBDIR/dtrace/testsuite		Testsuite install directory
 
+Unused installation paths (provided for compatibility):
+
+--libexecdir=PREFIX/libexec			Program executables directory
+--sysconfdir=PREFIX/etc				System configuration directory
+--sharedstatedir=PREFIX/com			Arch-independent data directory
+--localstatedir=PREFIX/var			Runtime system data directory
+--runstatedir=PREFIX/var/run			Per-process data directory
+--oldincludedir=PREFIX/include			#include directory (non-gcc)
+--infodir=DATADIR/info				Info documentation directory
+--localedir=DATADIR/locale			locale specific data directory
+--htmldir=DOCDIR				Html documentation directory
+--pdfdir=DOCDIR					PDF documentation directory
+--psdir=DOCDIR					PS documentation directory
+
 Options relating to the user environment (may need customization on
-some systems, see GNUmakefile)
+some systems, see GNUmakefile):
 
 --user-uid=UID			The first non-system uid on the system
 --dumpcap-group=GROUP		Group one must run as to invoke $DUMPCAP
@@ -136,15 +153,29 @@ for option in "$@"; do
     case "$option" in
         --help) help; exit 1;;
         --prefix=*) write_make_var prefix "$option";;
+        --exec-prefix=*) write_make_var exec_prefix "$option";;
         --objdir=*) write_make_var objdir "$option";;
         --libdir=*) write_make_var LIBDIR "$option";;
         --bindir=*) write_make_var SBINDIR "$option";;
         --sbindir=*) write_make_var SBINDIR "$option";;
+        --libexecdir=*) write_make_var LIBEXECDIR "$option";;
+        --sysconfdir=*) write_make_var SYSCONFDIR "$option";;
+        --sharedstatedir=*) write_make_var SHAREDSTATEDIR "$option";;
+        --localstatedir=*) write_make_var LOCALSTATEDIR "$option";;
+        --runstatedir=*) write_make_var RUNSTATEDIR "$option";;
         --includedir=*) write_make_var INCLUDEDIR "$option";;
+        --oldincludedir=*) write_make_var OLDINCLUDEDIR "$option";;
         --udevdir=*) write_make_var UDEVDIR "$option";;
-        --systemd-unit-dir=*) write_make_var SYSTEMDUNITDIR "$option";;
-        --docdir=*) write_make_var DOCDIR "$option";;
+        --systemd-dir=*) write_make_var SYSTEMDDIR "$option";;
+        --datarootdir=*) write_make_var DATAROOTDIR "$option";;
+        --datadir=*) write_make_var DATADIR "$option";;
+        --infodir=*) write_make_var INFODIR "$option";;
+        --localedir=*) write_make_var LOCALEDIR "$option";;
         --mandir=*) write_make_var MANDIR "$option";;
+        --docdir=*) write_make_var DOCDIR "$option";;
+        --htmldir=*) write_make_var HTMLDIR "$option";;
+        --pdfdir=*) write_make_var PDFDIR "$option";;
+        --psdir=*) write_make_var PSDIR "$option";;
         --pkg-config-dir=*) write_make_var PKGCONFIGDIR "$option";;
         --testdir=*) write_make_var TESTDIR "$option";;
         CC=*) write_make_var CC "$option";;
-- 
2.51.0

