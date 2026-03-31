Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AB1640DFB9
	for <dtrace@lists.linux.dev>; Tue, 31 Mar 2026 01:02:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774918969; cv=fail; b=kFjLP3zFBIokYe7xqdWduPj+8LSuKdQXIQ/gkYHGLq7WqjyawpNq8grO68DJIjLNYPOGTsYBCPglvc+E4cMptGjIAghDIriUNJevDFdKixC1tUYZKyVbuXcMHGmP4CdHTG6QYLe3g667o45t6xXevsQtsH6FB15d+PYWmnVlaLA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774918969; c=relaxed/simple;
	bh=4xNhfebZEkLCWNMcicUlYM0XiWCO4r7L0maZNRESGTU=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ro8B6BFjbyT+CF8JMfw1PbfEtYb423CPmCuqHrh+4iEXN6wkLWdO7du4DJFKBoGuxnHXNHCBKyOSadopq1KrpxSudCXOOvmgXUOrifW8IXnWeTL9aB7lX9L0gfpzTJxCKiYvuwnn6iMWutK0ep7pi6uOhnMWGbyYVrnTiXQgTB4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=YoPT+Rk7; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=tpvkvqwn; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="YoPT+Rk7";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="tpvkvqwn"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62ULmB3Y2813743
	for <dtrace@lists.linux.dev>; Tue, 31 Mar 2026 01:02:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=QwOQBaQgY82TMLSJYN
	BF6swcNBe5C0GpK5ZykaZ4/mU=; b=YoPT+Rk7OsN+Ofkai1hEsvalxfTVXETf+I
	RiG9qrGkR9K6websjOvS5jHqbcE/Koe9CzLhWSXucJWqM4hHtLaleJfqzNcB5w0V
	9Vi6IYfj56q4NLORrFwpNZeMMuXztcVDt4UNSQzqDeXPaozJnsdDs2Yo4N0hcD3v
	JbqY5HdZgA0KtINHvY7LiWpMwgaRY/PtMdasWPKoPyKeEP7xkAaOhAN71OBZzHUx
	EqvUnPwGgSnQnR/kkPXO9i4Mn6kAbe9Xt3PWjx8VTm8HBbFdCZSSEor90ltCNPUM
	ZzlhiLgCwdvbf6MkfFtSohvBKpWCgXJPwRYp/TGzOY5YOiuSnIxA==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4d65w7bb5h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 31 Mar 2026 01:02:40 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 62UNZsO6008243
	for <dtrace@lists.linux.dev>; Tue, 31 Mar 2026 01:02:40 GMT
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012010.outbound.protection.outlook.com [40.93.195.10])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4d65e98g1v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 31 Mar 2026 01:02:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZIouodtAs19Dg17nDq5t+7XmIu5gpnTYCdt3hQd2Lh+TyaMSMcE84Q8bJVet/PUzkNVIp7GSw0Yy9zNEb7nA/7noYVOtoBEnEX7BIvdOTlrOZYIl1MFa4ZTv4dXEk+BmdzkjivNtqVb0zoILtg/NZhM0fsGuA3wFTtDM1F18fdz/waqlaCuGAltKe6C4UsZRCGzu4lHkN0c5Vq+gv5tgpkPkrV4CypPKBoeH++rP3hTN7+vwQ2H5F3bN+/C2IMPrYWf2KcZtwWRDpZRJAY3lN5hWYDAunqCfusO1LgrohFWji9s29uDL2geXKM2vmMH68VmsHiu92K2grtH48Rku0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QwOQBaQgY82TMLSJYNBF6swcNBe5C0GpK5ZykaZ4/mU=;
 b=UqaUJWcGC/UvorKQcRKJHZWaCfu0x8vXpSL+4kaNBWc4CyZw5tlfnFVELNa5lsCgMZ4uoAfv/enmiEdNGgYHd2pIw6mHZsUHYOacuO50aNN57nQL27PcD0ZsYAaCXCDA+KlDX28Kvlk25Dr3/M4JTyPlJ+ppmPWUQhDQrv0eQFC9cP56rCTTi1erN8KE8J9wGsu5U+U0nXghiA+/TCTgbcyYNYRAtU+7whK4wJ+MeiMT9H4vdFMQJ773h6B/sGRsztAkrFTeShKViB71Lu+EBJAsgJHWgxqqMkJOSxXa4SvBoOgFJI4MOoj11phNhafJdx9vwg2JRBR6m/zBqL+ZvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QwOQBaQgY82TMLSJYNBF6swcNBe5C0GpK5ZykaZ4/mU=;
 b=tpvkvqwnTvWAaqYCFIlalZTPa27oQ3FtLJVn07kwY1RfsNJS5KQj9kIw1d9LRGk8okStHslZ6qjaA3DZEd7AwthBuYC8YlZuHvC/uQNcfIJgqiCp6pkRXRkF5DQmHfiSlKLApjaJZq2i4LVuYYPPl8M5nWQg9N0DX9C/eRrkKRU=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by PH7PR10MB6131.namprd10.prod.outlook.com (2603:10b6:510:1f5::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.28; Tue, 31 Mar
 2026 01:02:31 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%4]) with mapi id 15.20.9745.027; Tue, 31 Mar 2026
 01:02:30 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 3/6] Check if the BPF PROG_LOAD is either -1 or else non-negative
