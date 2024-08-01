Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 721FB189B98
	for <dtrace@lists.linux.dev>; Thu,  1 Aug 2024 13:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722518552; cv=fail; b=QKQBlQg9YCmZGuhOwhckoRailyeLArtJFK2Fu5+E85k5470FCYKQ+9XZ7bzdNdMcOSjIuvD1ciyM3flkKnu4hFQwfKexK7dLLqrvJM8t2pjRTpBDAUkzax4cncjKIWY5T8ZRDtsQ51+RdhRaMYefHagUBn6I+6uK7Zykg1IeZak=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722518552; c=relaxed/simple;
	bh=vyeT834MNH3GAHzmxdJxMN3z5deyneaT4w4v1JAh/nU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=YyCImxsfrwrMJ7sZGpAFcT39RyRecypYibtyJ8/sR4J8Kvo3V+rsRJp4j3cOTbh8MchmC9wJFiMFB+57qAIH9cMtD+4j6BEEgDVVbeXu4Di8DuKmOte5HVZwCT2py3etw9AKXTi4aWAHKE5KR82cojcYsGi5eV90iMSym2aV04I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=TzujzBiQ; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=SdCiUTVf; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="TzujzBiQ";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="SdCiUTVf"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4717tVBk030724
	for <dtrace@lists.linux.dev>; Thu, 1 Aug 2024 13:22:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:content-transfer-encoding:content-type:mime-version; s=
	corp-2023-11-20; bh=iJuKy72icbYu6nRsou1aI77xX/f90M7DeUQLQ0D3Lho=; b=
	TzujzBiQsYR6aQF6SXvnGiAegz/OnrVyM1+fOOnQ+bvcEpzYaKgk1wUAdDsYayo6
	rTDuxoDmLFhWUs7jhEJSiColRYsVffjP2XE+dsdGS5AQwFrK926Bl9rGGfPvGSCA
	qXPDch5ph7cDcAhFhrpGRctyHcNivHsHJPN9Dj9WceO9ueD0YWDkduG4hHRMo06L
	Q3sZiNcnSpcWX8czw0FKM/RUpTxhtsDvAgZUE6jsZTYGCcX6mBVkcYQQP6VNYixP
	2LNv7lCDDaCcEzSY0Shxj/Sd20smqEJ94A3Djaoy88EzT/l8DO6PyQgDngDfx7r0
	bvKeJp3SVSn7Vu3s2ekhlw==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 40msessqj0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 01 Aug 2024 13:22:29 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 471Cq61n037670
	for <dtrace@lists.linux.dev>; Thu, 1 Aug 2024 13:22:28 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2042.outbound.protection.outlook.com [104.47.66.42])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 40nvp06fpp-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 01 Aug 2024 13:22:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mvTN9agr2VdQ2XkgoJOTsxr3W+nLijVRRdhYQ4GAEHNxp4exE9XcIRIPXgZEfrlAZTolm+goCXeTafCYT0KQnZoPuJKeRFsJVvart6OcVeAbEUpwPpuv/kejQ+dbtPUQqBO0mOEPdAWdyhQaFZTCTWL7krjPneaqIGSjaL7mZ9dvH26S5X/TVEveEeXlKjH8wwKimM04i8rLP3PdJ9NYY7LqszRs6Aix0qULD0GeLyu6g0/wxy7kcjbyZuJ749zr/Y7AO80Mq6fTVAQBl6nuPiakxVFILaIau7y3hi0p0Lq9HHaKXf1vpiL2JW2NqJ13cUOPCAHhzKatL+VYgQDnmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iJuKy72icbYu6nRsou1aI77xX/f90M7DeUQLQ0D3Lho=;
 b=kVziAP752FCJ8kMbgBwn5ME7lyfQodUwCOVJ4m5CUV4C8hM/5FbodQ6zGuR7KreA/saID5g61Y06066dU+X1ecH31gahoBBdScglDWFzWtO07E+UULk+AKp5wJ8u4UZpw33WVSt2v3s1NYGx5TY9pXAWyuuTpKHC3JlZ6WVffiyTMalChzQdPk2mrO6VtAEqOYXur0Wiwa5U9kXdNAoLvoGQF3RaXoncwTMTgCSwt3tk/ImRXh1tBCEB7rlAx8BcN7UljUW4QdLNrxu8lbr6Lb0d+V+cDWqYwXPEi8v8uwIQF9yAYGbcGpYgXW5dzb/JYf3kbETxYx9lPHdbcWPLhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iJuKy72icbYu6nRsou1aI77xX/f90M7DeUQLQ0D3Lho=;
 b=SdCiUTVfVT1Vjkvh6acsWS3fD/6McFd30eDrEZV0tXzfFXZBAUh0gj7Q93t+Wli66BIOti9WOvrDfXlHtWXl568jfwHxSf73kNTFSpRKTcEfmViOi4WyEw3VGR1z3YlRcLsun8dQGw+XEf8uEZ7sIDJPdmfo9lzLh1uCFfvrE9c=
