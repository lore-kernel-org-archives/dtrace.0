Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B8311C2AD
	for <dtrace@lists.linux.dev>; Thu, 27 Jun 2024 05:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719466531; cv=fail; b=mCRUrFN9GcjYUeVD/zfiNRoiirTv1Ju7DpotUAOkmaIZFrlVPqFXTh7TNrIAxxAgiNuDRCh9RWBH9ZK74+CHH4D0wgjaZxpS01BR24ipRlu/gZPR9Pz44FJDC3DtZiRPG594N4ir9tPhWq8dnv4hetgzbpkRrnf6uwHEJjZ7QW8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719466531; c=relaxed/simple;
	bh=GdU4VeXF2wXHTTWmBMEIfuETl3EjguwnuMnvd/KLedg=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=TITbz7smg/2OPpKWZY9vG9YtGf7kS9ko9ZLquwEGNq1/gm/Dpj4B/6TfJ67E6Tx+zQgcurE+5LQhZ1a9yZ+GqJ9DYtzsDdB7ZZ0jwWRwRSbRD8tm9lUqt1tBMnybkJ8yAcvg/fc+ASnE8Y9mgSMXnOU5cplCrr5qlGdGx/uQ85Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Yz0CS3RR; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=F6+DdVPE; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Yz0CS3RR";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="F6+DdVPE"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45QLMb5G011107
	for <dtrace@lists.linux.dev>; Thu, 27 Jun 2024 05:35:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:subject:date:message-id:in-reply-to:references
	:content-type:mime-version; s=corp-2023-11-20; bh=Kw94DSdMOezz1I
	9hdlBGgwOuFra+IzQkJJQsqxoQLGY=; b=Yz0CS3RRWsgHIMoPsue305/JgGEv96
	4BXJPlXgp6uy+aYmNbI2TTWiO0mSjQ4Vz/bU/JVvGDtq9cN4g+5KOcTTGynZrnKW
	ivGTJIi1LwrYsXj0HjjmxtuvkW7V4Y2ykcOMO4TogGxlB3GTZVSgZiUubxgjeM4I
	4Gyz0us/yAxb1R22gB9SQI1Z6B2aksRiK2rSnXSUyy+txeT+A3zJq7sZEFbea5Nn
	NNJyNg1KDuUONquZRJG5v2xfydE50tSBg5m1EjQJIcSQ073OA3DE1s35rGlUjczX
	yeBzi36mkKNmH9DVayqQoUR/L4wYItgY6Mn+0CsCaWWrehQmqaCFTQOg==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3ywq5t52qx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 27 Jun 2024 05:35:29 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 45R3v8Sq023309
	for <dtrace@lists.linux.dev>; Thu, 27 Jun 2024 05:35:28 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2101.outbound.protection.outlook.com [104.47.58.101])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3ywn2gev0b-4
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 27 Jun 2024 05:35:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ifXT4VA8jvLFdmNcwr3bCFMZ5VDyQb0s70N5n2JoKWfF9h9Ns0I42ep/j9A4JyV6VabmrtmZIHwx5BmJAvUMz0RqwLEvKPc/cD1HWDidcVCGnv9t9jAqOxedYNdVCK1PVmC74q8p7GpGhvUIQA13OApjrPi3hMVJsZpOM7NOAu4Or7rlyBxB/wltFGYfICwqQBZbafzjs0i57+iOvMjEVdbP1Br3G9hkWfxftAwg4GdAYgcG4ODcAh/bX0wgsQRJlTRYcHBDPqeCD6HXrLsFMuEDDQLWmDhhkahoPbiUppJQ8p1hJpOXBJRvjWDv7Vrp4GY+KgF959O9ycCB8LRfZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kw94DSdMOezz1I9hdlBGgwOuFra+IzQkJJQsqxoQLGY=;
 b=hexqzwC70QK44XmhGWbsxfDPYPrjpoviZcFp7jyCU3R0D1UbaJyK5tn09quE2S7TTwdidusKStzrPXAfYJj8qeZGhn6ZfGGc0rSXzNToDHIb7YdPoGteTPD9wN1WXufN+GSBa5Xj6cWKJFaXI73PFsTpdztUGoSb7qYRxmTXZUc3QQjPry3z4+5IYhvykd+vnneSF63486hNBYWGxHlkLLJRaAQN01qoSyl2W7OnALPwVfusehSymSCCJz73wUd6AGgto83RffLre+2FLoRM2CxYEiWyh9RPgNDMFDdNICDIoyyJRxCtDICVpymY+IcsQBwRD67eMY4oFENF3XdIkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kw94DSdMOezz1I9hdlBGgwOuFra+IzQkJJQsqxoQLGY=;
 b=F6+DdVPEr3cfgumALn4K7Ef/SFXgxzd6hkpUwDzpK7LzSrlkkEVpwUQcuwFtWVAsBT+7z3pMoPZZwb6uaBkThjilm/z+e3bl6qeTFtJAsuqaBAyeEBQTs6VghNAOsJT3uEAM/wu4fAalUBy/NJrGeTlCU9XVm5cGxocagXGLPes=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by DS0PR10MB7400.namprd10.prod.outlook.com (2603:10b6:8:138::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.32; Thu, 27 Jun
 2024 05:35:25 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%4]) with mapi id 15.20.7698.025; Thu, 27 Jun 2024
 05:35:25 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 10/38] Fix comments in dt_cg.c