Date: Mon, 30 Mar 2026 21:02:21 -0400
Message-Id: <20260331010224.16165-3-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20260331010224.16165-1-eugene.loh@oracle.com>
References: <20260331010224.16165-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0283.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::18) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|PH7PR10MB6131:EE_
X-MS-Office365-Filtering-Correlation-Id: 88884f54-03c7-4dd9-0d99-08de8ec12f59
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	voLQJ7wDSjlRLzYpCu5QUAlBC9JGgbYTJi4wk3hIQp13vSf5V6/ZNz1kBOvqirOkL8/qpbvmvRlLKTJzdqv7gxgv7/g5hEOM9BFrWC3WP/WKoHZTzAKrXiUyndxALDq39BQVN13oTg3L2F1NkrweJXkBeYT/DFzi40Ap1ItYWpPRjIApAvVwNbiqK/gVyNuOpK3crpfEC9bhsVSlzZZ3LQ9nbHGZBLviVzO8zc/yJKOopekdbg/iICL6Po3X1BzFJi8XUZMdQXWCt7yVNOj20cwGgfqxoqeoGcSzI5zdyJDYpNqbMbtZFy6pNm0+wqYqcFrZW0Nz6R/PcfXqAPhnm9kMI68y9fstWnyAQxdaGm/I2wIgj58ZOrz/8N3ZNBTmPxpppkKylK1Qx3seGnWtljnwUbBj2tT39oGN7uPwMG5fEZG7FC88GN+n7e0qlhbmctK7B5Rvmc4+h1iEaymKqiZwTbNAgVfYG8O+kvpJo8diXp4BQE7qPX7cCOGL72ytVLjPChEKJdtz5WQ9tfLONqh48aXdRMD9Kgmor5v69sJp58AKixHcXmtkGlv1KaUKvdiqTTcwWcE2RhBT+LhNBk+W2M50sKDEvr9ySDZYSKX+70K5Ih+ayLIWA24nlwle2NE73FRwra5QaS4qnz6opd/BsMYYji2Cel4FxnG9UaR1EORJrUzaU1Ju6g8zoCpZgy9g6vH3c293uRtizX0IZp30lclTj6gs6FgrobIeqCQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?bOem8u20QxAtmB22XSFiPwUgEDiO2hR3GuOTgOY/ix3HzEokVtSdiMb8+BhX?=
 =?us-ascii?Q?9dRc04d7C5aCWWxq0JdEUXPnzThsFEQpg3ps2wBa0Bih7KjMLnX6CHbHytrT?=
 =?us-ascii?Q?j1nxG0kfF3oq/Mml9XzgJ5059IrySthhFhbBFH3pfl0OKV34QK8H+mhtXCMe?=
 =?us-ascii?Q?oJAkXta0uzHOVhP+qmF2mG15+KC9QnZnUZ6lv0tc2CY7uJp3BGjlh94ABXqV?=
 =?us-ascii?Q?gSjC6pyCXzmvZuZi3PXjCUrBBBNzupYJhlJOOhhCp8O9tdvKdaOYINlxea4R?=
 =?us-ascii?Q?BOzMHsqutexmH9JRYNopG2r+JFj6dmRtS125NRok6NW6lNuahhd4n/6zau5e?=
 =?us-ascii?Q?/ctI8iuy2nauFGZ2BiiE9NSyTlHTvQCmKm7a8JxicNET9hnlBmar/HSkWIlY?=
 =?us-ascii?Q?0rNRCIsIR9k9ljprHNY8jJ/jo8VURs6t9ffInoLTgIDhFs5BMGNVsvAnN/sK?=
 =?us-ascii?Q?rFbJ7hI1TMz32FO2wfkOrDeYWSmK3yGUzK+W3/45ifUz2FkqRzp4X8GWRRre?=
 =?us-ascii?Q?WhhJqGD8Hl47mxUmv7TKkEdE+e+a66FaEbdhB+tiNMGR/Mx4QfEaTYKxxmEX?=
 =?us-ascii?Q?Xs11w9PB2U/HLq/TyUfFCjf1TrRZ8avWXpTFU3jjJ8+U+sFqdmM3Y5d6My8M?=
 =?us-ascii?Q?fy2X/suQe2/lq1mKQEFMWV71lg7VpBZ6JxtmI5NtOlRR6cY2Twd+Gq86l/tz?=
 =?us-ascii?Q?7iQ091GQSlOG74uaoJvM0qATfbJ1QvSAbihPxYHTAu1+1C9Q9OlfU0jNYX+N?=
 =?us-ascii?Q?m+xbzCimftWZz+/eg2TxYZznGjx6fPuuO/+R91W0i6t3QbYa+vmA8DORd+xS?=
 =?us-ascii?Q?/GA5qVolaIi7u0/nhRbQeUAGmKx2rEedCV4KaCMxKQh6a6bbNrBkzXqyDPxX?=
 =?us-ascii?Q?+Ck5SewtCZ/aYS4KpkWFH6qz8sbh0gbh6XnScUUeGu8sfijlpR26uDvf/W/m?=
 =?us-ascii?Q?sSX2idZkwmg29r8l6yL1UMwk081TASgxRBxLx6NLSOGnDRbJzJ5x1Bu100oj?=
 =?us-ascii?Q?5HZjqnokSsRD55aEEKyN+mhIjg4xo27fbocQLLF9medpduWh9WWKdNdHKyA5?=
 =?us-ascii?Q?/VxJiRiJrdSllHzIlNQjihYMJoK1qHsZFXnUJ1UKLoU0/+9SF59RI8UKQDCf?=
 =?us-ascii?Q?a532Nfed4vk0wC9+xLQiHtMXjzz7PTfvKnnvmHPzGYCoY2Uszb3ryQivUAQ4?=
 =?us-ascii?Q?5jWr4ufkT0W+s6p56GTmd9zonv82LgrMEJUXP+HhHIr1vBg58jYcl8D+ZK6t?=
 =?us-ascii?Q?dwWCuzIYDqELARKgOogD29MT02Gpdhkft7RVZ5sMoAeRIRRX5Ky2/ip89g/+?=
 =?us-ascii?Q?zT75QA3+uY38GAhA3DEEwsO7SvgZMrZ29IhrezS+oMXgoy+uKeKgP5MNmCb/?=
 =?us-ascii?Q?Vkh36EW9FNsjQDN1stzlXJrIw20vq/az14gTcOdmLsdaoombgyIiVY1/4BYl?=
 =?us-ascii?Q?Fpm3NEL8jSZLOAQkjAmRYRA1YoA/fuhnLPiyCSNV+Sm1p0uPrb9KVadm2jTc?=
 =?us-ascii?Q?vPTDSJJFzv/jSw2DSZQukH4dFrPbJ0jAo47B1z1pjAMNTIGBdyZq7qjgf0F+?=
 =?us-ascii?Q?Eu1nCg56R8+estMsVKaSYtzvp5zESD/0+9+aEGrxwJej0gD/Pky/C1k16Vuo?=
 =?us-ascii?Q?Q2fCvtKUElcuif+OSqniIEj3SnOAqb6stK29Hef+8gEHH8viSBSVTfRvAb+x?=
 =?us-ascii?Q?Ef/3nlmhACSMkKwDwYmgNZSbgJXpsazJFad5jjS7VIAYPenKDkGYOVEQLnxT?=
 =?us-ascii?Q?c+26/dpGQw=3D=3D?=
