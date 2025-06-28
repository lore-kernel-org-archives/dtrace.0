Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAE917DA66
	for <dtrace@lists.linux.dev>; Sat, 28 Jun 2025 22:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751149860; cv=fail; b=phS4p+bXdDIYe8C1+WtKyJutsUr9ABCSKAgODggev7E/j+ooyP+4GPkhDzrYQJIT2YVOX8kd8eO0BjL6VE5m2khEpoUOVnul/KSTr5CIukJ2ArPgU9aPa7b0ztJBIThm5SqGM7I2QpOIVGRLi7x9xYarigMrfw1Rz2CVU/InJek=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751149860; c=relaxed/simple;
	bh=5P3ygB+CRnI18BtP4SgbusAjlLq/g+27pJ3qrTiwrYM=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=JuBfvyXg8Sxx4JV/Woe3ga3IKPswp1uIWeISCuDnfDyrQmxIosfe46SbeylBHgFUZGWlMcjS+7FCsL3tZBpboX+q62Behg5oJhwHbsOpV1V6RvCeIi+FuMRIPIlJ4oXrjHseVE4u/acA6I8snIgQ3yKeqrOqdsoORN6dYKQZtWc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=WIuPo8mG; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=kYiZxzi5; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="WIuPo8mG";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="kYiZxzi5"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55SMONoJ012655
	for <dtrace@lists.linux.dev>; Sat, 28 Jun 2025 22:30:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=ci4cc6kBr/ZOgmqkoVjZSWxdD5FFeaSu4BC+0G4MJpI=; b=
	WIuPo8mG/i8+RryAm68tXDs6Z0n4ULkc8ObGg6InJwkzDjpxtZpHEhJpeyKbNHWG
	+PL+yHqhQ4MXqiN6QzS8PocWcxSgboX9jsMV7wzTncbk9MIzMRJQac94sD8zD/TC
	vi7BRqqnBV1goebMoSfAJK1BiiwE/+tE+jTa3a46eHUe4cbleyHTt++G3XTMqRXj
	AD8huKCdPEr8zye1l6WR79c5KB71dZsQo900/i2gTHKE5/vjZXjUVW9qkCYTwj9i
	15OsomKJUoOJTB5GLCUL/hcrpfwXq2G2bvp9MABZAF75Mquja3ZR/5pDTrdpkghl
	vpe1g6BW4QvPNN42ozKBTQ==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47j7af0k0q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 28 Jun 2025 22:30:56 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55SINaDQ018286
	for <dtrace@lists.linux.dev>; Sat, 28 Jun 2025 22:30:55 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10on2070.outbound.protection.outlook.com [40.107.92.70])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 47j6ueaykm-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 28 Jun 2025 22:30:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Pud0NyPCviJhHFN8b8FOPC8VCTehlIV22WabDk6qxs5hjzEau+YSn1ynhuEQ85UIeKhaa+EUvZpVa2KqlaCcrEGQ8b0OAkweHtmTLIGD4+iGmR37pWmAokHjT4H9emDzoAOAVi4eugGGJ4IelJLdAJ/fMl8H8UPjlzu7I3nFAO5OMh/5a0FaHy70cHHZ/4KxCSq2DqK8Uji3dUm8rkd7f/QzF1nR++uaOlpCyvXIkUic6b4E+8fs7Id9pyU9Z06CKWo4reMFxQKJvNOQlONs2K01KWTDmXRTVr29A+j6Caz67RvMpk1EvFu8x/f+jABMb4YKpHl8W45Q5NIhlSyrcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ci4cc6kBr/ZOgmqkoVjZSWxdD5FFeaSu4BC+0G4MJpI=;
 b=R8VDYKy7PIBrxZpt0iIurV/Q47X0YpDqBMwgXdBJkBELdkjU14XYfYm6xD1fPgc5O28YRbyCsB5PR5EEeF+JZjXF9QK8aIOo40dzyjIhtZ3RbXaOSXoFIXxTm89kcmaUNQkYjrhp31Bu7zvkJbM0vRz0vY/xVlTWJN23MLAJT9G9lwm0Xf0y0HmSXwwJS2mQgYf8oYhRPbD1/DG5+Lr7HCwue4aZZe+2x59T7CJUH1zudMHlqabhcnzxhqpXK4gnu2dhIEmzAKE4fVchTxHaOHMmImW8OfmqbnSAIBeywkGnM48lBaFBgDD2JPRT8IDgyffXjI7adeLc3VrhBhOoDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ci4cc6kBr/ZOgmqkoVjZSWxdD5FFeaSu4BC+0G4MJpI=;
 b=kYiZxzi53lSD8iBDq2uwy00ClJyK+EaOYHQMoTz1gq+/baJIREP5Do4W+A5qvkITSSh8U1r4+ZhlEPSci4eFVO+RkdGWcaZ0zoDf1lFCPhXOSTFQ6NG+xvlLaSt2XRheC7K10k024MfsnKiKxwOKnoOkO/HPF5sHi7yjXa0PCUw=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by CH0PR10MB4970.namprd10.prod.outlook.com (2603:10b6:610:dd::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.25; Sat, 28 Jun
 2025 22:30:52 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%2]) with mapi id 15.20.8857.026; Sat, 28 Jun 2025
 22:30:52 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v2] test: Wait for output to flush out in enable_pid