Received: from SN7PR10MB6595.namprd10.prod.outlook.com (2603:10b6:806:2ab::18)
 by BLAPR10MB4881.namprd10.prod.outlook.com (2603:10b6:208:327::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.22; Thu, 1 Aug
 2024 13:22:25 +0000
Received: from SN7PR10MB6595.namprd10.prod.outlook.com
 ([fe80::4384:e7a8:8394:dfbf]) by SN7PR10MB6595.namprd10.prod.outlook.com
 ([fe80::4384:e7a8:8394:dfbf%4]) with mapi id 15.20.7828.021; Thu, 1 Aug 2024
 13:22:25 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Cc: kris.van.hees@oracle.com
Subject: [PATCH v2 3/9] build: track configured vars
Date: Thu,  1 Aug 2024 14:21:50 +0100
Message-ID: <20240801132156.286780-4-nick.alcock@oracle.com>
X-Mailer: git-send-email 2.46.0.277.ge12b8151ed
In-Reply-To: <20240801132156.286780-1-nick.alcock@oracle.com>
References: <20240801132156.286780-1-nick.alcock@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0084.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:190::17) To SN7PR10MB6595.namprd10.prod.outlook.com
 (2603:10b6:806:2ab::18)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6595:EE_|BLAPR10MB4881:EE_
