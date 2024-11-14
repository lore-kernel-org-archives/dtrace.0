Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9010F1AED5C
	for <dtrace@lists.linux.dev>; Thu, 14 Nov 2024 22:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731621696; cv=fail; b=laDiq5fJ7qlLHC+/tw40Viw2BixYdGHRXCIMWURdQ+9o4YtcVsDNB+YaKHwhha489M0fVCF4+u0LAaOKRxL86EvSKDnYljQfafcQI9aU0H6kGePpTKJo9Tl+nEjJOO16wOH+G+e3RlQ7d5QyjIO0OV5MK3yO71bSbXVJw4jNzWM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731621696; c=relaxed/simple;
	bh=KvjLdUnGANQ1QcV+xTxZFHavntHjpa6R3magQclyuS0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jk87pHWwVeEnJRPdONh3euypfR+2Swua/09Wo+nCJfsavkwgp9jmrGuPCE8vx1tJ37iDdHSxmgnNWkgbKbMt8wSxIKZGr9LF4KkV6WBz8WOgj8ipuMJq/Yg6LhQUWFVwHJ7lFKNMzPrCJSmn+JpqG7RvYkdVc7KhCdfIl/+/yFU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=FuNvTqqo; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=awuVE1hF; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="FuNvTqqo";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="awuVE1hF"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AELfaMf020982
	for <dtrace@lists.linux.dev>; Thu, 14 Nov 2024 22:01:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=J8FpSleo76HS9sOXMUfrbJ4igb9ZzNTSUlKaYit8Kvc=; b=
	FuNvTqqoRbQOFWv7wfMmVLLQqavv4Npl7WUiYEk0ROFpPhmJl5Na4Ecsss4+QpRd
	w5jfEAETPiOSeiNoLH/7hvFY0ZMWp6Zkhu5uhBrtc/U5wKfv/bN463wZjPJaJOjV
	4weEh4x50qUzxo7zJ6t1yPWCEiGO1mxQRJdw+sEHoa9doidwaE9GFEqNrn6nHc2W
	kvzarQiAcZfC32vBXPE8wlqvkDRPUyFb2nr25SsFb6iMf1rkSusX0n1haPV3resR
	8h6XCt1jCk4CiFe2vSSablRmBxYx0nANKB82cmNmkSsUKLS6zCvLxwaI8LZ9zDis
	fRr2Pn2udh1RWQgIPIFc5w==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42t0n529tp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 14 Nov 2024 22:01:33 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4AEM0Mhj005659
	for <dtrace@lists.linux.dev>; Thu, 14 Nov 2024 22:01:21 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2176.outbound.protection.outlook.com [104.47.56.176])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 42sx6bu9y8-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 14 Nov 2024 22:01:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hBzkl+fw/omnhJcHa9Wqvn0JbRR1hcUXaA1n0j+87j1uYfbJVvNLtVQTe7kH8969SvVHGTyTi083y/jLgVTf+MJq4bd1tB49vPN9G+Fe3JYIJAlsExE4bVCT9a6OjJk/BTx2SJU0EsJDaXN0GbFWwslgW/mIhQbsORfO3P1/rdhnxteEqaYOyJCtryc7u6WpdrQ835zZ5hXpeXObD5hiOhGZd49ImOd6EnzwJtIeO3rfOoGuS4meUo1OA4XcWTEM+QZL9XVEt0wK9G/LrRAQcmHUqUoLvsL7UySxkav5aZPuJYmqFGx0e0HfFq4oT2wqX+eCOJbv7xz+Zyt1xDufPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J8FpSleo76HS9sOXMUfrbJ4igb9ZzNTSUlKaYit8Kvc=;
 b=VNLX61SlOaOnT5RmqCwtjuS4IAev7zJLwlPLYtRN/0eO7GlATyT1RZul2npYChI+pspbijjQby9NIbaFrScAG3NqlGyAlpfXENucrgM8DCfvOTyQ84WQ3cZKAYtFnuSE0fB22C+6AH7JbqvuWIElUqRcfNmj7A9ol7TR6USmt7tbTSm/5iQMmRch2DUVCY0z9lFX5l4C+CpPA2hWMYKlrC0XrROF7U+J5tlkYACyXeOOjgZGTJR85vH6jghDTGxM2ZKgoZak46fQmlAohStPv45xia46yjQn+C9TFHGBxef+D1PyLdW1ErR0ej35+IaCpxe7AK3ZPiuysQBJEqHFBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J8FpSleo76HS9sOXMUfrbJ4igb9ZzNTSUlKaYit8Kvc=;
 b=awuVE1hFWKJUXjxWfITPqppQGcEzKQ8l6YSbPk33EitUDnJb/uL3xdb9p0OpMuGMz1WfJdbFhvxV1ctbqFbqvIdvQV3hgBHHIgqihKfP6nCfDRupVC/M/lpMFEZNc65F3UHLjXAqNpyioQ7QOjwazme44NMhaaAQa/zu7tNNHMs=
