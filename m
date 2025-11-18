Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0A2B35771D
	for <dtrace@lists.linux.dev>; Tue, 18 Nov 2025 16:38:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763483898; cv=fail; b=gve8oHIfZ2yPwiIyNxAsqDLvVLe3cPvKKP2vnKrKusZEf3MqBbQRsj7PSfCLgWZWj4RcRpsQotGr7ZwHxFsvlBEeK6aniQkdveLSVl5Fm4XHQHRTJXMmf8p9WIa3wIiD439R+q19ajdvP0uHyIMDfZ+MPP+cc4UMOuzHTZOFePo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763483898; c=relaxed/simple;
	bh=wBzM76bZpb6dBRc+Uj/58dw/jgZifc0F4q56dSm39Kk=;
	h=Date:From:To:Subject:Content-Type:Message-ID:MIME-Version; b=QXWHO3q7ZLKwF6M+aU4GpZK5nn3yJ82QheKPncgJa1R3XuYaxUdvCrTpF8OYNt5FuiTrnjQGdf9sSDz6Vr/OHUtm4lggaWjF6+r69RIYasLxWZCQxVoJQe66WdZ2B0s3kItxHOY8TyPUwCwXAHVsAXYf7ZJHY6FUQOMTJlrfM2g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=UGmlIjTV; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=oIbutCtL; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="UGmlIjTV";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="oIbutCtL"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5AIDRmY2006452
	for <dtrace@lists.linux.dev>; Tue, 18 Nov 2025 16:38:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=AHIWjmWdRByQpXAwfahGs2Vn0DUDNliCsiHNHGyuYKo=; b=
	UGmlIjTVACSuKDIl5xW6Lkmwo6wO7O/MoQoOO0Z49/0vigrJrLEGAKMFWsB8RhVm
	sVBpmN6hIrf+CUA1XTO/J3JbWLY5hxntMM/Q46Ku8BTNqRu0IkeiWXmw+c/2Oan+
	7qYq82k9KUgzBtOunADo06A4CkqxG0OA20ijtzUrTbpPzzisouAvBxyNDdmFcDfp
	IfgNpdnqOOJhOJPadzGVwk2YiMmr4Me5El55bUYIrVV7/x3svoxC7wOjwPC/25bM
	dSlhFuVWNvIhm/h0j2qYEXnZcGUezhFylq8MPuLqGBE7xUcXEGUF0wSfp+JYbFWD
	VpkptgaWK4UhiPk1eS99/g==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4aejbbw6t2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 18 Nov 2025 16:38:14 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5AIFEvcc035973
	for <dtrace@lists.linux.dev>; Tue, 18 Nov 2025 16:38:13 GMT
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010046.outbound.protection.outlook.com [52.101.46.46])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4aefykmr31-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 18 Nov 2025 16:38:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JkyRDO4mXwDf9TZc0FayJI/BiS9jT0db3QUYjsar45LcpenubLO5BwY/d6mAvMIOCRr8X2ncXueMaC1HTlY1+c1q9DAe24UQ88qO5FaqLcgabsaYUI/0H9J4JAhO5ecSIcsuKFdEe5UI6IJUOc+Gp+17RbevCXhcKi04yJwriI+B7k3uJTaDfjAsURrKFS5V0umcTr2Aqxqc+CSpn7rkGiX4VReuDuIMBXPKyrK+X3eZXGpWwdAD6vsgJfodR0CIr5g2+G7OIomqPGOfyy8cXmNJrfPE8zA+PtMpkEAs9vIlUkQKV3+I7U+GddRc42w0ZRBaNbs9QD6lvUdoaJGxYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AHIWjmWdRByQpXAwfahGs2Vn0DUDNliCsiHNHGyuYKo=;
 b=v/dk8f1h9dSBiq6L9bEOuyHKuXcy7XSRY9NPhGWnGr7ORUwaVLBqZNmaiwPLecuZgO9Sywd28/nPVWMzenggntvqrZlv9j8YZpSvMiDd2+LlK4H6xRF+zEnRjr+V5wTciLimrbqPB9/2ELk344drcMI9Ks49pdUNZxFrFJzccgf2ndnSAnXVlhLbz+SqHdyxB2hDTl9qI4TSVujr1i6PA/3zfG7MgCihrdWsvd7vkmZLjUZoeAl7v9x2fMvq8l9/0p4rA6RMAH7jkv1y5jlOTsk1/JlQiaHYOt6ncflzUparcEQ1Mh3yFD5BzBoumfQjR0ycRS9wOd2ydxg2zOzA8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AHIWjmWdRByQpXAwfahGs2Vn0DUDNliCsiHNHGyuYKo=;
 b=oIbutCtLTfGgTj+RERn2tmUSCj9X9XOyYL3RTJfsVbWfsnZoTMw7do8NsrrywLMvLZNWkDfVcvRkXGE6ue0NQfZvqb4E4q1B7PwEezva6Tq0i9sWcDnbMq2IGygyR9uJqXwiiqRcGV48P7mGx/VVCLbiZdZlT2LBDkv/EoGOIxI=
