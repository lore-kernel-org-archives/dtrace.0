Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23A601A702
	for <dtrace@lists.linux.dev>; Thu, 27 Jun 2024 05:35:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719466542; cv=fail; b=GpK5YEeFtpIKwe8Fvsv/MQDv86NfFWrPNns7YXNajxlmMyAeYVnUcuKImnkGSn/j35w5dcCJJEo6oP+TmGM3Fhu1Zh8fn5iH8yLS4oodNT/q65DPxswzFg317qJcwRjCaJIs+47XyB1qwa0hkyP2bNtmoa37+aSzrj9UGb0pbp4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719466542; c=relaxed/simple;
	bh=5EdN/kAgOSBG2RLDvWzTG5+lP1jgfNxP7d/ApGSzSTI=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ZYKmbo2L/VjBrZltyNPo+0cXDLms7cb89u9EVqOqRPk9b1XEveTfJlLlU2T60S2omP1WGs8mwo9y4NhHMb1pz+D3bk7gyO5oerO+Hd02UjDgMQqnhK9STJc7gGaht2lyE7W5EB9hSwTuzU2mtlxqxWQUpelrxIVLqXSbei8AQPw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=FIXXgUGw; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=yOppKAp7; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="FIXXgUGw";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="yOppKAp7"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45QLMlqY030937
	for <dtrace@lists.linux.dev>; Thu, 27 Jun 2024 05:35:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:subject:date:message-id:in-reply-to:references
	:content-type:mime-version; s=corp-2023-11-20; bh=eKqrDSUGdvTveX
	UncD8czIvFUBrSErbDqUs76f5+oLk=; b=FIXXgUGw+RHB6G2XBszlvImtzaFeHe
	SRqpjuHeTjmV+lEABRseH1lt5vrnbRwxFpep46ZHp6l5hsXG66lSk8g7zhB2EhMR
	GiE6dcyE6wkqIpbsrlTy30X6a5jJb/yPSGjyPLluzT1d1YxTHTdy3+9X7pk791aA
	0phLA+lvJcrbbHmJnSJSydVMHnHgLk7LUDe69ZQS/dYEvwkrC/GuQ3TN4P9QfmIG
	f1i6m99oeKReCv8wesdSsbnbEuvTyvn9GnBPuVRIPx/U8UlIOp4ctcKWGzJWPbTL
	KcnwuA278bQL202egCGqFNu9rgAropE84cXALLYb7D+fyP5Mx3STPsww==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3ywnhb525r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 27 Jun 2024 05:35:40 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 45R5Us1W017823
	for <dtrace@lists.linux.dev>; Thu, 27 Jun 2024 05:35:39 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2049.outbound.protection.outlook.com [104.47.66.49])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3ywn29v78a-6
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 27 Jun 2024 05:35:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EWbB8EEYvZMltMpnpi2YNRvLBi8iynqI4t6LfDzLRJLgoXmRxOD1eMOs9CsGKyE4MSbWW9yrkFeh/gnBjzW0Q+UVGNqn07jZqm0Oq8Prnxddxi5ycTIoV0OXcVmIH5SmmzXq5EW6CoYqsfYu1hlFuCmsEOmUZR/rhkcPem2mhNnzDQeykZHLsCQIYv5qgUsoCC1IKsNRLWaBzmNkPJXFR0xoX9u54RQpAD5S92yKaJWK1Tpec5379kuy+eBfIUe35evaDqV9VdJzeCz8IY6JqM7HVWU4NhfwXUNuSIZZZzzzeCX95yNYkLquck3OJXN+S2P/mcLvKilnoWpE8nPwTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eKqrDSUGdvTveXUncD8czIvFUBrSErbDqUs76f5+oLk=;
 b=Y+D0aobDT6EhGCwcOPW9qmre/R0s+UiZ9tPja4nBQ2DZAAI1JvxSGcY3MPfo8+21iNbNhEOI3S/zUu7WvpGH3ycflCwyA5SdxWIGyYgeDpg7NHZMfPMxb1zrTxURqHVCfZ/gxB1U4a1zV7rSZEG5prOEFFzAVwMOPS+ygA4BSL+kC0HDVP4Z5tqvTUTv6nRxVYpQ5qIGRBpIwEE2kGj17Z0BiJS4JEcftFfvej5jn7Y7TyRyx3x0s9lFQrrHom3whWirhKPQP88VNEhoZ1SBPEFBcYDCcfXiLLl8+V6iA+rFo1DN9GKyJJ2NXsVgME6dqoBgrzeLZVcn+AdVDh0W4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eKqrDSUGdvTveXUncD8czIvFUBrSErbDqUs76f5+oLk=;
 b=yOppKAp7HN8TSrH6hu8QNnCXFKIvwECLg8nfRXDNw1T1T+5iZNs5pZsqr0kVlKcFQr1iZ5RrsKHQqi0S6Z75kHBFctCERbjQCI7k7vv+PI9JYlJoaGKBYadmTlshSQs/MUEDG6bDD0RMRPhrH8y3V2KhJM+FsnWC/B1hCYi8pyk=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by DS0PR10MB7400.namprd10.prod.outlook.com (2603:10b6:8:138::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.32; Thu, 27 Jun
 2024 05:35:37 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%4]) with mapi id 15.20.7698.025; Thu, 27 Jun 2024
 05:35:37 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 15/38] Remove orphaned dtrace_hdl_t component dt_prov_usdt