Date: Sat, 28 Jun 2025 18:30:50 -0400
Message-Id: <20250628223050.3396-1-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0037.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::12) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|CH0PR10MB4970:EE_
X-MS-Office365-Filtering-Correlation-Id: 88fff9f3-9ebb-4fa8-25e6-08ddb69370b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+4X6dbfVXWuTsDznJouU0a/IHMBJtXG9INPCqOccQCR9dny5eT7f4+/4Mbl+?=
 =?us-ascii?Q?ApmGjuJ//oWqpdyQih7NIX409LkcMzN+XFg515EBIarmRc1yiJ4NSkSjhTL9?=
 =?us-ascii?Q?rChqlv9AEJy9jpFm0TD3cfiWRi62g8WNPtryXU6zbp1j0CogdAO/5FFR7EPk?=
 =?us-ascii?Q?ZWKCPKuKyd2vyn31xixrlqAXQdmWacIXxQRejnnIms53RmNUxpg7mj71V6My?=
 =?us-ascii?Q?60CUWKIR5u8Z8u5madYM8ejkRD2vVPaAZJDPQx/YfcgSqGqxypp965innRN/?=
 =?us-ascii?Q?4I4ip9KWBJAacIYCQUA9BbVotV4jPKp5rA+GyW6o9TVBWdC1o2lfamopFjjt?=
 =?us-ascii?Q?v+KzK9vee8RnAhHfPhUTmrPoAjew1iL848ldq4nF8d4Mkai/8JshFnJCZBqs?=
 =?us-ascii?Q?6Pdl5kopufQVrG5x8Raxbahla5r6GlXKjv5BoZm3TLFm+WouWGMlGnKZiSbN?=
 =?us-ascii?Q?cKMDk84rdWGRfpjnOboWItbOda3TKhht/cuu83Imp8aVY5fY/d0h9Tuer5QO?=
 =?us-ascii?Q?Km4jQFuP4uhCt8RDA2hdsoB5EMDErn9UtvCcNsjXlz6YfX/+zkNqKPDDZwDK?=
 =?us-ascii?Q?s+yoD1oLYo/6bQIwR8aBoJFK7VOCu7MG9DF1Ya8qWP3nbzHHtmFlcjH5oxN5?=
 =?us-ascii?Q?xIHYRDGA6OKS90KTKmp0Pp6Df07tJlzn2Uh07ng4OKDzrfXs/XTxsvLM7/10?=
 =?us-ascii?Q?56fy3dL7jzYte8tScpHqEcfD2HjG9C3aaJnktVuCrNDaxPP0xQv0S96FPQEE?=
 =?us-ascii?Q?tDuNb0aGdiQt+Lm4W/M3cE512yyYreP70xAnEyTAYdqe4INC3luy8YfAKxI2?=
 =?us-ascii?Q?QDkQMbZDb/YZXnKycDi2QbU2573iF7TARh/IHbB2SR0w/JN7cCZp/+gnBfvv?=
 =?us-ascii?Q?lVpJWDAB3W11EkgXdU7orpcygYMmbs7609hyz+RGCoDXnObWmMpS7ifV2z3M?=
 =?us-ascii?Q?DgGKZ+bdg4slaiu9Ixt8KqiSafFYpvYhkXfwrExxrw50Ewe8vFiCXEjWaA5j?=
 =?us-ascii?Q?n7johG72YCh8GyK/y+S1lThjUmm9fKU+MehXD/16/RCMef12rHcUBSh5B1pn?=
 =?us-ascii?Q?Udy1aEbSUNVJwqHcOQP9QF7RRdPbJkimH8xIOUQK16WeqTLv7QgKl31LqetW?=
 =?us-ascii?Q?nPm53fG0MrV3n1JraZ/S3yYtegGpVKH4ItWjtCIb9Gm/4c8e/ya2bUb9O4lE?=
 =?us-ascii?Q?ywg1mGJ2rSZhJXpW+EVbE1LFp3vP+qU9wcT2GA9On0loYFw8Tf51VC7drTeH?=
 =?us-ascii?Q?8+2DLmrQV2zdEXYrodDhLWUYN3a9WE6MGgjw0rdv5IOhqH4oO8Xdx9LDf/xS?=
 =?us-ascii?Q?HLQSSnOUJ00tQtyT2yH+4Sjv5g8R8yByHuZx+LjaEaj2abmdp8tnf/PCm1wj?=
 =?us-ascii?Q?3TdSi1GtHniReTrSpA3UlSbL3Xmac1KHrQjTCkKdNQpdTi779rAaSR9B8uTd?=
 =?us-ascii?Q?77PQ8tMXLrQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?P71yxQBxHiIuE0TtDceivaL9sILNGPQuAKpLHfSfTUb+7K2gh2gMQaDqf+yB?=
 =?us-ascii?Q?CRvujKxKIn8QAYbfbjIbc5Ot6LH4vXRp4h8Uihx9JgK6/2GGEoKcSuPe/d2C?=
 =?us-ascii?Q?2bIxAEH5ZjLWnoP6u20BhuNov8dS374x9GeKEvBxn7zOyFLRgQ2Xbe0z19IV?=
 =?us-ascii?Q?8HVDdh8ckXTbhQqLuSxaQuqZURpZdzQQqcHScRHZpJiiqe7xv8pZScYMtdje?=
 =?us-ascii?Q?0A7G9P4Ym8w2QLkVVMMfuMSNW/TxHb/Scn0JTTLqT81KeIeLhtHeFsQvpNND?=
 =?us-ascii?Q?YxR3TM4JJ2TtkM8qSMlqtOG3skz+jQGXbdWdvxHm3tusWI9NN7Fi4mXxpWvL?=
 =?us-ascii?Q?vgg0Ah7aX1R1ucUxXHZrfVWoUm0k4+wpCE22pJfPgEhACUdiez1dL0Sok/Pi?=
 =?us-ascii?Q?4PPcI84LPDHh5y9oJRXQQ5ehv8tL7QrO/Bpl44E0/H8O2p+0X9HIMINZZxre?=
 =?us-ascii?Q?2FgI8kpU3ruPs3GSvOv0udTG2FOYEgRmKVF4fXSHqyLmduAzsaLrBB2zKWY3?=
 =?us-ascii?Q?cALnn9OcYP4mK1vf2I9DWq7eR/EK3COesJTh6dEOO59TZxVPSEqbDsbeKgJl?=
 =?us-ascii?Q?OjItffADS7S3+UG90sAV1l1cjM8XTsjWeuNGUtbOQCoPluMqPwNP6f3QXm60?=
 =?us-ascii?Q?OwW17t39uAAHqyzZPu1GfOXXVobeuIzsgUx/B78frO4KuIp2KLyzNSPlt1fP?=
 =?us-ascii?Q?1OgDx8y3R4mWrqyVaC10+kr+4vaJwDUNWIbLFa9P69JXXv1B2u/gkTCBKPNB?=
 =?us-ascii?Q?u+sd+z4gz7TIq0e2s0UhQoXaRBf+qvnbfDHydwreYXE+lsQAjc6tSkjRtsSv?=
 =?us-ascii?Q?NAO1IBM0/3SBBLUprJlZQnMY58eESuGcyHwZtmW1IMou0bxc10dDFpnTJ3oy?=
 =?us-ascii?Q?vtXsymnu+IvE0WHQEZLjJP0zGY9eZG8tnM+FcH6j6tyKck8oPh4VnXGGFQbR?=
 =?us-ascii?Q?IbCwRCI3cWKbGsFIFEASMeG7tnNiyw5mR4GBTxTJqpnRA0rFndcBAkWJTy02?=
 =?us-ascii?Q?5Sleaw5u45Ykvj4LXecDvWsMTFJKqZOJ6YMKz9lsls0/E7L362yU3Kk8fHjJ?=
 =?us-ascii?Q?XXiMSDIv+UvHhnkBW0RH4jcuT1BCwOqYY7OX+qxO7gdMhV0bqtIi3vr9aZAY?=
 =?us-ascii?Q?ajtmHstvCxGJGdlN38BA3Vu+o1Ccuya8GC8TIu0IMuLaAJDTqYhJe6b34DSI?=
 =?us-ascii?Q?+1peAF0KIw1oZY24C7ibAPQpOqIpW8pAuE1M1itY5/sdoZtHNAEjfE3dyLzJ?=
 =?us-ascii?Q?S17yUSUqG6Dyc386yeyK8JA5aoRv+pjjDZ1T8JKCrz0w2GfpzlneHUujlVUZ?=
 =?us-ascii?Q?GByBAeDBHY8fA2UrCmBm4UnJ2jfbkvNVh9ntNJqRlKRBqb9KADucdbDHduRT?=
 =?us-ascii?Q?L9083KN4jWx3v3S3h/JrHHBVxA9wtOmYo3QyG+ZD8WlsKf9HyZXYaxkFOJ6P?=
 =?us-ascii?Q?8SYf/Dna5Jg5v9522UTKKu+SVwaUah/qMwMty4W7TcdV0SKw61PZkocLSg+t?=
 =?us-ascii?Q?4Z4v0sRkTojODRk3rseqcUbNWYAAYEwAMBx6coCuBj/Qn61d+/SDu3wnUL0v?=
 =?us-ascii?Q?VDjjifKdCUI5uju+OyT6a1ae8LjUOE8l3D/3r97C?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	nhHryWjXC2PuyYnrViZo5pudGzEwpIZeo0f6HeV9IIdrMSQseZnPq9ahQuFQVXamGFf/VGoW37V4aP+M4u9dWZVHRZqu/vNnBSafXmZBeOIW7yEYLPBNX1MZ+8EGuQXml7llR9KBH9xb7mW729oQ5/KpWMsdCs6LHWesx3dOjZAgTjyEvjQbZI3wFySV3G633fFPV5uGDf4hrWwbTRbCvwj3EVl9Zjm9Pg2GjHtomiBH0ZOSBzv6gaAaOs37dqtD/iI10CvkSgiLuDZZr17XSwkQs6U1V1GHeBSB9Gllqh1r+lNYVoBMRoSS3T7IH+rSKZiMMRzzhVLDfUe5bJVfS+blxnQU9sP3HcpQJVUNyO1GVWWXKpEVh1J1uX820NBPdeylFcEiJ36s+v/a6sVusEBkUqBfZsl6paomPUxmxp0VDRkjmQbG87RhtJaL6IHl/zUN8AdwP2M3R0bPpYLXKvggdx9G3Z710N70GVzdDfKoQydKPUXUR0hzu/O05ZgnsSr+6pAs5QpBnCTgixogS+eJMe0aalxzdYl9ZHWxgbzPQv06aS5tLZeGGBr0a9Ep/i91xieewqukK2a4ECOuLjcaT8XP0EzbDI3PiV63S4Y=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88fff9f3-9ebb-4fa8-25e6-08ddb69370b3
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2025 22:30:52.6420
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aLz7ROzp9hV3AfEWYbfY5R2SkBeFV8LZ+gmzODXwwJkAmfZErzhdxVRioVrydYtpRw1mds+r2UGhV8lYvxNnIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB4970
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 adultscore=0
 bulkscore=0 malwarescore=0 spamscore=0 phishscore=0 suspectscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506280190