Received: from DS7PR10MB5037.namprd10.prod.outlook.com (2603:10b6:5:3a9::23)
 by MW5PR10MB5873.namprd10.prod.outlook.com (2603:10b6:303:19b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.28; Thu, 14 Nov
 2024 22:01:18 +0000
Received: from DS7PR10MB5037.namprd10.prod.outlook.com
 ([fe80::824a:572e:d9d7:e9f1]) by DS7PR10MB5037.namprd10.prod.outlook.com
 ([fe80::824a:572e:d9d7:e9f1%5]) with mapi id 15.20.8158.017; Thu, 14 Nov 2024
 22:01:18 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Cc: eugene.loh@oracle.com
Subject: [PATCH v2 3/4] probe: do not try to reify probes from uncooked providers
Date: Thu, 14 Nov 2024 22:01:07 +0000
Message-ID: <20241114220108.95647-3-nick.alcock@oracle.com>
X-Mailer: git-send-email 2.46.0.278.g36e3a12567
In-Reply-To: <20241114220108.95647-1-nick.alcock@oracle.com>
References: <20241114220108.95647-1-nick.alcock@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO2P265CA0259.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8a::31) To DS7PR10MB5037.namprd10.prod.outlook.com
 (2603:10b6:5:3a9::23)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR10MB5037:EE_|MW5PR10MB5873:EE_