X-Exchange-RoutingPolicyChecked:
	IcGQr+FjzAZRaAmMJgWZMIom0AeDeAl671k4ZMzSXw53CR1JuPxGKQVm/E202bOQ6gnS8pIbfBUGaUvsazRv5YJIy8Ma6wzMS7hCfSUrmJds0lCCrBid9FtP0aQEPtbVgyOSgxuQqqSnFy+ULoUIAXfTrfx3L3keudpOp9oepo/NR4L80eIkOali/wJjcPO4SO95V/Dhhl4HHJkhEpP1mcs9xfSgDUARh9KlWV5lb7R1vo6OC26Gne/Dt28Ulb9K+ZmulYanFbKCwU9px7JjiUqAwJAvLfTkjgiqV30+Zrp8hB1EMmm6707LViWnsZ2jAhliHMm3Sjq9BZl0i9Cxeg==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	jyuLBBjo0m+YSr2fTQcUockt+9QCm8VVnzEgHTEwUdbe7ap8ey1j8M0g3XhoFVLSw1V2iYm0c1lm4U8MTJzFPEqeerNAmpOsMDVUqx0ZO5W8rd+IL8dRySOeElmrnmvLIj3IFPnv4rtHqQdkHCEmgl/oTtbdhsEzI60kOVJr8TR8IvVSJs2YxUK2/bUuzDMkWEM7Oj3iEBhcAtigDzzM7v66Ehjw/oNpmPmyOy77OUqqPghf5DsoJ02ztKNFOnIFxmUjFmHJcWJCSJJF9+zTfOmYUwDq/zDA6l75zZHBj42Ba1goyA+xMjOcwF6VNbgL+4B5LgqX49htil4+NCl/LPERTJ4MmMKCynTOGO1o6utgKit1j7suoE6AGhLBblhC5SeUy1cOgauXRuSP8Q5AzWsdBzb6W9UUzLMF5gYTUb1OOmqDT/o74He01Tw4etJVGH+mcvaOYpUVjJlA1SUBeowTjFN8/on/6ucFXSmt8DAIEr3R4fJqxhQv0Yc50ejTbhi937czOsu+ShQc5neyxH00z5TBZnj8wqJ/X01HpKPJ/Ob2lvEoAcY7BQuGbAblzWX9PbXRqN10pOjT5zU301cNLl3NFLOhOgQSbjuiBVw=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88884f54-03c7-4dd9-0d99-08de8ec12f59
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2026 01:02:30.8830
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vtkOc+H31iglOGwOsjJ7DNTtrQsg3Fi8GO8LbmiNqTISTUw+lJy/B80tFDg3MS7HOM4SobC09u6KBOzMR55B1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6131
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-30_02,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 bulkscore=0 spamscore=0
 malwarescore=0 mlxlogscore=999 phishscore=0 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2603050001
 definitions=main-2603310007