X-Proofpoint-ORIG-GUID: UMntPm28EFvdoolI5Nrwzn79XjZ3pBoe
X-Proofpoint-GUID: UMntPm28EFvdoolI5Nrwzn79XjZ3pBoe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI4MDE4OSBTYWx0ZWRfXyjDLhLRhvmBy RWyuoZAYuXfBZdl3MjbjOduNug4YmrrfofaS5y+AXjmtTvqpcQBc/2Srs7F1seQemaenTm89j+S aEBxtg5whby11s0Fr8hsWO98vdlVNGzQUDpT4YM9neQ4gK5JdHqAmXw7Whjygr9VoLwAKjl2+MJ
 xN1bZwSs/hROGo6ltTyZV0fw9Dmoe1qPGClO2HY/O7bkFereyQMTARy/i5fJLLcmHm+9hovXrXU tIwLdqwcE4vCMnZyKXRZlxKdccAELsq07ObjPZoGFtZ49SpBttvTt9+Wf3wjPYsCVQeC+06lvp+ uXKAPIzp96c72cqbmF3klTUfCh102BMPC2JUPW7cJ8wwP7VfvzrOG9Zv7nehZAaxTYQCliIEPQC
 Z8kJZzDBc/JNC0K/WaDCNq93wTEJQai1oBWZ78R4R6m8N5cipwIO37PF06Z6W+9Q7y5slm1Y