Date: Thu, 27 Jun 2024 01:34:32 -0400
Message-Id: <20240627053455.21567-16-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20240627053455.21567-1-eugene.loh@oracle.com>
References: <20240627053455.21567-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0103.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::18) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|DS0PR10MB7400:EE_
X-MS-Office365-Filtering-Correlation-Id: 89bc3a00-faa1-4bd5-26b1-08dc966af932
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?OLWKC1zEoU6xKdhF+WYkttIJ0YDoPBnKJ+0q5Iqt0rqs0MXTugQuMscNvQ/r?=
 =?us-ascii?Q?HJCtmTF2ZMzgJBgFtek+NxZ+G8qfoE2zYU4mrQPcgnBZmAB5QkjGsBrT+fL4?=
 =?us-ascii?Q?d4yLgfLnuWN6IE3m/8RlCKh/jpW3lNtgDxmaDC72pFwi+WeZnYQhTct6pm7Y?=
 =?us-ascii?Q?NAo/CQ/hrKr5lSHsSHCHGCwWzf4i0dpvx7tORAqusSIBzF2xxSCL8eVOMCsM?=
 =?us-ascii?Q?aMD0ij0NIdAR+SI/+AmR/M1900qdw2yZ/RMoNY1WxRjaQGdVhssMAzoSj7C9?=
 =?us-ascii?Q?oDR5jEDBOMlx3ZBAc2AZ+MCHZU+39vZxgqMks1lLGcXxDziPXreJCsNWwt1Z?=
 =?us-ascii?Q?OhfPfKkdHncj7Ko5xks2sw6FWxPFfWEh5jLs9MtEAG/RjIG+KZvz+WuRZcGy?=
 =?us-ascii?Q?4YaCuIXxTEAVWZ25/KON5IQO3Yn08BhCMoM8SiBTgH3ZIVhmDNahfx/p8Mx6?=
 =?us-ascii?Q?f8WfehLtSBP2bPi0d5auC2qumHvgq9PuUNd6WD1ximvI7LeUVmjV8vsAVJ/g?=
 =?us-ascii?Q?ZPNuD/o5aSwAo9l4Y7hSYIxPS6xyBxj1WIPZ1KujF4szu9uz4Sei2XQzpoxC?=
 =?us-ascii?Q?EAostcr/QdDFWr+39u8OFT18/b2DAG4/S9VkKmRg3c+OlbOaT4UrDJTNpQck?=
 =?us-ascii?Q?4SLwhbO154d+hiBO0G0o3ZbCBFSP2NUW9wiTREwkuHxkWurGF3V+l4H/Lw05?=
 =?us-ascii?Q?MDxWnlvvG2wfDBcwfkdncT5O/jMlcvxWGRSDSK0SEHQiwUhEpFs2RnQvmkvF?=
 =?us-ascii?Q?uKer5xUy3jNKBjp/Ap+OxviNvCHCUL+lA0gYbLS68Afx6NqhvdHi9bivtYzr?=
 =?us-ascii?Q?gd7QxHo2qfFg8rdF27lSndNsZZ8yD2k2HqGQL3puAQFob4T8oUNlps/iAKc5?=
 =?us-ascii?Q?Ug2G/+nMyRnDj1Y1Y2yD0Yb43GhgbP3pMPtGuBsCXnj3Rh85AI4Hl3ARbUgl?=
 =?us-ascii?Q?riDg5TSt0dhFaBgoA42ExVu5kW23bEyza7dC0mZ5+Aee6zhk6FPDHSJDzNRi?=
 =?us-ascii?Q?c+R2jlMom4mUzt0Qfqek8kopYeUIpIzglUVhH2dH6xv3LQnNjQ8OGjI0DZ4m?=
 =?us-ascii?Q?W6tvw+OzifwakpcE4adMrxuRpYfA46dRv0BA8pFRTq5PS6HUPHfhBl6kunpN?=
 =?us-ascii?Q?wrR897xKTCw8Q3BRh/gLBzElL5R3pDa4gKvCfILZyeXT+RdmC8+ltCewcOmM?=
 =?us-ascii?Q?M3zVUkjJmmxATDykN8zpZ3owqDBR0Py/ELKgSWPHX+5DrvYaszT79CO9JVBt?=
 =?us-ascii?Q?FH42ukSk4D5KIG2/UE1b+TZwU6xJiT2mcRU2jslWTR/PSbelAkdcsskjEV1J?=
 =?us-ascii?Q?bEZ0eEUkTamDmMAOiEVctHobPFHtbjm2ZKPOu91BBuU1rQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?an5d9pmf/fgF3pR4oBs8NOFWrCGaozqcgLRaXeevho2sIY4EmPeiSPexaKRo?=
 =?us-ascii?Q?721FEuLK2qanJlecqwHSiX+SpuzVKofRYvJigoVaESvo9/eujJdNdsnFqzCk?=
 =?us-ascii?Q?thN5AODBm+JPvB5hHZV/I088Y/D2eLSti/kozVRWVFNzw7FU6f6jcL25ViEc?=
 =?us-ascii?Q?8eeUF1saqagOVZbj7zoPOjVMkqrKlTu2og91y23bonTedI7LEEgD/YSdxg/c?=
 =?us-ascii?Q?3AVCg9GZHo2eZfuAEPjmfFiBvILZYk8plhIXpPeZJCEDJhL/lOd+RNwD54kA?=
 =?us-ascii?Q?YsE6V6Wlz6U2IQm7qsTJPRH3qdNOm+jWOhstpdf8w3OiQVKao+H0QLMXnOKu?=
 =?us-ascii?Q?GHohMQQNit5OC9Cj48nZCF9le4kXb2xHl3ng4WaLj0NyMjWoh0tt0mkkObaN?=
 =?us-ascii?Q?1SyF1hHNX7EbHdMtrV9U50OcdWA4BqrXHQhlNuyudPbrWrRbHwhloMP3CBDQ?=
 =?us-ascii?Q?Jdr4wVFCZWCDsCeAMS6qFEoK+BoUIlt57ZSmB441+hX9g9IdWvs+RnMgXshp?=
 =?us-ascii?Q?lWaPWznJXhSsmrnKvH5NIAFPbaXbg0juUjugJTjS0pjG9PYIqq0LeCq6dZFv?=
 =?us-ascii?Q?1sJR/EYIn1FKGwVQm+i0UagA8i9qCKSGHLbO4vuUwbEzWBNwiHC+zxUCKvO8?=
 =?us-ascii?Q?o0qxPoInMBxOUI41DrFfJ0hsU8yYepJy5VjvF7xWq1fE805Ij6I3cY86cV1Q?=
 =?us-ascii?Q?/5eNl2AG9mIcDr+jkcLIwlbmFd++HyjhiyQ5yyoSkIwSuhuLndn+kBhJ4NTT?=
 =?us-ascii?Q?5N+YmvoxgzBsZafSAR7h4aaF6MU1IeuK4nSq1vIuobSmhRryziUSYUNSzfqj?=
 =?us-ascii?Q?BuPFO1P9yXrHeaJ6X20A7Ce8S8BaljsaidZ8HfPV+6K+10FN4Cdm0sMtgFR+?=
 =?us-ascii?Q?J1G4aNPDrsh7BXZGfRfPxQgRLWwBSTaZD5Ji0vG8Y/B18Jz4oiRM8X1y5don?=
 =?us-ascii?Q?ioVNp7x5z0TvaH/E7GiGYkwkXytV1f+ElOHnd+YhwSSdaNIBWbja6kzD5H99?=
 =?us-ascii?Q?WbuR6MlwAo24PTDbqc/lnqneLDQRluRsUqyW5IFn/hK4z9PxzpWe/C5TajbR?=
 =?us-ascii?Q?AZLD54zid40WEjQ6nQfokcoh5W6t5brmA8hj6riU1q4+hAzcvDzndJCoJUl+?=
 =?us-ascii?Q?WutYjV5ln0TD9tTmghHR2DDpQiiuSYYQKl1Tt7A1KuWIC3YKqUsZAKEeEFZO?=
 =?us-ascii?Q?XiXjvkbYxKIwCvyBju1xkoBFdWzTgabGJN/X6aMTlywewpn7GMdhHg/vpOql?=
 =?us-ascii?Q?zn7gWXbrikkGTMKs/GAf1aEDBHN/A/PzirbKM0jpsHKcyxD1Suj0JuxspnzV?=
 =?us-ascii?Q?y++rD+uOKL/xiKw0wEbK69gSxecRDhNVMla2cD1Mvbc8qFagJ1bcBOBJ+ikd?=
 =?us-ascii?Q?4iElcAYz3nW6jTg10L1CcSkP6wQnLvQ4rp/NpbQnjT6kNEkC3IYnJUZ2C1yH?=
 =?us-ascii?Q?3tbwnFzmXo21S0/lOtHfMOoah4+WgAIe7p8fJ6M8IIH53EebxdYEo4li8nDc?=
 =?us-ascii?Q?87UYhEprfvaBnKnwjZ+IqekF8XZ3R9rqV/GcHgbIkVJqbWeVeIVx75SXoPLP?=
 =?us-ascii?Q?FnDq6RoccRzPpzGPvdfMqDbl6XxIbpUI3lfMIh/2?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	eAXLiaBJ2qGHYOxp3S6qBr274chIeSdy41jLD7Z/bn1nISj3wvg0sAfMwXPbiPZTi3nlm7WUCOvIA81HY7OPcxgOPooge8in5/42l7DuRyo9NA7kTcrZdla2oQuZkRs3oYuwkxm8s9fgNiRahuBW41PUyvG1DyMb2jKCZDYLNS03bv+41hwb4kHmiptB2OmrafVI4ZfRY4Tkxnlthth3dEdMROi5E2ks6BPfe30nSDWD7LDbWJJZ6QXQ1uCZvrx3EpzdkjQM85Y7GuIhhjXhTbqqymnwjhh61glRyGwVqLAehs8FTwrVR3cYokMm7kZ6EW5xvau0BvdXe30gBusqZUhNiTMVVgfdoCGE6iZRnxQsrpkeLjRmJi5sFKb3rb5EL49/DlZYzwcVJtEK4EZCpVlREVBbKHK8DsouIUrBw2e1BB+R2HcrJoesjAQ+D0os8oTuBXjHOijUu1waSOu9elq2Uwc1xxQ+Wr0MfNUaCq7u8/A4khAMHN1spmemVi4rf7WVzX3XMxwDTGqpoFQ2m0SboLbMoTcsTvPClBobqx4jcNNFOaRdK03kBR5gXdgXWIcHWWK/8zE7AfhHLU3gfLwAv76f6N5G4uCAmm9RAfM=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89bc3a00-faa1-4bd5-26b1-08dc966af932
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2024 05:35:37.2759
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: da8A5TmuQIQuJSTDbTI/3pLNrH1+8sRkWkXzA1T6F9h/kw28wGKlt2Ix3rp3mexTy6OKK5sZdCZfoMsJr/RnHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7400
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-27_02,2024-06-25_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 malwarescore=0 adultscore=0
 phishscore=0 bulkscore=0 mlxlogscore=999 suspectscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2406180000
 definitions=main-2406270040