X-Proofpoint-GUID: U3WTrMZ6QTSgafY7B10Gh1qMW2jlXXXd
X-Proofpoint-ORIG-GUID: U3WTrMZ6QTSgafY7B10Gh1qMW2jlXXXd
X-Authority-Analysis: v=2.4 cv=DKSCIiNb c=1 sm=1 tr=0 ts=69cb1d30 b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22
 a=x0eKOSpe3m1H3M0S9YoZ:22 a=yPCof4ZbAAAA:8 a=QAln6cyl7LrFMQVIbaIA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDAwNyBTYWx0ZWRfX87pJ75J5yagu
 Zy7bjyei0RK89rCOHxRf7URBapUVPbVV0LDqgR3hOG7MmcZCU2BCa3xRcu8LFNTvBgvEB641Eww
 7+TogXjo2wkdmu4faqbmH/juAExx51RwrZXEB59GUpTBrA/psVRpSvOvsL8y6gLa8j7nQYpboai
 kzFKWwvtl3/TMyDJln73nyFFUhe5oMc50ZLCrGmpgNPi6txiarKQ54F8E3S1QEkkkbM2ATnH2TO
 pFu+w9MM5s4oPJW6iVU1uhyntQRTbyt6C8hIAxfMScF6L/KgK+DwXkBe78rbWuQGHpnvBhVORT6
 jHqIjzE1ogwqmn2r4q9zw0OTU2roWOUjOSzOBvyzJ7EKJqaJ55xArqDoT2QlDuZLo/OVeIsJxco
 Fsy2ShIP2BekGXN8BJAd+JWPjtUao4V44Edshihf40yDAu4ovuYM2w9p1vWfaEJPAT2F/aIV5SP
 Bibqvkmrq8+yDvuPULw==

From: Eugene Loh <eugene.loh@oracle.com>

The return value is supposed to be -1 or non-negative.  The current
check lumps 0 with -1.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 libdtrace/dt_bpf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/libdtrace/dt_bpf.c b/libdtrace/dt_bpf.c
index fb66bd93b..c328f5100 100644
--- a/libdtrace/dt_bpf.c
+++ b/libdtrace/dt_bpf.c
@@ -428,7 +428,7 @@ have_helper(uint32_t func_id)
 	/* If the program loads, we can use the helper. */
 	fd = dt_bpf_prog_attach(BPF_PROG_TYPE_KPROBE, 0, 0, 0, &dp,
 			      1, log, DT_BPF_LOG_SIZE_SMALL);
-	if (fd > 0) {
+	if (fd >= 0) {
 		close(fd);
 		return 1;
 	}
-- 
2.47.3