X-Authority-Analysis: v=2.4 cv=b5Cy4sGx c=1 sm=1 tr=0 ts=68606d20 b=1 cx=c_pps a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=lxA1Iev3mXehMrWvXqsA:9 cc=ntf awl=host:13215

From: Eugene Loh <eugene.loh@oracle.com>

Our luck with this test has been quite good, but it sometimes fails
to show its last lines of output.  That is, we send a USR1 to the
trigger processes to set off the final output and we immediately
cat the output files.  If there is any delay in handling the signal,
the last output will be missing.

Have the processes terminate themselves when their last output is
flushed; then wait for those processes.  Also, skip testing altogether if
there is only a single processor to run the two, hard-spinning processes.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 test/unittest/usdt/tst.enable_pid.sh | 17 ++++++++++++-----
 test/unittest/usdt/tst.enable_pid.x  |  8 ++++++++
 2 files changed, 20 insertions(+), 5 deletions(-)
 create mode 100755 test/unittest/usdt/tst.enable_pid.x

diff --git a/test/unittest/usdt/tst.enable_pid.sh b/test/unittest/usdt/tst.enable_pid.sh
index 7f4f68698..296cfb382 100755
--- a/test/unittest/usdt/tst.enable_pid.sh
+++ b/test/unittest/usdt/tst.enable_pid.sh
@@ -33,6 +33,8 @@ EOF
 cat > main.c <<EOF
 #include <signal.h>
 #include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
 #include "prov.h"
 
 /* We check if the is-enabled probe is or is not enabled (or unknown). */