X-MS-Office365-Filtering-Correlation-Id: b29869f0-cc0f-491b-e345-08dcb22cfbde
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?HD+w2kaUnv9LOphcqzaVMXpIa+vRvqj+zRnI0eVpri0r5tazN43n1yEQOuyd?=
 =?us-ascii?Q?UJcd6VmKWQanoYHenNkanVVqdjObt6IoDXINjjhqU/lxePCuXCqx9J0dus75?=
 =?us-ascii?Q?IbiX5VlqLOagXUr2Ad8m4FBmEhz3Vo9zV+BN06FUsk+1BNFfKbCPbVy4yyt3?=
 =?us-ascii?Q?4TPKZtHB8KSK047rCpuxEtw/vucs07nmwWO/2YC3kUezVSdZF87wRNtwfwZH?=
 =?us-ascii?Q?mDxJuLohOCIIDHd+uMNMEcgjEAufwnIWshOi6LdOqzYNcnq7TZ6USVEPcUne?=
 =?us-ascii?Q?I/mk1ol4ZxEdyeFXK8M7rz1POh76JFemo+DoQIbztpRwDVjeLfYnp0EfBbB9?=
 =?us-ascii?Q?3qDfHPG75UWCeKFHwSPSBggjQ4jUUhxuTpnw895aIeRq9h5FtZOnbIAQ7jyI?=
 =?us-ascii?Q?CgBfpIGxx01jeiWQsOCJp5gXyCLFdmYZ/9u+ydCy0rvsRXP0lkzmHDqC00qC?=
 =?us-ascii?Q?FC+hdsX4AKN+EvETLRoCvUNqp2Rd7n8Qzvu8NJVHsowZPEEzdO9obKFRx2On?=
 =?us-ascii?Q?a5q5SurqacaLA/OzlagXRUgIcCdRH598OXic1NJfeyokA2o2QDmX2k9Z/7Z0?=
 =?us-ascii?Q?8ya8TDChr3AuSkh/jFE2M4+GGPSJwo4Lnf1T4OckhJoAPmoddRV5kx3xo7Gx?=
 =?us-ascii?Q?xdY2lFCC3zF0+sdKFlcAJNdZk75VF1i7+nprmEFH4KK8/jqFvwZAJKq/mzYy?=
 =?us-ascii?Q?0/ew9BnbPVGq1TWYgNj3pV1X+fUFtYoI4rdscUNOLII7j5B0ra2TrLCZcOn/?=
 =?us-ascii?Q?tzj8yQQVAYMVuuFVnLzxNzYxwVrsC7qUUM6WxWxi8NlO9R1mlkjj+bUqXCUh?=
 =?us-ascii?Q?0DxTmsRzUTzcsiYw4mRfVAJsQt8fXOy/NpJJUZ57UH4zMsyVRMSG9blmFWse?=
 =?us-ascii?Q?ucqn8sB2WMnUKMYYF2vDVqNR3vzcyB502lXUH5Z0watZwlNNpNsb5E6jqIvE?=
 =?us-ascii?Q?RnrRxSFQEwDIQLe7gAf7/ZKvkW9CwRp5ZuVMlAUL3UBjFQseRpcHwFRvI/nq?=
 =?us-ascii?Q?G8d8FT1PV9uvsjTKa4gT4mFIuKItr/9XEVYmn+T2pnJFeECN/NJWIDuiObT+?=
 =?us-ascii?Q?dczD4Rs9WL6vhnaDwbgpXCijE3nbsy3iI1lN2GRqGnW2C/LURDLpgQoQlT56?=
 =?us-ascii?Q?YWpxhvpNMyEMKMrCWnyb39SdrbOflkiZNizFl9QUNUXd+ro1/P0eFzWD5tAO?=
 =?us-ascii?Q?Fi7eAdaeXW2RJELCEsioj49NmR15YXllzxn4YA1aM5/9ljV930lnSpeccQe3?=
 =?us-ascii?Q?9/xL3ggjAqCprL2tBTzHX5pyWU923q84KwBQA47ejvXhhJglC8jkPNUmTq09?=
 =?us-ascii?Q?9aFxn0Avg0FALu4WmZakGWSSGnX0gclZoCmPE+811gfEsQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6595.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ibctTw7Y6Lr2o6xOQf6tkRy3yheSl7EH+2P2bnYDTIzaXUUUd8pBGuuElWf5?=
 =?us-ascii?Q?W/gpvnbOmbTmGXRyStzpNtwHrx01fZbVpr5rOLSGWlgUv/CLf9sqNK0WQ79b?=
 =?us-ascii?Q?Gd9DIKr6YEwGnOPfMAsJXvL+WAmWRuG7CR7MzooDtlrA6Oa8A2EikqIAv3Wq?=
 =?us-ascii?Q?iiz1fw/voNJuzYtN5oIzf5ialG1lcYn+mCxtnO8akc1TwM7LUtxEQx5pwNqJ?=
 =?us-ascii?Q?N4F6jouGXBTRiFQi4tpcuVb/xn7WMGW5cfgwmC5uT8tTbqrhTdJgN7X5jgqM?=
 =?us-ascii?Q?XUuZGEw3Jal1WM1kjZ2V9WQpGyzcswpbCq8JqRbCiIdWEsRZD3BoBxT3Q20+?=
 =?us-ascii?Q?BOgV4izUw3qVywm/JiZZneeAnpuPy+YIX4H9EwTUnvImDXNAWvLrmtLM00x6?=
 =?us-ascii?Q?Fr2Qy8j8UnwsHpCq1tyks/ebuwhKWIn2pMEQ1UIxerU/89wKTff7fKK4aTBg?=
 =?us-ascii?Q?/rKRCHfwTBk1sblj8Vj+BvnQTxiIpdkTdSJruo9oSBpQHcmVzl5nVF1sSl/Y?=
 =?us-ascii?Q?hqyrbEWrEPSwpZpLTnCngucyiY3c8dym8qBGXkVKLamDNMKd5bav3bGd+Mrt?=
 =?us-ascii?Q?zGGC+ODZcquc5g++hEEHNoKdJQh3F2neCJj9P2wYV6WDmrNMsgSyoH8mE4aB?=
 =?us-ascii?Q?8ttCL0DABmph93CrrlT5TUuWPPD4Mv3iBfeuhdh34i52HUkrUPNnCwhIKJZe?=
 =?us-ascii?Q?whbRdyl0rm7D/J/fdf3T2pebrsLGTXo0t5A8O0LgO8h57U7x0+F8TK8Ii2mu?=
 =?us-ascii?Q?4+Mm6+CouFyZruLpEvWf7e+12aqiA7YTQXEonmJhf2lEmz+7XbjSO3k82hqP?=
 =?us-ascii?Q?M0DKP8Us4qhJdj1ZwMhutZ7srvFrsYgm7SAyhb04STxPUnt/Sa1cZRv8+yYi?=
 =?us-ascii?Q?2PIyRI2QhGutzx873zED7xTUb1RQxJ5UoAc8MZLf9M4hlOSp5CTeBX9VN6T5?=
 =?us-ascii?Q?4Qt7cqod1TivAY9rRrk6Z2fRICSdsylxZqAcCcZWRzx2FRq4Mxp2NoGWfSMO?=
 =?us-ascii?Q?PxzR2CMWtv8w3wwChRpUxOc+0lt3YwNny+KBk4oizbqV43Imen07iFc+Jj3E?=
 =?us-ascii?Q?WCwCmbKprmLVhowHfuoPSFaDzlpGFNFqZCpaKsn25nGuoujsmfsNph8Qxx+j?=
 =?us-ascii?Q?ubvv8ARVt/3jZL0rk84BMqnNIwdljo7r37dyMcfUJAkT9XdHV/9G8AF2sKV+?=
 =?us-ascii?Q?NNm2muLXKte//nas84UuEP+UTzC6iXrzIVJ3jRdXsxChPc9lOn3ZpeG7d/qi?=
 =?us-ascii?Q?25qLq7otydi+lePi2YgMZ6g3eBrVB2DGA+GzKIe9Vk2vR9eE8JpZfzrr8TJN?=
 =?us-ascii?Q?ahtRBBLro1CWJKZOFH91DiuB4cV5smkC0U4gUd+oG/+MlzjRLSQcS7Ovf3mR?=
 =?us-ascii?Q?Dq/kRgx0+dRKOK5S3WN2Dufh0sxccLz7qmBBsBiOeGJc8T8J6RrymxcOJUJk?=
 =?us-ascii?Q?eazy80cl1fIOK60tkotiJHJiu9/ecvFf9trcDqSFbM/NdVvxdbzRvoTcSs8V?=
 =?us-ascii?Q?NnBR8PsWIi/0GeXNvbsofWRqJdzh1nX8R3yfmInjK2wsdWGFj6iShPUHHfV5?=
 =?us-ascii?Q?i22HG8Kh4qAHXIZVoqItc2d+NVP6oMtaBjIkW96DcVad7bmI7dmVFbqzh7zB?=
 =?us-ascii?Q?lw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	AJIN1m/X0dnebj0uI3PQz8rX/5wNFwhtO4IY2QPfNDh6SVDMnDQRssU8uosr8Sj5QAum+WfsVzgRC8Wug4pR/ySOe4W+dIgIbMnUwyXb6Dn927MPFROlQt0qlG7NYbJdOYn8z9Xw1qozMSmtofLphutfbidEv4oyfgGb9yzzCxUcjN6St7uIRpo885dQyKI10hqZOwfveNCluESZDIFuqjb/IQ79ekd+ehs1za1uoRC01f1ly5Njh72s8dr9lBDJgEgKJS4o0jBhSz2GgKpX7fSQxw1jP/sjlxfYVkPFRBCNYmdlbBmiBt0sBqy/5ox46f+aWn5DWontG5lPKLRmfy+38MauIEIZ3KAk8GDm9xdqEZh06TWnZQtzTiVth+2jXTcQghssAiYUmxtaBLoiGupYE2lJNk5T3kEQMegVxRca77wR65eX+mLIt1Ox3nh2XREbZNOXugwxBkWLRWBYec6zwz/WwLOLuHpH/GW5FG+doOzLuSqKGbwDv4m+LBjMF0+a+Htzw4D7gaoZJAn1p0tHWKM5cXQeTIEoBghLjIW/wZNPaHDcSA8fu0fx5o0scl2XAftjroAd294hNyNwXlHSA4yx+9qBX34ot1pFPDk=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b29869f0-cc0f-491b-e345-08dcb22cfbde
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6595.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2024 13:22:25.6157
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3f4WMXpcOmUaeEfS381kJ/qTXrjCaiqHaXn1FxoiT7o8GVoUB4sZSX2nHKqPySZwK7tVsz5F4xcn+OfdlkYByQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB4881
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-01_10,2024-08-01_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 adultscore=0
 mlxlogscore=999 mlxscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2407110000 definitions=main-2408010086