Received: from BY5PR10MB3987.namprd10.prod.outlook.com (2603:10b6:a03:1b0::20)
 by SA1PR10MB997631.namprd10.prod.outlook.com (2603:10b6:806:4b5::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.20; Tue, 18 Nov
 2025 16:38:10 +0000
Received: from BY5PR10MB3987.namprd10.prod.outlook.com
 ([fe80::82b7:1510:8197:f7bf]) by BY5PR10MB3987.namprd10.prod.outlook.com
 ([fe80::82b7:1510:8197:f7bf%5]) with mapi id 15.20.9343.009; Tue, 18 Nov 2025
 16:38:10 +0000
Date: Tue, 18 Nov 2025 11:38:08 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 7/7] module ranges: fix file pointer leak
Content-Type: text/plain
X-ClientProxiedBy: BLAPR05CA0015.namprd05.prod.outlook.com
 (2603:10b6:208:36e::15) To BY5PR10MB3987.namprd10.prod.outlook.com
 (2603:10b6:a03:1b0::20)
Message-ID:
 <BY5PR10MB39872E36B0D41AD794563D95C2D6A@BY5PR10MB3987.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR10MB3987:EE_|SA1PR10MB997631:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d28d3ad-ecf9-45e8-eb29-08de26c0dc3e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?PHReZ/BptycuumBZ7+56DFMzAlbpRss1mujXiTZGKotcFJhcjkSfPGeZqj71?=
 =?us-ascii?Q?N6UNO+cp/3Si/5/uoPDCVgWfklW049e8HNu5RnHGN2tF1ff6JJdBuBvLNqm8?=
 =?us-ascii?Q?aFPzh5mpy9v1/xqhE6of/4sfiDwzLR2xjvLWIbq8JOC6Xy2qo4mblPd6hv6Z?=
 =?us-ascii?Q?X3/I1GZEByr+Qync00t4LahwdUHjMqvTUdbOvpr7WZoJAa5GOGUMAZNvUMQM?=
 =?us-ascii?Q?DP9SGjXEzrn/0hWivsgSRWS2V846GQ58OLhowW6Xohmsi8JbI93N3W7JwMwB?=
 =?us-ascii?Q?jhmSylcCy08xmQn4Nor39AsIf64NlvVESEePV9ZYgIm1LqeRU2FuUgV1H42m?=
 =?us-ascii?Q?Mh7uyildO0ima3Y6tYkf6cZ8MfMJT4+Opuq+PDtCcVNupY8tOojdci1yH0JG?=
 =?us-ascii?Q?nW7zXf89WCSwuKoOaH9sCp5DCJEtafbubz4Po8AG+7cSMrpjgyfcroAQ7zjo?=
 =?us-ascii?Q?GUYRLzK1IWLqgSy1NB5p2YoZCe7gyI3Ca3rj25u9JxWDdfEEOvBdAqp3x2fw?=
 =?us-ascii?Q?UudumM1JqEktaFU6wvXqN4ufHSjJXxVyIygqmY6GCZUOQ0C2gNlyX1rmcWnf?=
 =?us-ascii?Q?6krkgo8ngC6Tcryz1cKTPFSDfM5kcpDRv7f589WM+WRyuCN6YxIhQQYAGTOI?=
 =?us-ascii?Q?Sy9DP6Xdkb7RZz10gfBZ0OCyFXshoEG7POE9BOr90kqNq770l3UgtX31ii0h?=
 =?us-ascii?Q?/SMblzOfFEmrOW/fmCOrH6jR096gUNRMXdjEjATxqweLN1W1za/9zbGxBiAx?=
 =?us-ascii?Q?OvUBMjly312Donire5KVchRc0NltyymAEnu/rJ1PvkYL8iqOgpabdoZ0F/fx?=
 =?us-ascii?Q?u3BohA0PPAzY6fyBeBx8JCh6LBPuym4WSNfKoR8kINXb1el7GzxlPF5Jhlt3?=
 =?us-ascii?Q?Stb4kP/d/bu7rfNPwnWI783Li1TS8xSMAdEOfyhPrXd+xx1eFIyRQwg81Xyn?=
 =?us-ascii?Q?PvNHyNpZ9UuaWzv7MADflnMZyu8RAtc3dL6R4Y8WfOugi56e9KjdnWLNsVde?=
 =?us-ascii?Q?KzBBAMi3Nuefsz/sMEYpSdje2je+Ttz9PZYCoO2f30UKxJaQDrhgXkSJ45hZ?=
 =?us-ascii?Q?O9sxjgI8i45sMDTW1Y8rzN7EFyi09BCSHnjNwHUnE/bfMg+mASNVXSEVZmW6?=
 =?us-ascii?Q?8BBhuFHkXZXA0UJZvCakhStrradzXEn6D8yUPOuwquoAkVN8RP0IeXtcrL8n?=
 =?us-ascii?Q?4Uxh3eHZo2bMpfOoEBXJZ+/X8aUtlBsFjOjMx+4Nw0PO30FIiZBODUE3fP8T?=
 =?us-ascii?Q?siJyy0vkS/bx96euG18VEIprSvuT8K35v2Rcj/IzmZvRmaenCo86ln/aaqB9?=
 =?us-ascii?Q?nA+UCShXdAVusFm4SF6P982ZI8qjxCs62Ta7nvl2ewCHeh7ptDhXUWrDivGJ?=
 =?us-ascii?Q?fgsk89A0wZmS436W7SV1nrh+TqMQgtmgsYwpUWNWPaFQOvMvPN/pvQr7gIzW?=
 =?us-ascii?Q?CAFCBae0qH7YRU24t6Q6n8p1o7zbbAS5?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR10MB3987.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?wy3draQUVMTgGcZ8/Kd9bkRUx0Ou7IVgkVBBN+AzxYOKO3E2kpW0PTMMXqJl?=
 =?us-ascii?Q?+28cSn4LlvtqVXpxZri+3puHJ8V0ZBd8eZJprX7HaCDV0McugnM6HKHfnDMV?=
 =?us-ascii?Q?SxZjbKiaj/gTc1Qe8L2J+1u9TA2cHImDaqNIdkASM8Zj/bUcDpmwcLsYZ3xm?=
 =?us-ascii?Q?BFiJ/XD1gpQwnfaQ+PHFojTV3KzthIRxE6+LnaHJ70NYaryGZzd+pwSRfOnt?=
 =?us-ascii?Q?vq2/N9fLe5qvcGxUwTpwzRWsxd91Xy8CViBC1/oOWbKz12FBqqTqfGXfekM4?=
 =?us-ascii?Q?pMS9/5M/2VcJxsiHH2tG9htzepiOyiJKqgDX9Lzi1itwf9S+5b+XYWqpxS2v?=
 =?us-ascii?Q?CgH5FQyJi18ik5olheM7NtUzZta5MZwZWFFGrzIy8maQI9j7jQu6BVq2agig?=
 =?us-ascii?Q?vlG2isrNXhAF22xj5DqmMfXYH0Nu7t7AhDVZ8iRA1EwQNCx6Ncv8RD20JkJe?=
 =?us-ascii?Q?9TW29Zbj1Deqn129fqOULJCYYJRA10KM5dOltN8tyjIEJZBR6BaN2NDM2pjP?=
 =?us-ascii?Q?D4G1LolWK38/bc0fvrUHj/Pvhzdute088nY4F4bwDH6Oxv+Ok3CN2J0mNNbG?=
 =?us-ascii?Q?2UAbzgdvxhLvRVwrzpLLICTf6CaE2ELKUqaKaNwd0tDcBoxd5VffxSH+zzBY?=
 =?us-ascii?Q?/KKXWCXYb5Kf4oXdNhOhXiApXhrzjBBS54RRoGjm2GQgFNhTdCWAhx/Ne+ky?=
 =?us-ascii?Q?FRY8XKgOqdUwi6qHo70UJl2VPYW7hftby5IX5z/PI8LSI8ofR5yxVKYztKVe?=
 =?us-ascii?Q?r3g0twgYMfJ9xh1UIp6AklQ4gfJMk7AqvmVgak3R+K5LYxUoYxvF1T6oZeX8?=
 =?us-ascii?Q?/g1G3dbWDi48sX86MvISQaANI5VHAFhA3BQdDJ7oXkY2vq9mCcbleeADPQlW?=
 =?us-ascii?Q?J+PgvJkXDCBEHtsipudCLalPYQuOqeMuwYT3YVrl5qYRnQv/kO8YuwAYuBlL?=
 =?us-ascii?Q?fgPGRwYVb0YBb4B+PWF+biEYbA+jx7hpmKzLIDe5rmPIqSb4Ai4lebAJ8Gsw?=
 =?us-ascii?Q?odnjUzModeNGyjpc5h9i73dILip98n0hHefkq842CDswjQO7tYGEqt9teXLJ?=
 =?us-ascii?Q?HMaH/ExsDtWoXg+VSXPt2983qlZXb5Xb4C37YVJcCyA0UUpOQt0vCkKKMyvK?=
 =?us-ascii?Q?rp9A4S+6045zN6EUSt288jzEF7V38wyg2sIW7QgUzzV+1vhTFaoRV94j2IeW?=
 =?us-ascii?Q?OvuI5nA1wrIfXSCgz/x6M4X3UOI9dw3nAKjuOIOoCixLVQO8lnyZfW7mMCro?=
 =?us-ascii?Q?XaHUeFdi7QU5rk4dky6hp0H47KQdSWp73gftwj0kDu9i7ZE52m2x0LUdFUTh?=
 =?us-ascii?Q?YA2KGxHd1VGSPO48SE1cVVTMEekTrk3dZ3ppNTp3E4bLiqA5tsNSLSbVzwiL?=
 =?us-ascii?Q?ol7lh1kLITdrgcL9ObLIbm5Pku11rcxQNn6LqELEdky7MsJnobOrweTNE9ko?=
 =?us-ascii?Q?Hn2M8bg06wwwMqmrzrxqqvt8LSpZBfCcHgkpzKQNvnq7RwRHjhj72ca3wJGH?=
 =?us-ascii?Q?ow3LQZCzAyGqA5fvbhjIpR1rBYywgv/6xH9JgmbRhdpnUxczOyZ09ErNuMnV?=
 =?us-ascii?Q?lthdEWWHK437zrkyi6ODXONxpPv4NH4v0+WxorAZgxwt9l2OqqG55lnDM00M?=
 =?us-ascii?Q?Bg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	rYosmPg5psw5V04PNs7Y579bglh+cXbjjVbwxu7I5GrZPGLaE0F/18MnWI3qBzyDtiiBIgpZ7AM1BN0fEZXwo/IUJYMWBfhcuCjV16JdGNWwbXtgl8hmAljoDPUO6RQmELJKmv4Im2t4gsmy+CSneBO9n8Idxn01gRH4d8KSWtLD63+ezzJ21gn/Z4trk2jFB/SCjz+rcvJpgXgwrI3PquDZ+dtXpNEzxqz5Je7jU3T4yab2lbA5s3GVk+zH4ZBAQC95tlJptpDkms5xCi9Qsdp1IoLona3R4U2qFhy6iGGydkd3qYJOFr1hFCbyx0eThbiB9x3r6BMWdSxeQOvjqwEJSVQZJLZAC6i0UuphEkP+rGWoyXe4iH9V50xyd9FhuzBBjRaUsd4LprpfRhuTUBM67+9oxKfOS7V6SzqvmVueF0wwZtnELnz//hF/c7KoYrbM3gIFJUafz0B67npcWpdKc6zQQXUp5xnVfPGh8txhWRZ4Q7TeqpE9j3EdVPVcap/dYtUsiO9mxPMrH0SqFTk3vJnXTGUU6OI/iq4hBV13TztfEeQwFXdByfIOlagkqf2T77ezZC6MJRQJOoi7OSzg2WnzsNxtav7VXOP6EBU=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d28d3ad-ecf9-45e8-eb29-08de26c0dc3e