X-Proofpoint-GUID: 6M8lzEFu4A0_hLTqzzABK1S-plaWMGCh
X-Proofpoint-ORIG-GUID: 6M8lzEFu4A0_hLTqzzABK1S-plaWMGCh

From: Eugene Loh <eugene.loh@oracle.com>

This component was introduced by commit 95ac5e2496d1
("usdt: DTrace userspace side").

Its use was removed by commit e71a20d8
("dt_pid, dtprobed: move uprobe creation to dtrace"),
but it was left in dt_impl.h.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 libdtrace/dt_impl.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/libdtrace/dt_impl.h b/libdtrace/dt_impl.h
index 3d3f58d5..d15c238c 100644
--- a/libdtrace/dt_impl.h
+++ b/libdtrace/dt_impl.h
@@ -349,7 +349,6 @@ struct dtrace_hdl {
 
 	dt_htab_t *dt_provs;	/* hash table of dt_provider_t's */
 	const struct dt_provider *dt_prov_pid; /* PID provider */
-	const struct dt_provider *dt_prov_usdt; /* USDT provider */
 	int dt_proc_signal;	/* signal used to interrupt monitoring threads */
 	struct sigaction dt_proc_oact;
 	dt_proc_hash_t *dt_procs; /* hash table of grabbed process handles */
-- 
2.18.4