X-MS-Office365-Filtering-Correlation-Id: b544dfbf-cedb-4007-28f2-08dd04f7ddaf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|10070799003|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?sVcjtOKSdsQ/XKhc3BzqVSEycoDNuE3y60ookqeJy7cf5HD8d8BkGjN86Hz5?=
 =?us-ascii?Q?2oF5faLRGQju22nkiRNw4zAFI28P449gz5fRDIzBtkLqGzTej42plT02G3DY?=
 =?us-ascii?Q?DGgniv4WU3T+OKDgNoM2lKtg84Cj7BY0tWLWtEw9wXVVZx+cmBC6j/gMVieb?=
 =?us-ascii?Q?XNx5fBqVjrrBjvLr6PVzndmHWctlYc+V3fuBknUe8QkHXJJn+N6RZLTKA3sU?=
 =?us-ascii?Q?1X6BN0Tfzv5mKOBM2VLq0INhQudC6Nd5rrqV1tzf2r5IVovV71/RHj6MWaiL?=
 =?us-ascii?Q?v43Ax/Po5xE/mCIdvqI+pQIUeAory40xy2MBzlMygStXHxQ+qh+E1rAZ1hZL?=
 =?us-ascii?Q?DBD9H5eGyvLvNaeQX2o1232UoYMghS/w4gTltHM6UNqFsusYpGxQW1LscCuK?=
 =?us-ascii?Q?BR0jIDebcECW+ZxEfUQwrYfjLIGXKrN+yVD9R7WWiskMUGe9sR4iVzerBPmZ?=
 =?us-ascii?Q?/sG1S78SjQSPqEW8eSiUe4C44kN0vbvijhnPhx7KAOwkctKCJwq+wZFc4dtG?=
 =?us-ascii?Q?HT3sfZWDZX3r8/2xfgEz/YjAHMRDX0gVxttJOPTnEuQHv1BN8Sci5xJC7Bpg?=
 =?us-ascii?Q?4w6+pzIQE3T9KWg4m+LRC1sWZNxpRHBqbjEzuwpl9Ty8o1vIq2q+HEABFO/+?=
 =?us-ascii?Q?QdrMjPbCpeuJU632R0EeljpYEaZHGN7CVWOHk1fM19Z2m+kzpSr92ToB71MY?=
 =?us-ascii?Q?xSQDeatANDln5sTsB3X4mwYYktXCr1vnA456qBOQxOfNLj5zkIRPx74U99zu?=
 =?us-ascii?Q?utwyO757pPzz6RnmVTfw2gsR+nAK0E7BtU5NK+eh4whyghZk62TpPOoGzLvg?=
 =?us-ascii?Q?KUwXnIQlF8yCoosqJwPx9mdLTwOAwM+2ozZryP6idRUKlRLQMZlEVXHpF7Yq?=
 =?us-ascii?Q?WprmroXuUHClDMK2l5N1B3W+N9o12OHcCehy7MqJIEBueiPj9dk++Kk/pLec?=
 =?us-ascii?Q?zA3gxH4DqLFMfCRd5qQtxzheGxekLi9PzE897zi2DVM0FW4/crZnvMz8q19U?=
 =?us-ascii?Q?qx1hzUKvzHAJeojoPNdEgqrrhS25WsRjByr6Y00b0q8RjbqjMwkuEFx2j7Rh?=
 =?us-ascii?Q?rGF3wj37KQhZU12ppeiUu6K8e/WWrToJHNNIyRb9ERjHKYOR9Sc4m+PZaGA8?=
 =?us-ascii?Q?+ckpBqkfT3V/NrfxT+96EtZs6dEK7nSIE8W3Z7DHDPOmVkzDzYJZA5JW0YkL?=
 =?us-ascii?Q?3DnKVUElxHSDuCLof27ts0DEVlHwdq5FAiuFnisRvKF7ZdKDVHauejAj/aYi?=
 =?us-ascii?Q?/yqRs2MgPzG8k93hdMY+kyH75RnqITHjAX2P0Ou66M2pZyuSldOnThDhh4Lv?=
 =?us-ascii?Q?UGAHKYeGyr+Ay59UjmHIxe4G?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR10MB5037.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(10070799003)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/vHd8JsxDNShl0QA6Pg2QaB1QP4XtTMHcuI/0SXPb/ftGngpFWq9ghxkCwuQ?=
 =?us-ascii?Q?loJf2pvlECnFtEdcIvMhOOGZYk4aPOee4bC13dhhbaBad77jv8+qC1ZOMf68?=
 =?us-ascii?Q?437OoduBWL0Vnot5ZX0itZpBEvBeu+oyLnc/ZOogkO1KAsXCWFzENLbYsJ5R?=
 =?us-ascii?Q?Sm/hBIgn9oSc9eHPRLE63IU49wKbgTroKlKPPJb7iBRulJArPQ2yg2ARglBg?=
 =?us-ascii?Q?946Vis/mBqIc/1d1pqlIcMzoPUfoUrn9uvZl142WV/L1kIflshJ/bceDj94F?=
 =?us-ascii?Q?Orp01bPccRfN2iPYTemfrbWGqVQdbgpATfnQQbnvBm82eWYo5ezCs2IfJs0J?=
 =?us-ascii?Q?gY10zGYeUFYCtn/9/yMWknb0zJmSU7PAgjZgtI4E5wAsQkk5GO63ae0eE7Wz?=
 =?us-ascii?Q?A+NldGAnDYYcAZIAj2pvhWDC2Aspz79Y1+e4J9nl0n7CExLaqHtAt0mrPEB2?=
 =?us-ascii?Q?6QVx8IWgJLeulmngNcb54KT9wnAZ2N3Wy3fCnbmRBi/4XC2djiA3Q3vlKNfS?=
 =?us-ascii?Q?OcqxLFkVeG2QpwbPBI2JxkF7hNFr4/2GTu9ptimlQdhPSP45sDJFnQ4p0V1l?=
 =?us-ascii?Q?HR0c1KG/jl8v0LVoSsIZtSqTq8H/eNAXsHc2y/EfA0nFWSy2vIv/tkjIKI1a?=
 =?us-ascii?Q?GMu7c4Q1k4/XNJmYq7AwftspK2cHxAjiTE/9c7rlDXjqOa40KIs/3D/ts1fF?=
 =?us-ascii?Q?dH2NGpFdNdp88lXr2lrSbQRHgKeyKJxWFTqPZseGKzw5WvNwvX77KRPxNzO5?=
 =?us-ascii?Q?ERScpJLCZ1AgmMhOu+MCId/DTkhSfc5o7zlKYCHP2Yv4nj0GJ5iQnbe5ij4Y?=
 =?us-ascii?Q?12JL6ijmNvCZVSS5AxdHTzKJpOFwVFdLeNN7b9F2TTK8sTBe1571N9/SE+dT?=
 =?us-ascii?Q?rlR3tvbfQXUAe21GkYL6fGx2dItz62HXLBA29/wfI8Dj/E9UhZJWEwP9mC8c?=
 =?us-ascii?Q?Q4IeY88GUTOpQhC71Q5FYeJ5YgtIFUiUJKNeWeM05bSi1OfwDfTLOouaydo8?=
 =?us-ascii?Q?IlPDm0KMfKJii0krE+vH5msqXeD2qBhBaJ5lIjyw3MvPK0PwSiiTu7aRzDAL?=
 =?us-ascii?Q?mnUYhop6EHAXH5arpF6//Sp4B19vNskHHJ8Sa95/mkuOIQPHkzYbXYGlc/ON?=
 =?us-ascii?Q?FI9mVQILGfkP7qf78arAaFTiYAFVyM+xvBxASqNGt16eaqHMm6lwUHN9wYhA?=
 =?us-ascii?Q?Jo8vhnz0rdGgiPz2sL5AlIdY4ycNMjU8ZRiBRqppIOcuRU4jqNxqb95EuwMa?=
 =?us-ascii?Q?OUcW7mp2tQy8XUrG4NfJEv3J1up5QTqUsVQ+J76AEEaCwfAVwjVR+chgcVJB?=
 =?us-ascii?Q?sUOl4SN5YzIUl/gLx8stHS/+LCDrIKpwrSMXkE868CeZ+jSaFRcYeweL1QOG?=
 =?us-ascii?Q?oa6mug6b0gUPIKR/ogKXrqL4Z5Ccajkyey1ga/WdrHcte5rM8hKQvtdC9Sgk?=
 =?us-ascii?Q?QeLAoHFPRdT9ovz2f221KjE+TiZp8xNr4Vxvm3JG1d7D0Pb2NG1fh4YgE+3C?=
 =?us-ascii?Q?skvOhz5kqgZjU7lnMYPqHm9bklM4UwjvP9d9BLEMOIBKh3wRrOh6M+sF9yiS?=
 =?us-ascii?Q?t/uqn8jz9woKK2y9jmdKg6Hec7xIw7fPTLrgvzannFlNYoAt4YaMnIBVAFiG?=
 =?us-ascii?Q?yg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	rvcga6YTYX03y/y4z105afrhMqtcMO85c1YnHV4QdbOKSWQny0iItghAV4x8lXuEHfoeCnBf3eHb0Nwq3JRPO8JNLXj5epqF/jjx45ebztIUrb2f1Uc1L69KHyHqQPxrPa41ZdCMgzqcIjo9w5DMXOWUcEgGSx1SvBrhBVxO2VtwyM9k5d8/reOD/26HunikVRrHMYN8Ez6oZlxzlUAal2ZxmHnryhbNnvamcahmWS5pP3cYz+pW2bBg9GA0O4e9yvVt8ktomzJikSUzHFrPxTWadghNeEpduzbqcd5vSauGFFvgBHW8WHb5cxbMNRPzb24BHZ3LBdmRaRfS3CCD0Sba6Ldzb5aFRBE9o52zM2u1PbjCHM33vCjuL9ypqp60M87IkFu0six5S8hsT7fXEhudGGwSQz6t/IsFaoPhug7z5mJUUrglXzR5wWI6wY04r0pUfhVCya2LY5YRNokotvKcgNq3JiikdS5QpijFojRYHh8YUhg7oduDndUTVaRYeXasTlltjN+DGu3LyzBOdHBw2HVzH1jbzqMAOhHEf+dWD+bFotTmpiFl0LRk+nsSICYNsTo0UoQ9AiEHIDMp7ptFNOXYmDrArHdH5x8AmHI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b544dfbf-cedb-4007-28f2-08dd04f7ddaf
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB5037.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2024 22:01:18.0316
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c/DlirFIvD7WIMvsk0GeaTDkR7IswUCBfv7cXefiG5J14d59G354Zti8T+uhlVSnj99DWVDcg+UFQ+kk4kHQmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR10MB5873
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-14_05,2024-11-13_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 spamscore=0 adultscore=0 mlxlogscore=999 mlxscore=0 bulkscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2409260000 definitions=main-2411140173
X-Proofpoint-ORIG-GUID: NKJRkleho1bV0u5FEOljMrEKI_v6PHee
X-Proofpoint-GUID: NKJRkleho1bV0u5FEOljMrEKI_v6PHee