X-MS-Exchange-CrossTenant-AuthSource: BY5PR10MB3987.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2025 16:38:10.4566
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UZtXthEXeP/3yHyYJrtFwFlLtr0wQlKs5EZTfrgZGBxXbdhLO8lqtUgpHivVlibxui9NurTjpl0KaEkxuk8eZabyu/u4aISzUhOVM5Sao/E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB997631
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-18_02,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 spamscore=0 bulkscore=0
 mlxlogscore=908 phishscore=0 suspectscore=0 mlxscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2510240000
 definitions=main-2511180134
X-Proofpoint-GUID: HVcbSARJU40Mp3ktFOoWSZ1kReadRKzH
X-Authority-Analysis: v=2.4 cv=JZyxbEKV c=1 sm=1 tr=0 ts=691ca0f6 b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=6UeiqGixMTsA:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=yPCof4ZbAAAA:8
 a=VnFw8uww6jJwFzRwTJIA:9 cc=ntf awl=host:12098
X-Proofpoint-ORIG-GUID: HVcbSARJU40Mp3ktFOoWSZ1kReadRKzH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE1MDAzMiBTYWx0ZWRfXz9ageqYeANQo
 sDZjv4s5O7qCEzXcXBNXvYwSBXcOHLDKj1g8KX+AFHaExFgCk0hYN8M9gtMnyzwcTCGZm6GVFGj
 PwsQhMxo9HsDsEoSAvdrWsqVYFu0/0ApVQew+JxM+70nlv39QfJGsAvLhYsy8T2YyZ56eDewLHL
 DX3CHdcd1F8sRGRO9DGPVlM89/LDemQYifsgACmHeqABeDIejfgK6UM1BXJw7zRo6Q7pdoUVFzN
 BcqPa+WXf8NHGJ3RSt+QjDHaFPfy0Mp7eTgfeH3+2WZPyBnV5cuNscLx82WfaIoV89mr9EVuAW+
 LBKBp2bq9QGxP3SGYqRRoM/uQEiwbq28xffmJK94bqvgWrHkZflYVa2iQ5xwoCbhduLJEMfFffC
 ud7wxaEwvy9Xeql/6xKhFNZH2Iz6UGMgAeUzWqFpowvMzUQkbio=

The file pointer to modules.builtin.ranges was never closed.

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 libdtrace/dt_module.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/libdtrace/dt_module.c b/libdtrace/dt_module.c
index 7ec1b550..00978911 100644
--- a/libdtrace/dt_module.c
+++ b/libdtrace/dt_module.c
@@ -1618,8 +1618,12 @@ dtrace_update(dtrace_hdl_t *dtp)
 		dt_module_shuffle_to_start(dtp, "vmlinux");
 	}
 
-	if (state)
+	if (state) {
+		if (state->rfp)
+			fclose(state->rfp);
+
 		dt_free(dtp, state);
+	}
 
 	return 0;
 }
-- 
2.43.5