X-Proofpoint-ORIG-GUID: JWM22NfS3T45daraw9bFQeb67PvptKt7
X-Proofpoint-GUID: JWM22NfS3T45daraw9bFQeb67PvptKt7

This lets the build system determine whether a variable was
explicitly set via ./configure (the assumption being that
if you set something explicitly, you knew what you were doing,
so e.g. if you set the --systemd-unit-dir to /foo/bar, you
have also arranged for systemd to look there for unit files,
so the build system can install the systemd unit files there
on the assumption that they will work).

Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
---
 configure | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/configure b/configure
index 462548bcc69c..fb9a45cda1b7 100755
--- a/configure
+++ b/configure
@@ -17,13 +17,12 @@ write_make_var()
 {
     local val="$(printf "%s" "$2" | sed 's,^.*=,,')"
 
-    [[ ! -d build ]] && mkdir -p build
-
     if [[ ! -f build/.config-vars.mk.new ]]; then
         echo '# This file is automatically generated.' > build/.config-vars.mk.new
     fi
 
     printf '%s=%s\n' $1 "$val" >> build/.config-vars.mk.new
+    printf "override CONFIGURED_VARS+=%s\n" $1 >> build/.config-vars.mk.new
 }
 
 # Write out build/.config/*.mk and build/.config/*.h, which are the same
@@ -115,7 +114,9 @@ above stick for future make invocations until "make clean".
 EOF
 }
 
+[[ ! -d build ]] && mkdir -p build
 rm -rf build/.config.new build/.config-vars.mk.new
+echo 'override CONFIGURED_VARS=' > build/.config-vars.mk.new
 trap 'rm -rf build/.config.new build/.config-vars.mk.new' ERR
 
 for option in "$@"; do
@@ -173,8 +174,6 @@ done
 
 echo 'Writing build/config-vars.mk'
 rm -f build/config-vars.mk
-[[ ! -f build/.config-vars.mk.new ]] && \
-  touch build/config-vars.mk
 mv -f build/.config-vars.mk.new build/config-vars.mk
 
 rm -rf build/.config
-- 
2.46.0.277.ge12b8151ed