@@ -41,7 +43,7 @@ cat > main.c <<EOF
 #define ENABLED_UNK	3
 
 /* Start with the previous probe "unknown". */
-int prv = ENABLED_UNK;
+int prv = ENABLED_UNK, nepochs_left = 4;
 long long num = 0;
 
 /* Report how many times the previous case was encountered. */
@@ -71,6 +73,9 @@ static void mark_epoch(int sig) {
 	report();
 	printf("=== epoch ===\n");
 	fflush(stdout);
+	nepochs_left--;
+	if (nepochs_left <= 0)
+		exit(0);
 }
 
 int
@@ -79,7 +84,7 @@ main(int argc, char **argv)
 	struct sigaction act;
 
 	/* Set USR1 to mark epochs. */
-	act.sa_flags = 0;
+	memset(&act, 0, sizeof(act));
 	act.sa_handler = mark_epoch;
 	if (sigaction(SIGUSR1, &act, NULL)) {
 		printf("set handler failed\n");
@@ -172,13 +177,15 @@ for pid in 1 $pid1 $pid2 '*'; do
 	kill -USR1 $pid2
 done
 
+# Wait for the processes.
+wait $pid1
+wait $pid2
+
+# Dump the output.
 echo done
 echo "========== out 1"; cat out.1
 echo "========== out 2"; cat out.2
 
 echo success
 
-kill -TERM $pid1
-kill -TERM $pid2
-
 exit 0
diff --git a/test/unittest/usdt/tst.enable_pid.x b/test/unittest/usdt/tst.enable_pid.x
new file mode 100755
index 000000000..9506674ee
--- /dev/null
+++ b/test/unittest/usdt/tst.enable_pid.x
@@ -0,0 +1,8 @@
+#!/bin/sh
+
+if [ `grep -c ^processor /proc/cpuinfo` -lt 2 ]; then
+	echo test should have at least two processors
+	exit 2
+fi
+
+exit 0
-- 
2.43.5