Date: Thu, 27 Jun 2024 01:34:27 -0400
Message-Id: <20240627053455.21567-11-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20240627053455.21567-1-eugene.loh@oracle.com>
References: <20240627053455.21567-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: BYAPR07CA0103.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::44) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|DS0PR10MB7400:EE_
X-MS-Office365-Filtering-Correlation-Id: e2be595d-dac6-4993-629d-08dc966af266
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?XyCBxx9OJs2/9bS/+QpLu10qU8RqexBn3UtCR/ptJA5h2s96JnFPipbTVZdG?=
 =?us-ascii?Q?QIL8xhrkQFNkpu9Z1Tpq8Z5dmYzBeq+dT44qXySwUSIvTazGpfZ9LEMprfcB?=
 =?us-ascii?Q?b/p2bIDwEw5Mv7z3LUaUtH6OPTHLd9cFKDK1iGpy6EOvn4JKn8iDklJz4tvm?=
 =?us-ascii?Q?vzO5kcXBEa4W6n3UD05YuI7rsFAATE8FkF3ixB8pHVGW+9z+wfHELpldpnPS?=
 =?us-ascii?Q?RXfeNLVy8revGajVt9zKB8kvsBCE1eRDlbcW+Yj9J0pW3U8hFHQY1A7zBon3?=
 =?us-ascii?Q?YppK+0NkmJJp7X523jo2XAJZ7/KZVSf5yh4lGIiK4dJYqcce8mwElQftMddc?=
 =?us-ascii?Q?SDGdZ6FEnO5I74NaJIyGRT/4xthniraEqFUOG7zdxEFPbsn3b0QjO1di5xLO?=
 =?us-ascii?Q?CTDn1BIigMSrH26UqVjQta5xDB0rAjhZxBEe3hVmmuErYV34xsdRyX7pKjZ7?=
 =?us-ascii?Q?v+ysm7gLRJR8c6VlfyFlHQVKgs6WDtejUBLhSpuOMA3wbvnGps8hkw815eNn?=
 =?us-ascii?Q?q94jE/n6kqvV4WtmSQIKsxOvvXK7RA3FDHOpqP583peH5jSqVtUVGgyRGGiI?=
 =?us-ascii?Q?fdzu491DmuQKjcXTPTFm297GU8D/p1o1GEqKIn7p1MwV3iHBHwrDHqrzl86g?=
 =?us-ascii?Q?+1Xjc0c86Wut9e+fb12dBS/GwAIC7RIjmdUfjdd5RKcTVWmK/5nf+i4o49zU?=
 =?us-ascii?Q?LRvzoLQHK1zSnPmY5pXXmrAex+7uGuaZlM0DsZUg/p+a0arYbtnA2ecnUYus?=
 =?us-ascii?Q?eRkAtHwhKd7UeADE4bK5wS2IDq6fXFB8RrLULbogW4JFDcNly4d22x+VPHrN?=
 =?us-ascii?Q?59x0KmQCIRVjhD1tK9ZiLluAGOifYBFhKs4trakzP5R2GXLcbqtapsJBv+1S?=
 =?us-ascii?Q?4RvtZ5WteHkOdq07u0NKDHIg0zkKUp6pddG+XXMV4ub5IPs6MRPGLiiJoYlO?=
 =?us-ascii?Q?i3XX65nOFiZWKZTN+xTEEubS93sOJ3TXEkGdM3s78vRr9pqb2EPtdzteQyOZ?=
 =?us-ascii?Q?tNvk0aRWBI5p2tJUWTky2gJu/D7KCUGDHAnLfeNeLMI9aEWDZoOYPTcbc4rI?=
 =?us-ascii?Q?wd2wMcBi4ZtqTrwfAveecaYocgD3HBW/q9Mc+KP/1MKmw0BZd7q/46ecBnR5?=
 =?us-ascii?Q?t8EGOtaNKXLPQ1sSUtGWlrQKAIUlyNuGgImAhqk7WTyaFnY2cWDNmFYfyB8M?=
 =?us-ascii?Q?qZswlNcoOl76YDqqtidFEyKgmdu+8l602Syz741YgyYeLLtNGa48KKdblR7a?=
 =?us-ascii?Q?ndsHrHOJnKs7KTHcfmXhWMiecUjhcpsS0J+XNtQ0r8XWrcmpzSDkEf0DA6gk?=
 =?us-ascii?Q?meVn7wsXkE0PE36EkocmFZSsaRNbIDlSP3pnnga5FI6Nfg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Et/GxlojaWiXMqs7amkGnF0t0agO1sdFCz96y2n2U23k7r4QYxVzkfZq6gna?=
 =?us-ascii?Q?bvAAOkfgGZBpMsd7rKfzr+p2LT8SAoIw5edvUdL/jcfjwXAkpfuEOqbpq55m?=
 =?us-ascii?Q?O1C19IloMVKUN19GlwQwgGyj6FIHOp3EphMUXi2xhKg99npO78TPH+T4YqjQ?=
 =?us-ascii?Q?hOoo3TC3FkNL3cLP0T+XSFEnuAmMgDaA42qwpA/ExHr3hppV00xNopMVxWQf?=
 =?us-ascii?Q?o6Pj89cWzo/9kPCgG7/DpTSx/7Pe0w0QsULDuMqR9KHHqj/fmGxbLUgLYwxw?=
 =?us-ascii?Q?wEarcWOp5qu8yjh7k2WlJWM/wYWI8oErzK45ovqQOhsarAWHbQi87jbENU1n?=
 =?us-ascii?Q?AKb1tV7jT0LFoD0IZmGpp0Lhi1sQHioaNhEdMPjrjQhhtTGTGa3QpEFiry1w?=
 =?us-ascii?Q?VqCWZhq4pDHl5VtcYwmV0tHhvmY0TA47zSRF1OUQJma47ldQMHr/1T+/ij74?=
 =?us-ascii?Q?P1z/Czao8bpIEIsWeIzTWgkJ+IVpRHpUmRqQ+KqEjPOYUH0W6QeXZXbKL5u3?=
 =?us-ascii?Q?UU5lGI4gNXn3yFpsJ++IkdibzMZkrjBOhYm/vbGlQHIJVY1vq+xMQ4a3Mn8G?=
 =?us-ascii?Q?bzSRfCHMjorM0nMNEzzyN+Q3Hm/YpxuILxumlZ8Ky3l9yY+hGL8G23UUxxfS?=
 =?us-ascii?Q?FGRz8LbE+4KxBm4btPHARCnn/IyLIU+20P/0ATOORB8FyGkqOzQGyQOE7lND?=
 =?us-ascii?Q?5hNY4at6dv6efP1FkY4Jr/dLKfH7tDb2xYnu2G/xgMmhP5BrEuEerhDbKEwG?=
 =?us-ascii?Q?AzaRZ90S6oHl9Cpdtw/9F69W3QMtMVhVHgLTi9Z8MyCzaAF3BrPzg+CJxC6e?=
 =?us-ascii?Q?ReccDjOFCPlTYXxXgeeuYRw2xQFV3FSwA65seE/j+sWNkzgjRj8HVqUYLt4a?=
 =?us-ascii?Q?4CEoLIADtNMOj8oH1WBm5a0RGZiKANPcpmIcOVLCEDEu0LmbTd4mZ2v74og3?=
 =?us-ascii?Q?5R0Wkern9UWzGi+X1XjSDjokiudeetwg0mwLMiWuvBt+By2qrwnCMIYfvy9u?=
 =?us-ascii?Q?4QgN9hvEzEZgRxUHMvHV1lAaRcYuOk4ySn3Yi19ZidA75fowflTB9Gqe91R8?=
 =?us-ascii?Q?TQ0VhwKEvkSVnU5YRiQvHbGBhLCVmZYGwfiHi+JuP4D4uo+QRjiTTKDprIdu?=
 =?us-ascii?Q?wNkx9bU9rb64MKIqAqyR659YJdD2o+NrBXiUiooNIwq6wTXq2WNufqGzAkTa?=
 =?us-ascii?Q?gQwRmLn5TStHncEBBUDWOsd+tnugyeItqwBqlaijlrjl81+18CfCko+vgMAQ?=
 =?us-ascii?Q?UNRL+Sy1xzmQq7NWaARMGNE5tzNIS4gU7gyx2cNvBPgKPfyZmBDbUDHvMa6C?=
 =?us-ascii?Q?LmyrjpBtzCCcAtdTdX6BNhWf97Pc9Ty8STwZujZLm9JhEG8X+cdamWS3jF5e?=
 =?us-ascii?Q?v7GOhbNri5iafPyqnoY+A6HoPYv00wW2+SHr+dhTrZF7s2IXwvFHJaSCEqSA?=
 =?us-ascii?Q?06wN3vj62bWokvRpmx2Myh7e10oJHsUTBzgS8ADbU5HAdXLcmaVGaldNxRMf?=
 =?us-ascii?Q?+145ZWjrvBYR8VR8lsso8ZzDxDLd80kj0ZsU4DWnTVGeH+QpPPV7Xdn3OgeD?=
 =?us-ascii?Q?P4r+2ZA0qF2BBJ1QNVcknfIa6IWi3Mmwn77ulkpg?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	5qLcbRcsnJe3mShNQ0bXqjtK6Ff6B5/0UGIFhHRFEFKFbEF6UGGPAT51PRV7p/O0KjcDYGLrTkU1PiGIDf5DALgggHNCj6iefk+D4QmnkOGc0BQ3Dbfo56w6EkjmowRyhs7YICuowqk+CsSlBatzYgPPmzk3ItIeD7gjLZrYuxMlp9r0biDsXIgRKsaDLMo/Gjy3LSHHovbu2LTvXZqmZ+WEn+6mn7atZJmi2VZm4mb1E+zdn6rDEYNMlHaTLhAPRgE+UU5ozxRaPa+Dx/E3jDlpuIkK5HTJkRPrdq+eQWCBnb78PMDJP3ble2JNauzeE0pBk0+F0fx2FkGPm0HLIIqs9J0rpav0D58HV15wCNp1aRNXD+d82ubOKNAwLsjAzpYKJ6oOi2qp1UQFSsBVfl+P68CckEPfdBdD7IsSeQRzntdiBqAIJQYO5Rrkv1j0oPpQ7gR99Z9fc4ifHoD0QYrE+HSZ3Wr0ruXdFqUMTZG84Ip/5b797iSkyo60OVnwxr40TSb3lqAOQEr+uv+aA0AyVg+F84PWV+Z+ZB2UxRX9bBBtv6iUG7/OlD5kKoC2w9opV3XQxhoFyCxV2qR5hBsphtQ4W/QyXopw9NmQnM8=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2be595d-dac6-4993-629d-08dc966af266
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2024 05:35:25.8594
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qkTaWEKPfjlvWNf0LnyfKpBlP/cX5REXA1kPbN+1UA7389jOfBYLEx6en/RUJ6tX1LzB/78VDHwMF0dCANjARA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7400
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-27_02,2024-06-25_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 bulkscore=0 suspectscore=0
 phishscore=0 adultscore=0 malwarescore=0 mlxscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2406180000
 definitions=main-2406270040
X-Proofpoint-GUID: Z5Uhoa1jCb61GSplEbrTykEHM7LPWHWq
X-Proofpoint-ORIG-GUID: Z5Uhoa1jCb61GSplEbrTykEHM7LPWHWq

From: Eugene Loh <eugene.loh@oracle.com>

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 libdtrace/dt_cg.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/libdtrace/dt_cg.c b/libdtrace/dt_cg.c
index 0977406a..4fd2d359 100644
--- a/libdtrace/dt_cg.c
+++ b/libdtrace/dt_cg.c
@@ -1150,9 +1150,9 @@ dt_cg_prologue(dt_pcb_t *pcb, dt_node_t *pred)
 
 /*
  * Generate the function epilogue:
- *	4. Submit the buffer to the perf event output buffer for the current
+ *	1. Submit the buffer to the perf event output buffer for the current
  *	   cpu, if this is a data recording action..
- *	5. Return 0
+ *	2. Return 0
  * }
  */
 static void
-- 
2.18.4