If there is a syntax error in the middle of a .d script processed
by -h, we will be left with a provider in question in an uncooked
state (where dt_provider_create() has been called on it with a NULL
provider by dt_node_provider(), but it has not had its provider
set yet by dt_cook_provider()).

In this case, the attempt to pop the parser stack on error will
fail because probe iteration is attempting to reify probes out
of providers without making sure they're cooked first:

    at libdtrace/dt_probe.c:1006
    argv=0x535830, fp=0x21e4630, s=0x0) at libdtrace/dt_cc.c:789
    fp=0x21e4630, s=0x0) at libdtrace/dt_cc.c:1419
    at libdtrace/dt_cc.c:1441

The fix is simple: treat providers with no provimpl just like we do
providers with no provide() method in their provimpl: they cannot provide
probes, so don't try. (Test coming in a later commit in this series.)

Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
---
 libdtrace/dt_probe.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/libdtrace/dt_probe.c b/libdtrace/dt_probe.c
index 189bf7928e145..ccaa3081c5b23 100644
--- a/libdtrace/dt_probe.c
+++ b/libdtrace/dt_probe.c
@@ -1007,7 +1007,8 @@ dt_probe_iter(dtrace_hdl_t *dtp, const dtrace_probedesc_t *pdp,
 	 * Loop over providers, allowing them to provide these probes.
 	 */
 	while ((pvp = dt_htab_next(dtp->dt_provs, &it)) != NULL) {
-		if (pvp->impl->provide == NULL ||
+		if (pvp->impl == NULL ||
+		    pvp->impl->provide == NULL ||
 		    !dt_gmatch(pvp->desc.dtvd_name, pdp->prv))
 			continue;
 		memcpy(&desc, pdp, sizeof(desc));
-- 
2.46.0.278.g36e3a12567

