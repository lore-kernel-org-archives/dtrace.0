Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 910411C8610
	for <dtrace@lists.linux.dev>; Sat,  7 Jun 2025 06:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749276923; cv=fail; b=qhQwvoIbzF2ZQGM7V4rjA6OgrCwFP8G/qfcAENtAAmXTodDV5DbIJS2Ni4aY31Z7f6aI3qherQ9uKxwmvlMDV+wTgKn+4cUOtfB7GR3urmvkcPDJ1W+CIT1pplpVvFD1i64HNwzR1M1s2TLJzkNmzEWBqr/gtkBFdnB6WfUxJ+o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749276923; c=relaxed/simple;
	bh=aglahx8VhT7ftPbySFeCXsw7UQYGUxRhIbmYfOV4oS4=;
	h=Date:From:To:Subject:Content-Type:Message-ID:MIME-Version; b=czf/hBpGGtTAL7l2uq9jU8tLTY62dPrSnhOWWjV2RnhK871XbBRWMq0C5CfJUTyvWgJdGw8KMUkZMaFNX2S3alJvN8hgzYMnZRDTpiSXwurTSRCnoy4Oaip8lVO3Bj9GQ23Bosw6dfvgRnacPG7o4IGOrBF94j4W1gE/h+zycjA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=LM/mxg77; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Tl7tjYa2; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="LM/mxg77";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Tl7tjYa2"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5575e04L022969
	for <dtrace@lists.linux.dev>; Sat, 7 Jun 2025 06:15:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=pwfjzGzkCE38kBz4oUzm6EVaxr7v6F2KYKttD7z1tEI=; b=
	LM/mxg77ld4lf374LFHH3Y3fXjIFvCjDsroNcXM2TwbQiYxQwYrNJHp4h75nTPMj
	4KJBnIOccynx5z5ucqKMYrVCPUc5rFAUweEEIh59zyBz5KVZixAKcRrVKFrNkzb3
	prallW371MQDuOa4FPFcWH3P5Jtra8p7ew0WpsDUvUczacopbSx1IO/0yUURT1hO
	88Sj+LLB3j51lWS99QTgfijRRnRKB7SECMvntA6fuKyAcsymd+WLRAHaU46VU7+Q
	Bu4GdqXOQT7ETn02J65FYx2fBXdqeUi8bxnJU8d1lzXSuiRtOEwQKM52m43ro0wd
	G00CX+UN+1AUQZ/lsav6Zw==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 474dad025m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 07 Jun 2025 06:15:13 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5571XYgd020720
	for <dtrace@lists.linux.dev>; Sat, 7 Jun 2025 06:15:12 GMT
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010043.outbound.protection.outlook.com [52.101.193.43])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 474bv6kysw-10
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 07 Jun 2025 06:15:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xpyg+EM4jOTcWE5aJIABYzF8StcE9GQIIlAs2B8g65/kZeNFR1D5Rf1sCRasoP0u9OVoz4yTJpT2vMo+MIRGUwZIhxudXkOW/UewwkrhUIj1Z6kz431Fb/Ehl/kk5ig+ydg57hEVNGJjixKFME1Zhclh8nTZ93JxBQVZOC7w3u2vtzxS6++a0lex7pLz0573bxd+Le9rNztkIm7UCRMeRPiwV8Cc7DXj6y66a0J5dcf8W5RvArcAFWhYbi6KAP90rwOBy2oTtjpNNmdqdS7EzO2DP6+eisJo7jfNFNziEU/qKkE5Zd7tZLzeiXGp7AZrsQnNarg731Knm27qMsNecw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pwfjzGzkCE38kBz4oUzm6EVaxr7v6F2KYKttD7z1tEI=;
 b=Ncy1UDxpptLxUkK6+/wZJbnzaXUqua9jGmmrwbyIwdftG1D7mDl84knt+Jeej76njworKAPofDfeGH6VLw+ukhDXjkGEKLGBZ9Z0eV0gAC69FhK2ntiBIGcpHuYAj7lY6IUpl1zyCtzW4eDWn8oRGz3poBkEaBzEVBzsYOiwzDr29nGeDAK1/LziPKVMuzqvGNAKV1QaQh7PSY3GC0YA8s8dD+LZ3x89wWIoTXLIw6cdi4+DpuXBX33ZKqjtZND0DEgMJIORZ8+qlb0wePYzP4GZTshw7NfppLhGI5yf9xKuRO3w4Sqr2UP70k7DpeMXO1u/TAxyhsJ34W1YeutG2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pwfjzGzkCE38kBz4oUzm6EVaxr7v6F2KYKttD7z1tEI=;
 b=Tl7tjYa2OQHcFE8FQv7AB0dPQjHy3t+OXxUrKIqTds7INiy0j1v5XzwJ/OCSi2pPcmbedI2qHnJ7U1Cx+zyDyUghqkWF+w9ieYgcHp3wVRB6NGCq0tlNThZpuMs7pPxuCfzH2Wd3709k4beI43t8tP7DzVLW16XlBpahDlA2fUg=
Received: from IA4PR10MB8374.namprd10.prod.outlook.com (2603:10b6:208:55c::22)
 by IA4PR10MB8636.namprd10.prod.outlook.com (2603:10b6:208:568::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.40; Sat, 7 Jun
 2025 06:15:07 +0000
Received: from IA4PR10MB8374.namprd10.prod.outlook.com
 ([fe80::fcf0:d1a9:788b:73ab]) by IA4PR10MB8374.namprd10.prod.outlook.com
 ([fe80::fcf0:d1a9:788b:73ab%5]) with mapi id 15.20.8813.020; Sat, 7 Jun 2025
 06:15:07 +0000
Date: Sat, 07 Jun 2025 02:15:06 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 15/17] link: implement USDT probe definitions in ELF notes
Content-Type: text/plain
X-ClientProxiedBy: BLAPR05CA0021.namprd05.prod.outlook.com
 (2603:10b6:208:36e::17) To IA4PR10MB8374.namprd10.prod.outlook.com
 (2603:10b6:208:55c::22)
Message-ID:
 <IA4PR10MB83741578CA0D3BD0A3C50511C269A@IA4PR10MB8374.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA4PR10MB8374:EE_|IA4PR10MB8636:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b0ddb6a-de3d-42ec-389e-08dda58aa632
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?mfkjR5T1gYP3/RCFFf+X2fcGQ2e0CNougZW4Pfdej/Ucmsh5gNjRcgF2t9mb?=
 =?us-ascii?Q?oqBvNWSM659VS2NwpZlJ62S8CGBrHJXlyNhEg9GJKUBawBPidvg7rYR7Tp2t?=
 =?us-ascii?Q?qlas2apJEoRCdo4mofyPiGFAM1mNHXklu+f+zHlP0WjZDBt2tSEJ8WTRWZBp?=
 =?us-ascii?Q?IYCWlKz5CUjPFxWyskkIO9tMXbYgdeZ/gex1MM1KJ+PAFecLj6DFbRqWnhmJ?=
 =?us-ascii?Q?N1XjNsRLsfkIbNB4ZGiWWssyQAHs17b5v4y+lkn2pNDEvXNWrOSsIXhNpod6?=
 =?us-ascii?Q?KMyZAk82Mo5nQwK8uaA11yyUE51BMdDvwelNtFSD869Q8lOJz4ath1PUy3ZZ?=
 =?us-ascii?Q?0LSCBGJyfiUykQdKhEUwWuLYczYX6w+aN5648WG+R6v5J6aPgm+WLAbaFFQX?=
 =?us-ascii?Q?P8dgYVtVEJ9yma6AsM65wyIHkZO8BD0v15uDfrJPssynzq6fu+egn6gtAWO8?=
 =?us-ascii?Q?4CNfegQ22oxzuNts9ZtYTJyTx0kE+IXjzR7oqA0tk7A2E9b3jSZaOrnGNd60?=
 =?us-ascii?Q?tCA7f7+gagl+3r0v6w06I+3wwL0e8a/G6AH3YLj6ZtsXo3blWona10B3uPJO?=
 =?us-ascii?Q?K3jDBuzZk7veUMM490uPPOME0o++IyOhQOR8ARp7pWbwgvkEyecRTUHWJJ5o?=
 =?us-ascii?Q?aQUgZ7YNMzl1PGAG0o5HTf9smW2bdGnPeSx1WGUAkC3GLGWmHcz3yxN+cK3F?=
 =?us-ascii?Q?CPc+Nam7Ln3Q0EmVDH8ZXFCIJBLxEl+lKSxR0UUMhge858Zg7fKQdtAENd6U?=
 =?us-ascii?Q?Iak6qOJ62ZoKztHaJVN7HO2ILNZOza5HQavafsqecu7PAGciopfnzoAV6PF1?=
 =?us-ascii?Q?qoESPB91ajXJhGpm73pO671xSYFqnA2EYZKdr2hulaOGRaFcD6Ex9UulLL5P?=
 =?us-ascii?Q?4Fl3XCywYyBZVtbETsxxXipme/WWBYyxH37lC6k/FI0AR5V2tgkcNDaRt6Kk?=
 =?us-ascii?Q?7lrxNuhuHiK4AO0AKFXzkSy9loZ3sA4bGBV8dNShW/Tu1d0QkHPbdo97u06t?=
 =?us-ascii?Q?qGJp/lE9u9QubiVQWMpRwJXTlVikAMtpb31lN7iiRSTuU2V36XctkjMZgoWu?=
 =?us-ascii?Q?Nd+ZBoWlDSuTaOYG4nfG1heGZeyW3tj/LK0m9ykiQoAfNsn3RJWPqmBxQ/ND?=
 =?us-ascii?Q?jeKCtx3RP+jIcml8+mtMmSYUeB2v/XNU1deqzx+nR47/QhjpMf+Z5tSpZ2CL?=
 =?us-ascii?Q?VnDRxaoa9B4VDjERjljureHEOt4we+ha0fZM9wlV74C4ifN377lmlWgqcRrk?=
 =?us-ascii?Q?YxzmUmjDuXAgwZ2aF8ACNkzBXw6XFxYlyehlrURsmNNnu4M+Ytf90QVRRPv5?=
 =?us-ascii?Q?tnw+3WQNILh/rFm+PTyK75AQOr8Zs4SIRWhgNVN4wWZNRazX4bSmnlt7jJWh?=
 =?us-ascii?Q?6e1tJea9pFgp740ynxASKKk0O0IXqqe7wkbhU2g41R+Hu5RR/EzeuDz2jOqu?=
 =?us-ascii?Q?LPisDO35oEo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA4PR10MB8374.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1kmeBYuQVRdaAJIeYoWdLCnJpJcgyCOQl1Pjbr7mrE1qLTZ8lTtbhFNBMM9c?=
 =?us-ascii?Q?v59+0JHjz9fCHhWlAK7MHzIskttv4PKq0b4vAO8DYXXTlaAshyYM1+HPuAko?=
 =?us-ascii?Q?wgvR79uVx0D9ceFp8ceYJ6hoEjSiUaHAXk/FnKwDoEisx1x6yYX+yI15Gl0I?=
 =?us-ascii?Q?ubqEFmA+Z/5V+mzjJeFqFslPJA6we2aOtpwbzTnJALdGBx3agB+GAx5GEcFd?=
 =?us-ascii?Q?ypaLXBV3D/XDB9MefYhZ64Eh2MC7SfSrr7d6MFB8DxUDoKDon1IKlYBzSSIZ?=
 =?us-ascii?Q?Z2/CkYBWyt42bQzEMuT1Nl5UyCjpdNSqGOx/O4YSkUzaMKPST3i3SjJKMeMD?=
 =?us-ascii?Q?7evJ6DXlXR/P6G2C66sKqKd2zGNTt22DAMK+wF8yoPagYaHoNk5/p5+uhzUO?=
 =?us-ascii?Q?5BDIMV7/GZTHR4vyeUdJO9UZh9L8EMBDicNn6UaTHYQ3GyrS18q//9huYugP?=
 =?us-ascii?Q?dEHj/Udc3XD9ZOzCAIffef4MP8xRbI+cOz0i8wfEEVMH1++2pN7l1hRWdfh4?=
 =?us-ascii?Q?QwpxZ133aZV21Y+No+LWH5ZOZtZca3V6mp+ZlasZz5RflO9EUIaJXHUD4Mtm?=
 =?us-ascii?Q?MHgq1bUvy79hb23OzOgSONPCWGJPJHql2ZzcA1712AAQyUwdi8P6XIyRe/HI?=
 =?us-ascii?Q?ocZdXe5iarWacq2lqrCCjc4byDisR3rqcbETDNgzGqtIs25gXPLJLImoDOyW?=
 =?us-ascii?Q?wMiyb7kFGppU4rsL1eV71Kfq5bDnSoX9mIRLVqXI2hfdvA/N6x+9+aduIzdn?=
 =?us-ascii?Q?WErWgPl8vUUMcwhNXRAH1rhqOd3cWqPJNazol2myaKEPo42eRC+IjnpnUbH8?=
 =?us-ascii?Q?E6akAbucAHyS22k48JNJPEaA+n7t/GTiPlE+/S/dos+xWE0i5AupfGH7aiDq?=
 =?us-ascii?Q?hMWIDUdZ/UUjohUNzTahkb2l/GEVD5X/GY/ro2pfxGTuC/8SIKivZWnM6Pgp?=
 =?us-ascii?Q?TgvoXtsExFjLqGf0ZzNbNddRf6Vlg2EioeBnewhKOyJdrVgTlAl7ziTOM0Q2?=
 =?us-ascii?Q?CCCmm8sB/r+g0uMeD8bC8TL7j3YfmegOqnK/Q6HRQGOZSE+WP41LA8AOCVmP?=
 =?us-ascii?Q?GwaeeKD12huniIl0FVc7AG/RUJ2uqzjb55v4Pg2LO6aKOFyVixItEHYzWN47?=
 =?us-ascii?Q?sypW8ZOFp+yVlxA8zkSrHL2zJHpKxCsAyen3oVfLY4WTShadcjZl9shifXhc?=
 =?us-ascii?Q?ubTpcjD7UHA7mO6yEBiX9bvn171lJD1W2znTK8hx2c2/glxNySFOtXqoyyzY?=
 =?us-ascii?Q?8pr1wW2b/Xb6V/bIK5CFEaW7rEEfSeJAKP2HBLOqIYvlZ8vG+UtQebYcm9Ae?=
 =?us-ascii?Q?WEW0OzliWYQ1YQvHplvamdV8ViS/3NXsfINetpiX6bvR2ZJ2mm/+ZLj3dXBD?=
 =?us-ascii?Q?RMYSDXZQPe6PF3ycBuJ/GKCI7NVAaPyTHyu69GZVEfES5TsHvXErG/vtKY40?=
 =?us-ascii?Q?JvAos5UuTaKlYTpvke8gG2YM+op936vlsh+v1cFWXbhhvR2AaHdl4C6dV2kR?=
 =?us-ascii?Q?uyT6g78EEtwLOAZneSCfP7CWr90U12YtJ9uaUTfFg1Sw6omCL7qRvO/dcVsU?=
 =?us-ascii?Q?2nXk5vOVaYhDzYjtXn0p3orCoGMRP0ChUWaQCK2FR8zUnRQ5Oc2NVWOuCMXm?=
 =?us-ascii?Q?AA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ecIoBhSa4UPeWJ+KfS0zwBhoZC/r7o7zfcVeEeM4g63Czd0JsgBG+DWuLbBbUB38pK/NhOVW612vwlWE0bsTyxZuVD0nM7ah0Od863dQV4sWLZBDG+/1xI3VhtZfizYZtTxB2ATVYUJyXuS42C1OeZIHLgRoYCqZ2FgDchjh2dZFM/hWYAo4YQ08ggaf029EiuTvREkgMP/tuBVQ4N8nAGstS+P5QL9n2eru2y+jFcgr0Dk+4O2e0KRUcSUJB+Ckhmq92/ZYGbgqyjbsI+pzuI1CTR5qCF0PYAxcIUZgyAHP8rWx684l1fEq2UoR9r1E5BtN61ISayVGKW70SqDRZRpIw9yGUzXoVtxunOuB82CbR3sFcT0N40baoZY/Pu5iILhoFscmszOBo0tIs/cGixjRkFyqZ3ROQQ2eLrJtFhTCQ4j6JCdnwTKPBK2KDW0igo+Lx+HdSA2GIRjxu2jmBKkt1kJcrUv+npSOK9KXQAJIh4FS6+12mD33fdCHNFY0vEfheWYxJDoNHIOtggn9t6hv0mvdgVO8onRGHzQF5HqJMaeIo/tmbieqVeZ41FD8FP22LHMJ1sGfZ+Dw6DkXXzTVom/YlNkEHJyqonaASAM=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b0ddb6a-de3d-42ec-389e-08dda58aa632
X-MS-Exchange-CrossTenant-AuthSource: IA4PR10MB8374.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2025 06:15:07.0762
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ovt9G2UdkEnrNka6xFLiOMB4dOtacz2hLybLJy2+7RT9YeNfhEi9Dn8fp2TQvJVHbX1rx4rUBN65kVMfk7rT8FH1WG4Gzn+ZAR4YBTH/YmA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR10MB8636
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-07_03,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 mlxlogscore=999 bulkscore=0
 malwarescore=0 suspectscore=0 spamscore=0 phishscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506070044
X-Proofpoint-ORIG-GUID: qsNwHtCipxrp4q3nMuyUTn5j1UJIRRVE
X-Authority-Analysis: v=2.4 cv=EJwG00ZC c=1 sm=1 tr=0 ts=6843d8f2 b=1 cx=c_pps a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=5ngfkrwh5pdPRbYyu7sA:9 a=tfwKPxVIJPsjsDgU:21 cc=ntf awl=host:13206
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA3MDA0NCBTYWx0ZWRfXzq7fFy3YETbD qwi6lwFVVNH2CROE3Zc6718E+VcDcIXY0sjfa7ozOwcBghsR4B4r7waqBlZml2/3n5mEw5koJad NzqmchZe+kCcAkyTzItyzMJvFYSJeeLgm0+mJK9h9gi+guuUwcqroiLiHhDwkm5AXejZx+/dbdw
 NgSqCP28YSqQDoYRDe85m+RS0MCeaZp6kgNXoqL9Gvit7QejRHxFvvfriz1LR1shbMOIjoMtpFa DS1eJJ/FCqZKWsA3GcnAUSSw2qY6jc46XJiHC2SgHe+KwXOncahRTUzrRPQ2MaA7CW86eQrshSa kg8u/BV32VXW0dnHFNddZar7r2ybALxVnQZWbUG4K4G77Dskn2ceZ4St67+UGIjW9JiGx9r4Biq
 306wT4IdepV5AODLeHBq7eQk+hAbbRKJIhH2hF52CbpX1gHREsVIitxDlnnQ6We4wk8Tra51
X-Proofpoint-GUID: qsNwHtCipxrp4q3nMuyUTn5j1UJIRRVE

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 libdtrace/drti.c                              |  131 +-
 libdtrace/dt_dof.c                            |   13 +-
 libdtrace/dt_impl.h                           |    8 +-
 libdtrace/dt_link.c                           | 1803 ++++-------------
 libdtrace/dt_program.c                        |   48 +-
 test/triggers/Build                           |   19 +-
 test/triggers/usdt-tst-arg-const-prov.d       |   19 +
 test/triggers/usdt-tst-arg-const.c            |   25 +
 test/triggers/usdt-tst-arg-reg-prov.d         |   19 +
 test/triggers/usdt-tst-arg-reg.c              |   35 +
 test/triggers/usdt-tst-deref-decode-prov.d    |   11 +
 test/triggers/usdt-tst-deref-decode.aarch64.c |   84 +
 test/triggers/usdt-tst-deref-decode.x86_64.c  |   80 +
 test/unittest/options/tst.strip.sh            |    8 +-
 ....guess32.sh => err.wrong-probe-argc-cc.sh} |   44 +-
 test/unittest/usdt/err.wrong-probe-argc-rt.sh |   59 +
 test/unittest/usdt/err.wrong-probe.sh         |   59 +
 test/unittest/usdt/err.wrong-prov.sh          |   59 +
 test/unittest/usdt/tst.arg-reg.d              |   38 +
 test/unittest/usdt/tst.arg-reg.r              |    9 +
 test/unittest/usdt/tst.badguess.sh            |   63 -
 test/unittest/usdt/tst.badguess.x             |    7 -
 test/unittest/usdt/tst.const.d                |   38 +
 test/unittest/usdt/tst.const.r                |    9 +
 test/unittest/usdt/tst.deref-decode.d         |   39 +
 test/unittest/usdt/tst.guess32.x              |    8 -
 .../usdt/tst.multiprov-dupprobe-shlibs.r.p    |    4 +
 test/utils/Build                              |    6 +-
 test/utils/showUSDT.c                         |  370 +++-
 uts/common/sys/sdt.h                          |  163 +-
 uts/common/sys/usdt.h                         |   83 +
 uts/common/sys/usdt_gennote.h                 |  139 ++
 uts/common/sys/usdt_internal.h                |  245 +++
 33 files changed, 1856 insertions(+), 1889 deletions(-)
 create mode 100644 test/triggers/usdt-tst-arg-const-prov.d
 create mode 100644 test/triggers/usdt-tst-arg-const.c
 create mode 100644 test/triggers/usdt-tst-arg-reg-prov.d
 create mode 100644 test/triggers/usdt-tst-arg-reg.c
 create mode 100644 test/triggers/usdt-tst-deref-decode-prov.d
 create mode 100644 test/triggers/usdt-tst-deref-decode.aarch64.c
 create mode 100644 test/triggers/usdt-tst-deref-decode.x86_64.c
 rename test/unittest/usdt/{tst.guess32.sh => err.wrong-probe-argc-cc.sh} (57%)
 create mode 100755 test/unittest/usdt/err.wrong-probe-argc-rt.sh
 create mode 100755 test/unittest/usdt/err.wrong-probe.sh
 create mode 100755 test/unittest/usdt/err.wrong-prov.sh
 create mode 100644 test/unittest/usdt/tst.arg-reg.d
 create mode 100644 test/unittest/usdt/tst.arg-reg.r
 delete mode 100755 test/unittest/usdt/tst.badguess.sh
 delete mode 100755 test/unittest/usdt/tst.badguess.x
 create mode 100644 test/unittest/usdt/tst.const.d
 create mode 100644 test/unittest/usdt/tst.const.r
 create mode 100644 test/unittest/usdt/tst.deref-decode.d
 delete mode 100755 test/unittest/usdt/tst.guess32.x
 create mode 100644 uts/common/sys/usdt.h
 create mode 100644 uts/common/sys/usdt_gennote.h
 create mode 100644 uts/common/sys/usdt_internal.h

diff --git a/libdtrace/drti.c b/libdtrace/drti.c
index 52a47061..ca512cb0 100644
--- a/libdtrace/drti.c
+++ b/libdtrace/drti.c
@@ -1,6 +1,6 @@
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2008, 2024, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2008, 2025, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
@@ -34,11 +34,8 @@
 
 static const char *devname = "/dev/dtrace/helper";
 
-static const char *modname;	/* Name of this load object */
 static int gen;			/* DOF helper generation */
-extern dof_hdr_t __SUNW_dof;	/* DOF defined in the .SUNW_dof section */
 static boolean_t dof_init_debug = B_FALSE;	/* From DTRACE_DOF_INIT_DEBUG */
-static dof_helper_t dh;
 
 static char *errmsg_open, *errmsg_ioctl_failed, *errmsg_ioctl_ok;
 
@@ -71,19 +68,7 @@ _dt_constructor_(dtrace_dof_init)
 static void
 dtrace_dof_init(void)
 {
-	dof_hdr_t *dof = &__SUNW_dof;
-#ifdef _LP64
-	Elf64_Ehdr *elf;
-#else
-	Elf32_Ehdr *elf;
-#endif
-	struct link_map *lmp = NULL;
-	Lmid_t lmid = -1;
 	const char *p;
-	char str[4096];			/* read buffer */
-	char *enm = NULL;		/* pointer to target executable name */
-	FILE *fp;
-	struct link_map fmap = { 0x0, };
 
 	if (getenv("DTRACE_DOF_INIT_DISABLE") != NULL)
 		return;
@@ -94,116 +79,11 @@ dtrace_dof_init(void)
 	if ((p = getenv("DTRACE_DOF_INIT_DEVNAME")) != NULL)
 		devname = p;
 
-#if 0
-	if (dlinfo(RTLD_SELF, RTLD_DI_LINKMAP, &lmp) == -1) {
-		dprintf(2, "DRTI: Couldn't discover module name or address.\n");
-		return;
-	}
-
-	if (dlinfo(RTLD_SELF, RTLD_DI_LMID, &lmid) == -1) {
-		dprintf(2, "DRTI: Couldn't discover link map ID.\n");
-		return;
-	}
-#else
-	lmid = 0;			/* We need a way to determine this. */
-
-	if ((fp = fopen("/proc/self/maps", "re")) == NULL) {
-		dprintf(2, "DRTI: Failed to open maps file.\n");
-		return;
-	}
-	while (fgets(str, sizeof(str), fp) != NULL) {
-		uintptr_t	start, end;
-		char		*p = str, *q;
-
-		start = strtoul(p, &p, 16);
-		if (*p != '-')
-			continue;
-
-		end = strtoul(++p, &p, 16);
-
-		if (start > (uintptr_t)dtrace_dof_init ||
-		    (uintptr_t)dtrace_dof_init > end)
-			continue;
-
-		if ((p = strrchr(str, ' ')) == NULL)
-			continue;
-		p++;  /* move past the leading space char */
-		if ((q = strchr(p, '\n')) != NULL)
-			*q = '\0';
-		enm = strdup(p); /* Save name of object w/ dtrace_dof_init */
-		break;
-	}
-
-	if (_dt_unlikely_(enm == NULL)) {
-		fclose(fp);
-		dprintf(2, "DRTI: Couldn't discover module name or address.\n");
-		return;
-	}
-
-	/* Now start at the beginning & look for 1st segment of the target */
-	rewind(fp);
-	while (fgets(str, sizeof(str), fp) != NULL) {
-		uintptr_t	start;
-		char		*p = str, *q;
-
-		start = strtoul(p, &p, 16);
-		if (*p != '-')
-			continue;
-		if ((p = strrchr(str, ' ')) == NULL)
-			continue;
-		p++;  /* move past the leading space char */
-		if ((q = strchr(p, '\n')) != NULL)
-			*q = '\0';
-
-		/* If found the 1st segment of the target executable */
-		if (strcmp(enm, p) == 0) {
-			fmap.l_addr = start;  /* record start address */
-			fmap.l_name = p;
-			lmp = &fmap;
-			break;
-		}
-	}
-	free(enm);
-	fclose(fp);
-#endif
-	if (_dt_unlikely_(lmp == NULL)) {
-		dprintf(2, "DRTI: Couldn't discover module name or address.\n");
-		return;
-	}
-
-	if ((modname = strrchr(lmp->l_name, '/')) == NULL)
-		modname = lmp->l_name;
-	else
-		modname++;
-
-	if (dof->dofh_ident[DOF_ID_MAG0] != DOF_MAG_MAG0 ||
-	    dof->dofh_ident[DOF_ID_MAG1] != DOF_MAG_MAG1 ||
-	    dof->dofh_ident[DOF_ID_MAG2] != DOF_MAG_MAG2 ||
-	    dof->dofh_ident[DOF_ID_MAG3] != DOF_MAG_MAG3) {
-		dprintf(2, "DRTI: .SUNW_dof section corrupt in %s.\n",
-			lmp->l_name);
-		return;
-	}
-
-	elf = (void *)lmp->l_addr;
-
-	dh.dofhp_dof = (uintptr_t)dof;
-	dh.dofhp_addr = elf->e_type == ET_DYN ? lmp->l_addr : 0;
-
-	if (lmid == 0) {
-		(void) snprintf(dh.dofhp_mod, sizeof (dh.dofhp_mod),
-		    "%s", modname);
-	} else {
-		(void) snprintf(dh.dofhp_mod, sizeof (dh.dofhp_mod),
-		    "LM%lu`%s", lmid, modname);
-	}
-
 	/*
 	 * Prep error messages to avoid non-async-signal-safe printfs inside
 	 * dtrace_dof_register().
 	 */
-	if (asprintf(&errmsg_ioctl_failed, "DRTI: Ioctl failed for DOF at %llx\n",
-		     (long long unsigned) dh.dofhp_addr) < 0)
+	if (asprintf(&errmsg_ioctl_failed, "DRTI: Ioctl failed\n") < 0)
 		errmsg_ioctl_failed = NULL;
 
 	if (dof_init_debug) {
@@ -211,8 +91,8 @@ dtrace_dof_init(void)
 			     devname) < 0)
 			errmsg_open = NULL;
 
-		if (asprintf(&errmsg_ioctl_ok, "DRTI: Ioctl OK for DOF at %llx (gen %d)\n",
-			     (long long unsigned) dh.dofhp_addr, gen) < 0)
+		if (asprintf(&errmsg_ioctl_ok, "DRTI: Ioctl OK (gen %d)\n",
+			     gen) < 0)
 			errmsg_ioctl_ok = NULL;
 	}
 
@@ -231,7 +111,8 @@ dtrace_dof_register(void)
 		return;
 	}
 
-	if ((gen = ioctl(fd, DTRACEHIOC_ADDDOF, &dh)) == -1) {
+	gen = ioctl(fd, DTRACEHIOC_HASUSDT, (uintptr_t)dtrace_dof_init);
+	if (gen == -1) {
 		if (errmsg_ioctl_failed)
 			write(2, errmsg_ioctl_failed,
 			      strlen(errmsg_ioctl_failed));
diff --git a/libdtrace/dt_dof.c b/libdtrace/dt_dof.c
index 9e5c3e1e..056fb646 100644
--- a/libdtrace/dt_dof.c
+++ b/libdtrace/dt_dof.c
@@ -1,6 +1,6 @@
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2006, 2024, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2006, 2025, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
@@ -362,6 +362,17 @@ dof_add_probe(dt_idhash_t *dhp, dt_ident_t *idp, void *data)
 	dofpr.dofpr_pad1 = 0;
 	dofpr.dofpr_pad2 = 0;
 
+	if (prp->pr_inst == NULL) {
+		dofpr.dofpr_func = 0;
+		dofpr.dofpr_offidx = 0;
+		dofpr.dofpr_noffs = 0;
+		dofpr.dofpr_enoffidx = 0;
+		dofpr.dofpr_nenoffs = 0;
+
+		dt_buf_write(dtp, &ddo->ddo_probes, &dofpr,
+		    sizeof(dofpr), sizeof(uint64_t));
+	}
+
 	for (pip = prp->pr_inst; pip != NULL; pip = pip->pi_next) {
 		dt_dprintf("adding probe for %s:%s\n", pip->pi_fname,
 		    prp->pr_name);
diff --git a/libdtrace/dt_impl.h b/libdtrace/dt_impl.h
index 68fb8ec5..3bb7c344 100644
--- a/libdtrace/dt_impl.h
+++ b/libdtrace/dt_impl.h
@@ -1,6 +1,6 @@
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2010, 2024, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2010, 2025, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
@@ -52,7 +52,11 @@ extern "C" {
 #include <dt_version.h>
 
 #ifndef ARRAY_SIZE
-# define ARRAY_SIZE(arr)		(sizeof(arr) / sizeof((arr)[0]))
+# define ARRAY_SIZE(arr)	(sizeof(arr) / sizeof((arr)[0]))
+#endif
+
+#ifndef ALIGN
+# define ALIGN(n, p2)		(((n) + (p2) - 1) & ~((p2) - 1))
 #endif
 
 #ifndef __stringify
diff --git a/libdtrace/dt_link.c b/libdtrace/dt_link.c
index b2148a8b..c9e0ea5f 100644
--- a/libdtrace/dt_link.c
+++ b/libdtrace/dt_link.c
@@ -1,6 +1,6 @@
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2008, 2023, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2008, 2025, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
@@ -30,1464 +30,383 @@
 #include <dt_probe.h>
 #include <dt_program.h>
 #include <dt_string.h>
+#include <sys/usdt_note_defs.h>
 
-#define	ESHDR_NULL	0
-#define	ESHDR_SHSTRTAB	1
-#define	ESHDR_STACKNOTE	2
-#define	ESHDR_DOF	3
-#define	ESHDR_STRTAB	4
-#define	ESHDR_SYMTAB	5
-#define	ESHDR_REL	6
-#define	ESHDR_NUM	7
-
-#define	PWRITE_SCN(index, data) \
-	(lseek64(fd, (off64_t)elf_file.shdr[(index)].sh_offset, SEEK_SET) != \
-	(off64_t)elf_file.shdr[(index)].sh_offset || \
-	dt_write(dtp, fd, (data), elf_file.shdr[(index)].sh_size) != \
-	elf_file.shdr[(index)].sh_size)
-
-static const char DTRACE_SHSTRTAB32[] = "\0"
-#define NAMEOFF_SHSTRTAB	1
-					".shstrtab\0"		/* 1 */
-#define NAMEOFF_STACKNOTE	11
-					".note.GNU-stack\0"	/* 11 */
-#define NAMEOFF_DOF		27
-					".SUNW_dof\0"		/* 27 */
-#define NAMEOFF_STRTAB		37
-					".strtab\0"		/* 37 */
-#define NAMEOFF_SYMTAB		45
-					".symtab\0"		/* 45 */
-#define NAMEOFF_REL		53
-#ifdef __sparc
-					".rela.SUNW_dof";	/* 53 */
-#else
-					".rel.SUNW_dof";	/* 53 */
-#endif
-
-static const char DTRACE_SHSTRTAB64[] = "\0"
-					".shstrtab\0"		/* 1 */
-					".note.GNU-stack\0"	/* 11 */
-					".SUNW_dof\0"		/* 27 */
-					".strtab\0"		/* 37 */
-					".symtab\0"		/* 45 */
-					".rela.SUNW_dof";	/* 53 */
-
-static const char DOFSTR[] = "__SUNW_dof";
-static const char DOFLAZYSTR[] = "___SUNW_dof";
-
-typedef struct dt_link_pair {
-	struct dt_link_pair *dlp_next;	/* next pair in linked list */
-	void *dlp_str;			/* buffer for string table */
-	void *dlp_sym;			/* buffer for symbol table */
-} dt_link_pair_t;
-
-typedef struct dof_elf32 {
-	uint32_t de_nrel;		/* relocation count */
-#ifdef __sparc
-	Elf32_Rela *de_rel;		/* array of relocations for sparc */
-#else
-	Elf32_Rel *de_rel;		/* array of relocations for x86 */
-#endif
-	uint32_t de_nsym;		/* symbol count */
-	Elf32_Sym *de_sym;		/* array of symbols */
-	uint32_t de_strlen;		/* size of of string table */
-	char *de_strtab;		/* string table */
-	uint32_t de_global;		/* index of the first global symbol */
-} dof_elf32_t;
-
-static int
-prepare_elf32(dtrace_hdl_t *dtp, const dof_hdr_t *dof, dof_elf32_t *dep)
-{
-	dof_sec_t *dofs, *s;
-	dof_relohdr_t *dofrh;
-	dof_relodesc_t *dofr;
-	char *strtab;
-	int i, j, nrel;
-	size_t strtabsz = 1;
-	uint32_t count = 0;
-	size_t base;
-	Elf32_Sym *sym;
-#ifdef __sparc
-	Elf32_Rela *rel;
-#else
-	Elf32_Rel *rel;
-#endif
-
-	/*LINTED*/
-	dofs = (dof_sec_t *)((char *)dof + dof->dofh_secoff);
-
-	/*
-	 * First compute the size of the string table and the number of
-	 * relocations present in the DOF.
-	 */
-	for (i = 0; i < dof->dofh_secnum; i++) {
-		if (dofs[i].dofs_type != DOF_SECT_URELHDR)
-			continue;
-
-		/*LINTED*/
-		dofrh = (dof_relohdr_t *)((char *)dof + dofs[i].dofs_offset);
-
-		s = &dofs[dofrh->dofr_strtab];
-		strtab = (char *)dof + s->dofs_offset;
-		assert(strtab[0] == '\0');
-		strtabsz += s->dofs_size - 1;
-
-		s = &dofs[dofrh->dofr_relsec];
-		/*LINTED*/
-		dofr = (dof_relodesc_t *)((char *)dof + s->dofs_offset);
-		count += s->dofs_size / s->dofs_entsize;
-	}
-
-	dep->de_strlen = strtabsz;
-	dep->de_nrel = count;
-	dep->de_nsym = count + 1; /* the first symbol is always null */
-
-	if (dtp->dt_lazyload) {
-		dep->de_strlen += sizeof(DOFLAZYSTR);
-		dep->de_nsym++;
-	} else {
-		dep->de_strlen += sizeof(DOFSTR);
-		dep->de_nsym++;
-	}
-
-	if ((dep->de_rel = calloc(dep->de_nrel,
-	    sizeof(dep->de_rel[0]))) == NULL) {
-		return dt_set_errno(dtp, EDT_NOMEM);
-	}
-
-	if ((dep->de_sym = calloc(dep->de_nsym, sizeof(Elf32_Sym))) == NULL) {
-		free(dep->de_rel);
-		return dt_set_errno(dtp, EDT_NOMEM);
-	}
-
-	if ((dep->de_strtab = calloc(dep->de_strlen, 1)) == NULL) {
-		free(dep->de_rel);
-		free(dep->de_sym);
-		return dt_set_errno(dtp, EDT_NOMEM);
-	}
-
-	count = 0;
-	strtabsz = 1;
-	dep->de_strtab[0] = '\0';
-	rel = dep->de_rel;
-	sym = dep->de_sym;
-	dep->de_global = 1;
-
-	/*
-	 * The first symbol table entry must be zeroed and is always ignored.
-	 */
-	memset(sym, 0, sizeof(Elf32_Sym));
-	sym++;
-
-	/*
-	 * Take a second pass through the DOF sections filling in the
-	 * memory we allocated.
-	 */
-	for (i = 0; i < dof->dofh_secnum; i++) {
-		if (dofs[i].dofs_type != DOF_SECT_URELHDR)
-			continue;
-
-		/*LINTED*/
-		dofrh = (dof_relohdr_t *)((char *)dof + dofs[i].dofs_offset);
-
-		s = &dofs[dofrh->dofr_strtab];
-		strtab = (char *)dof + s->dofs_offset;
-		memcpy(dep->de_strtab + strtabsz, strtab + 1, s->dofs_size);
-		base = strtabsz;
-		strtabsz += s->dofs_size - 1;
-
-		s = &dofs[dofrh->dofr_relsec];
-		/*LINTED*/
-		dofr = (dof_relodesc_t *)((char *)dof + s->dofs_offset);
-		nrel = s->dofs_size / s->dofs_entsize;
-
-		s = &dofs[dofrh->dofr_tgtsec];
-
-		for (j = 0; j < nrel; j++) {
-#if defined(__i386) || defined(__amd64)
-			rel->r_offset = s->dofs_offset +
-			    dofr[j].dofr_offset;
-			rel->r_info = ELF32_R_INFO(count + dep->de_global,
-			    R_386_32);
-#elif defined(__sparc)
-			/*
-			 * Add 4 bytes to hit the low half of this 64-bit
-			 * big-endian address.
-			 */
-			rel->r_offset = s->dofs_offset +
-			    dofr[j].dofr_offset + 4;
-			rel->r_info = ELF32_R_INFO(count + dep->de_global,
-			    R_SPARC_32);
-#elif defined(__aarch64__)
-			rel->r_offset = s->dofs_offset +
-			    dofr[j].dofr_offset;
-			rel->r_info = ELF32_R_INFO(count + dep->de_global,
-			    R_ARM_ABS32);
-#else
-#error unknown ISA
-#endif
-
-			sym->st_name = base + dofr[j].dofr_name - 1;
-			sym->st_value = 0;
-			sym->st_size = 0;
-			sym->st_info = ELF32_ST_INFO(STB_GLOBAL, STT_FUNC);
-			sym->st_other = 0;
-			sym->st_shndx = SHN_UNDEF;
-
-			rel++;
-			sym++;
-			count++;
-		}
-	}
-
-	/*
-	 * Add a symbol for the DOF itself. We use a different symbol for
-	 * lazily and actively loaded DOF to make them easy to distinguish.
-	 */
-	sym->st_name = strtabsz;
-	sym->st_value = 0;
-	sym->st_size = dof->dofh_filesz;
-	sym->st_info = ELF32_ST_INFO(STB_GLOBAL, STT_OBJECT);
-	sym->st_other = ELF32_ST_VISIBILITY(STV_HIDDEN);
-	sym->st_shndx = ESHDR_DOF;
-	sym++;
-
-	if (dtp->dt_lazyload) {
-		memcpy(dep->de_strtab + strtabsz, DOFLAZYSTR,
-		    sizeof(DOFLAZYSTR));
-		strtabsz += sizeof(DOFLAZYSTR);
-	} else {
-		memcpy(dep->de_strtab + strtabsz, DOFSTR, sizeof(DOFSTR));
-		strtabsz += sizeof(DOFSTR);
-	}
-
-	assert(count == dep->de_nrel);
-	assert(strtabsz == dep->de_strlen);
-
-	return 0;
-}
-
-
-typedef struct dof_elf64 {
-	uint32_t de_nrel;
-	Elf64_Rela *de_rel;
-	uint32_t de_nsym;
-	Elf64_Sym *de_sym;
-
-	uint32_t de_strlen;
-	char *de_strtab;
-
-	uint32_t de_global;
-} dof_elf64_t;
-
-static int
-prepare_elf64(dtrace_hdl_t *dtp, const dof_hdr_t *dof, dof_elf64_t *dep)
-{
-	dof_sec_t *dofs, *s;
-	dof_relohdr_t *dofrh;
-	dof_relodesc_t *dofr;
-	char *strtab;
-	int i, j, nrel;
-	size_t strtabsz = 1;
-	uint32_t count = 0;
-	size_t base;
-	Elf64_Sym *sym;
-	Elf64_Rela *rel;
-
-	/*LINTED*/
-	dofs = (dof_sec_t *)((char *)dof + dof->dofh_secoff);
-
-	/*
-	 * First compute the size of the string table and the number of
-	 * relocations present in the DOF.
-	 */
-	for (i = 0; i < dof->dofh_secnum; i++) {
-		if (dofs[i].dofs_type != DOF_SECT_URELHDR)
-			continue;
-
-		/*LINTED*/
-		dofrh = (dof_relohdr_t *)((char *)dof + dofs[i].dofs_offset);
-
-		s = &dofs[dofrh->dofr_strtab];
-		strtab = (char *)dof + s->dofs_offset;
-		assert(strtab[0] == '\0');
-		strtabsz += s->dofs_size - 1;
-
-		s = &dofs[dofrh->dofr_relsec];
-		/*LINTED*/
-		dofr = (dof_relodesc_t *)((char *)dof + s->dofs_offset);
-		count += s->dofs_size / s->dofs_entsize;
-	}
-
-	dep->de_strlen = strtabsz;
-	dep->de_nrel = count;
-	dep->de_nsym = count + 1; /* the first symbol is always null */
-
-	if (dtp->dt_lazyload) {
-		dep->de_strlen += sizeof(DOFLAZYSTR);
-		dep->de_nsym++;
-	} else {
-		dep->de_strlen += sizeof(DOFSTR);
-		dep->de_nsym++;
-	}
-
-	if ((dep->de_rel = calloc(dep->de_nrel,
-	    sizeof(dep->de_rel[0]))) == NULL) {
-		return dt_set_errno(dtp, EDT_NOMEM);
-	}
-
-	if ((dep->de_sym = calloc(dep->de_nsym, sizeof(Elf64_Sym))) == NULL) {
-		free(dep->de_rel);
-		return dt_set_errno(dtp, EDT_NOMEM);
-	}
-
-	if ((dep->de_strtab = calloc(dep->de_strlen, 1)) == NULL) {
-		free(dep->de_rel);
-		free(dep->de_sym);
-		return dt_set_errno(dtp, EDT_NOMEM);
-	}
-
-	count = 0;
-	strtabsz = 1;
-	dep->de_strtab[0] = '\0';
-	rel = dep->de_rel;
-	sym = dep->de_sym;
-	dep->de_global = 1;
-
-	/*
-	 * The first symbol table entry must be zeroed and is always ignored.
-	 */
-	memset(sym, 0, sizeof(Elf64_Sym));
-	sym++;
-
-	/*
-	 * Take a second pass through the DOF sections filling in the
-	 * memory we allocated.
-	 */
-	for (i = 0; i < dof->dofh_secnum; i++) {
-		if (dofs[i].dofs_type != DOF_SECT_URELHDR)
-			continue;
-
-		/*LINTED*/
-		dofrh = (dof_relohdr_t *)((char *)dof + dofs[i].dofs_offset);
-
-		s = &dofs[dofrh->dofr_strtab];
-		strtab = (char *)dof + s->dofs_offset;
-		memcpy(dep->de_strtab + strtabsz, strtab + 1, s->dofs_size);
-		base = strtabsz;
-		strtabsz += s->dofs_size - 1;
-
-		s = &dofs[dofrh->dofr_relsec];
-		/*LINTED*/
-		dofr = (dof_relodesc_t *)((char *)dof + s->dofs_offset);
-		nrel = s->dofs_size / s->dofs_entsize;
-
-		s = &dofs[dofrh->dofr_tgtsec];
-
-		for (j = 0; j < nrel; j++) {
-#if defined(__i386) || defined(__amd64)
-			rel->r_offset = s->dofs_offset +
-			    dofr[j].dofr_offset;
-			rel->r_info = ELF64_R_INFO(count + dep->de_global,
-			    R_X86_64_GLOB_DAT);
-#elif defined(__sparc)
-			rel->r_offset = s->dofs_offset +
-			    dofr[j].dofr_offset;
-			rel->r_info = ELF64_R_INFO(count + dep->de_global,
-			    R_SPARC_64);
-#elif defined(__aarch64__)
-			rel->r_offset = s->dofs_offset +
-			    dofr[j].dofr_offset;
-			rel->r_info = ELF64_R_INFO(count + dep->de_global,
-			    R_AARCH64_ABS64);
-#else
-#error unknown ISA
-#endif
-
-			sym->st_name = base + dofr[j].dofr_name - 1;
-			sym->st_value = 0;
-			sym->st_size = 0;
-			sym->st_info = GELF_ST_INFO(STB_GLOBAL, STT_FUNC);
-			sym->st_other = 0;
-			sym->st_shndx = SHN_UNDEF;
-
-			rel++;
-			sym++;
-			count++;
-		}
-	}
-
-	/*
-	 * Add a symbol for the DOF itself. We use a different symbol for
-	 * lazily and actively loaded DOF to make them easy to distinguish.
-	 */
-	sym->st_name = strtabsz;
-	sym->st_value = 0;
-	sym->st_size = dof->dofh_filesz;
-	sym->st_info = GELF_ST_INFO(STB_GLOBAL, STT_OBJECT);
-	sym->st_other = ELF64_ST_VISIBILITY(STV_HIDDEN);
-	sym->st_shndx = ESHDR_DOF;
-	sym++;
-
-	if (dtp->dt_lazyload) {
-		memcpy(dep->de_strtab + strtabsz, DOFLAZYSTR,
-		    sizeof(DOFLAZYSTR));
-		strtabsz += sizeof(DOFLAZYSTR);
-	} else {
-		memcpy(dep->de_strtab + strtabsz, DOFSTR, sizeof(DOFSTR));
-		strtabsz += sizeof(DOFSTR);
-	}
-
-	assert(count == dep->de_nrel);
-	assert(strtabsz == dep->de_strlen);
-
-	return 0;
-}
-
-/*
- * Write out an ELF32 file prologue consisting of a header, section headers,
- * and a section header string table.  The DOF data will follow this prologue
- * and complete the contents of the given ELF file.
- */
+_dt_printflike_(4,5)
 static int
-dump_elf32(dtrace_hdl_t *dtp, const dof_hdr_t *dof, int fd)
+dt_link_error(dtrace_hdl_t *dtp, Elf *elf, int fd, const char *format, ...)
 {
-	struct {
-		Elf32_Ehdr ehdr;
-		Elf32_Shdr shdr[ESHDR_NUM];
-	} elf_file;
-
-	Elf32_Shdr *shp;
-	Elf32_Off off;
-	dof_elf32_t de;
-	int ret = 0;
-	uint_t nshdr;
-
-	de.de_sym = NULL; /* gcc -Wmaybe-uninitialized */
-	if (prepare_elf32(dtp, dof, &de) != 0)
-		return -1; /* errno is set for us */
-
-	/*
-	 * If there are no relocations, we only need enough sections for
-	 * the shstrtab and the DOF.
-	 */
-	nshdr = de.de_nrel == 0 ? ESHDR_SYMTAB + 1 : ESHDR_NUM;
-
-	memset(&elf_file, 0, sizeof(elf_file));
-
-	elf_file.ehdr.e_ident[EI_MAG0] = ELFMAG0;
-	elf_file.ehdr.e_ident[EI_MAG1] = ELFMAG1;
-	elf_file.ehdr.e_ident[EI_MAG2] = ELFMAG2;
-	elf_file.ehdr.e_ident[EI_MAG3] = ELFMAG3;
-	elf_file.ehdr.e_ident[EI_VERSION] = EV_CURRENT;
-	elf_file.ehdr.e_ident[EI_CLASS] = ELFCLASS32;
-#if defined(_BIG_ENDIAN)
-	elf_file.ehdr.e_ident[EI_DATA] = ELFDATA2MSB;
-#elif defined(_LITTLE_ENDIAN)
-	elf_file.ehdr.e_ident[EI_DATA] = ELFDATA2LSB;
-#endif
-	elf_file.ehdr.e_type = ET_REL;
-#if defined(__sparc)
-	elf_file.ehdr.e_machine = EM_SPARC;
-#elif defined(__i386) || defined(__amd64)
-	elf_file.ehdr.e_machine = EM_386;
-#endif
-	elf_file.ehdr.e_version = EV_CURRENT;
-	elf_file.ehdr.e_shoff = sizeof(Elf32_Ehdr);
-	elf_file.ehdr.e_ehsize = sizeof(Elf32_Ehdr);
-	elf_file.ehdr.e_phentsize = sizeof(Elf32_Phdr);
-	elf_file.ehdr.e_shentsize = sizeof(Elf32_Shdr);
-	elf_file.ehdr.e_shnum = nshdr;
-	elf_file.ehdr.e_shstrndx = ESHDR_SHSTRTAB;
-	off = sizeof(elf_file) + nshdr * sizeof(Elf32_Shdr);
-
-	shp = &elf_file.shdr[ESHDR_SHSTRTAB];
-	shp->sh_name = NAMEOFF_SHSTRTAB;
-	shp->sh_type = SHT_STRTAB;
-	shp->sh_offset = off;
-	shp->sh_size = sizeof(DTRACE_SHSTRTAB32);
-	shp->sh_addralign = sizeof(char);
-	off = shp->sh_offset + shp->sh_size;
-
-	shp = &elf_file.shdr[ESHDR_STACKNOTE];
-	shp->sh_name = NAMEOFF_STACKNOTE;
-	shp->sh_type = SHT_PROGBITS;
-	shp->sh_offset = off;
-	shp->sh_size = 0;
-	shp->sh_addralign = sizeof(char);
-	off = P2ROUNDUP(shp->sh_offset + shp->sh_size, 8);
-
-	shp = &elf_file.shdr[ESHDR_DOF];
-	shp->sh_name = NAMEOFF_DOF;
-	shp->sh_flags = SHF_ALLOC;
-	shp->sh_type = SHT_SUNW_dof;
-	shp->sh_offset = off;
-	shp->sh_size = dof->dofh_filesz;
-	shp->sh_addralign = 8;
-	off = shp->sh_offset + shp->sh_size;
-
-	shp = &elf_file.shdr[ESHDR_STRTAB];
-	shp->sh_name = NAMEOFF_STRTAB;
-	shp->sh_flags = SHF_ALLOC;
-	shp->sh_type = SHT_STRTAB;
-	shp->sh_offset = off;
-	shp->sh_size = de.de_strlen;
-	shp->sh_addralign = sizeof(char);
-	off = P2ROUNDUP(shp->sh_offset + shp->sh_size, 4);
-
-	shp = &elf_file.shdr[ESHDR_SYMTAB];
-	shp->sh_name = NAMEOFF_SYMTAB;
-	shp->sh_flags = SHF_ALLOC;
-	shp->sh_type = SHT_SYMTAB;
-	shp->sh_entsize = sizeof(Elf32_Sym);
-	shp->sh_link = ESHDR_STRTAB;
-	shp->sh_offset = off;
-	shp->sh_info = de.de_global;
-	shp->sh_size = de.de_nsym * sizeof(Elf32_Sym);
-	shp->sh_addralign = 4;
-	off = P2ROUNDUP(shp->sh_offset + shp->sh_size, 4);
-
-	if (de.de_nrel == 0) {
-		if (dt_write(dtp, fd, &elf_file,
-		    sizeof(elf_file)) != sizeof(elf_file) ||
-		    PWRITE_SCN(ESHDR_SHSTRTAB, DTRACE_SHSTRTAB32) ||
-		    PWRITE_SCN(ESHDR_STRTAB, de.de_strtab) ||
-		    PWRITE_SCN(ESHDR_SYMTAB, de.de_sym) ||
-		    PWRITE_SCN(ESHDR_DOF, dof)) {
-			ret = dt_set_errno(dtp, errno);
-		}
-	} else {
-		shp = &elf_file.shdr[ESHDR_REL];
-		shp->sh_name = NAMEOFF_REL;
-		shp->sh_flags = SHF_ALLOC;
-#ifdef __sparc
-		shp->sh_type = SHT_RELA;
-#else
-		shp->sh_type = SHT_REL;
-#endif
-		shp->sh_entsize = sizeof(de.de_rel[0]);
-		shp->sh_link = ESHDR_SYMTAB;
-		shp->sh_info = ESHDR_DOF;
-		shp->sh_offset = off;
-		shp->sh_size = de.de_nrel * sizeof(de.de_rel[0]);
-		shp->sh_addralign = 4;
-
-		if (dt_write(dtp, fd, &elf_file,
-		    sizeof(elf_file)) != sizeof(elf_file) ||
-		    PWRITE_SCN(ESHDR_SHSTRTAB, DTRACE_SHSTRTAB32) ||
-		    PWRITE_SCN(ESHDR_STRTAB, de.de_strtab) ||
-		    PWRITE_SCN(ESHDR_SYMTAB, de.de_sym) ||
-		    PWRITE_SCN(ESHDR_REL, de.de_rel) ||
-		    PWRITE_SCN(ESHDR_DOF, dof)) {
-			ret = dt_set_errno(dtp, errno);
-		}
-	}
-
-	free(de.de_strtab);
-	free(de.de_sym);
-	free(de.de_rel);
-
-	return ret;
-}
-
-/*
- * Write out an ELF64 file prologue consisting of a header, section headers,
- * and a section header string table.  The DOF data will follow this prologue
- * and complete the contents of the given ELF file.
- */
-static int
-dump_elf64(dtrace_hdl_t *dtp, const dof_hdr_t *dof, int fd)
-{
-	struct {
-		Elf64_Ehdr ehdr;
-		Elf64_Shdr shdr[ESHDR_NUM];
-	} elf_file;
-
-	Elf64_Shdr *shp;
-	Elf64_Off off;
-	dof_elf64_t de;
-	int ret = 0;
-	uint_t nshdr;
+	va_list ap;
 
-	de.de_sym = NULL; /* gcc -Wmaybe-uninitialized */
-	if (prepare_elf64(dtp, dof, &de) != 0)
-		return -1; /* errno is set for us */
+	va_start(ap, format);
+	dt_set_errmsg(dtp, NULL, NULL, NULL, 0, format, ap);
+	va_end(ap);
 
-	/*
-	 * If there are no relocations, we only need enough sections for
-	 * the shstrtab and the DOF.
-	 */
-	nshdr = de.de_nrel == 0 ? ESHDR_SYMTAB + 1 : ESHDR_NUM;
-
-	memset(&elf_file, 0, sizeof(elf_file));
-
-	elf_file.ehdr.e_ident[EI_MAG0] = ELFMAG0;
-	elf_file.ehdr.e_ident[EI_MAG1] = ELFMAG1;
-	elf_file.ehdr.e_ident[EI_MAG2] = ELFMAG2;
-	elf_file.ehdr.e_ident[EI_MAG3] = ELFMAG3;
-	elf_file.ehdr.e_ident[EI_VERSION] = EV_CURRENT;
-	elf_file.ehdr.e_ident[EI_CLASS] = ELFCLASS64;
-#if defined(_BIG_ENDIAN)
-	elf_file.ehdr.e_ident[EI_DATA] = ELFDATA2MSB;
-#elif defined(_LITTLE_ENDIAN)
-	elf_file.ehdr.e_ident[EI_DATA] = ELFDATA2LSB;
-#endif
-	elf_file.ehdr.e_type = ET_REL;
-#if defined(__sparc)
-	elf_file.ehdr.e_machine = EM_SPARCV9;
-#elif defined(__i386) || defined(__amd64)
-	elf_file.ehdr.e_machine = EM_X86_64;
-#elif defined(__aarch64__)
-	elf_file.ehdr.e_machine = EM_AARCH64;
-#endif
-	elf_file.ehdr.e_version = EV_CURRENT;
-	elf_file.ehdr.e_shoff = sizeof(Elf64_Ehdr);
-	elf_file.ehdr.e_ehsize = sizeof(Elf64_Ehdr);
-	elf_file.ehdr.e_phentsize = sizeof(Elf64_Phdr);
-	elf_file.ehdr.e_shentsize = sizeof(Elf64_Shdr);
-	elf_file.ehdr.e_shnum = nshdr;
-	elf_file.ehdr.e_shstrndx = ESHDR_SHSTRTAB;
-	off = sizeof(elf_file) + nshdr * sizeof(Elf64_Shdr);
-
-	shp = &elf_file.shdr[ESHDR_SHSTRTAB];
-	shp->sh_name = NAMEOFF_SHSTRTAB;
-	shp->sh_type = SHT_STRTAB;
-	shp->sh_offset = off;
-	shp->sh_size = sizeof(DTRACE_SHSTRTAB64);
-	shp->sh_addralign = sizeof(char);
-	off = shp->sh_offset + shp->sh_size;
-
-	shp = &elf_file.shdr[ESHDR_STACKNOTE];
-	shp->sh_name = NAMEOFF_STACKNOTE;
-	shp->sh_type = SHT_PROGBITS;
-	shp->sh_offset = off;
-	shp->sh_size = 0;
-	shp->sh_addralign = sizeof(char);
-	off = P2ROUNDUP(shp->sh_offset + shp->sh_size, 8);
-
-	shp = &elf_file.shdr[ESHDR_DOF];
-	shp->sh_name = NAMEOFF_DOF;
-	shp->sh_flags = SHF_ALLOC;
-	shp->sh_type = SHT_SUNW_dof;
-	shp->sh_offset = off;
-	shp->sh_size = dof->dofh_filesz;
-	shp->sh_addralign = 8;
-	off = shp->sh_offset + shp->sh_size;
-
-	shp = &elf_file.shdr[ESHDR_STRTAB];
-	shp->sh_name = NAMEOFF_STRTAB;
-	shp->sh_flags = SHF_ALLOC;
-	shp->sh_type = SHT_STRTAB;
-	shp->sh_offset = off;
-	shp->sh_size = de.de_strlen;
-	shp->sh_addralign = sizeof(char);
-	off = P2ROUNDUP(shp->sh_offset + shp->sh_size, 8);
-
-	shp = &elf_file.shdr[ESHDR_SYMTAB];
-	shp->sh_name = NAMEOFF_SYMTAB;
-	shp->sh_flags = SHF_ALLOC;
-	shp->sh_type = SHT_SYMTAB;
-	shp->sh_entsize = sizeof(Elf64_Sym);
-	shp->sh_link = ESHDR_STRTAB;
-	shp->sh_offset = off;
-	shp->sh_info = de.de_global;
-	shp->sh_size = de.de_nsym * sizeof(Elf64_Sym);
-	shp->sh_addralign = 8;
-	off = P2ROUNDUP(shp->sh_offset + shp->sh_size, 8);
-
-	if (de.de_nrel == 0) {
-		if (dt_write(dtp, fd, &elf_file,
-		    sizeof(elf_file)) != sizeof(elf_file) ||
-		    PWRITE_SCN(ESHDR_SHSTRTAB, DTRACE_SHSTRTAB64) ||
-		    PWRITE_SCN(ESHDR_STRTAB, de.de_strtab) ||
-		    PWRITE_SCN(ESHDR_SYMTAB, de.de_sym) ||
-		    PWRITE_SCN(ESHDR_DOF, dof)) {
-			ret = dt_set_errno(dtp, errno);
-		}
-	} else {
-		shp = &elf_file.shdr[ESHDR_REL];
-		shp->sh_name = NAMEOFF_REL;
-		shp->sh_flags = SHF_ALLOC;
-		shp->sh_type = SHT_RELA;
-		shp->sh_entsize = sizeof(de.de_rel[0]);
-		shp->sh_link = ESHDR_SYMTAB;
-		shp->sh_info = ESHDR_DOF;
-		shp->sh_offset = off;
-		shp->sh_size = de.de_nrel * sizeof(de.de_rel[0]);
-		shp->sh_addralign = 8;
-
-		if (dt_write(dtp, fd, &elf_file,
-		    sizeof(elf_file)) != sizeof(elf_file) ||
-		    PWRITE_SCN(ESHDR_SHSTRTAB, DTRACE_SHSTRTAB64) ||
-		    PWRITE_SCN(ESHDR_STRTAB, de.de_strtab) ||
-		    PWRITE_SCN(ESHDR_SYMTAB, de.de_sym) ||
-		    PWRITE_SCN(ESHDR_REL, de.de_rel) ||
-		    PWRITE_SCN(ESHDR_DOF, dof)) {
-			ret = dt_set_errno(dtp, errno);
-		}
-	}
+	if (elf != NULL)
+		elf_end(elf);
 
-	free(de.de_strtab);
-	free(de.de_sym);
-	free(de.de_rel);
+	if (fd >= 0)
+		close(fd);
 
-	return ret;
+	return dt_set_errno(dtp, EDT_COMPILER);
 }
 
-static int
-dt_elf_symtab_lookup(Elf_Data *data_sym, int nsym, uintptr_t addr, uint_t shn,
-    GElf_Sym *sym)
+typedef struct usdt_note usdt_note_t;
+struct usdt_note {
+	usdt_note_t	*next;
+	char		*data;
+	size_t		size;
+};
+
+typedef struct usdt_elf {
+	dtrace_hdl_t	*dtp;
+	Elf_Scn		*note;
+	off_t		base;
+	off_t		size;
+	usdt_note_t	notes;
+} usdt_elf_t;
+
+#define STORE_ATTR(n, d, c)	(((n) << 24) | ((d) << 16) | ((c) << 8))
+
+static void
+note_store_attr(char **p, const dtrace_attribute_t *ap)
 {
-	int i, ret = -1;
-	GElf_Sym s;
-
-	for (i = 0; i < nsym && gelf_getsym(data_sym, i, sym) != NULL; i++) {
-		if (GELF_ST_TYPE(sym->st_info) == STT_FUNC &&
-		    shn == sym->st_shndx &&
-		    sym->st_value <= addr &&
-		    addr < sym->st_value + sym->st_size) {
-			if (GELF_ST_BIND(sym->st_info) == STB_GLOBAL)
-				return 0;
-
-			ret = 0;
-			s = *sym;
-		}
-	}
+	uint32_t	*attr = (uint32_t *)*p;
 
-	if (ret == 0)
-		*sym = s;
-	return ret;
+	*attr = STORE_ATTR(ap->dtat_name, ap->dtat_data, ap->dtat_class);
+	*p += sizeof(uint32_t);
 }
 
-#if defined(__sparc)
-
-#define	DT_OP_RET		0x81c7e008
-#define	DT_OP_NOP		0x01000000
-#define	DT_OP_CALL		0x40000000
-#define	DT_OP_CLR_O0		0x90102000
-
-#define	DT_IS_MOV_O7(inst)	(((inst) & 0xffffe000) == 0x9e100000)
-#define	DT_IS_RESTORE(inst)	(((inst) & 0xc1f80000) == 0x81e80000)
-#define	DT_IS_RETL(inst)	(((inst) & 0xfff83fff) == 0x81c02008)
-
-#define	DT_RS2(inst)		((inst) & 0x1f)
-#define	DT_MAKE_RETL(reg)	(0x81c02008 | ((reg) << 14))
-
-/*ARGSUSED*/
 static int
-dt_modtext(dtrace_hdl_t *dtp, char *p, GElf_Rela *rela, uint32_t *off)
+note_add_probe(dt_idhash_t *dhp, dt_ident_t *idp, void *data)
 {
-	uint32_t *ip;
-
-	if ((rela->r_offset & (sizeof(uint32_t) - 1)) != 0)
-		return -1;
-
-	/*LINTED*/
-	ip = (uint32_t *)(p + rela->r_offset);
-
-	/*
-	 * We only know about some specific relocation types.
-	 * We also recognize relocation type NONE, since that gets used for
-	 * relocations of USDT probes, and we might be re-processing a file.
-	 */
-	if (GELF_R_TYPE(rela->r_info) != R_SPARC_WDISP30 &&
-	    GELF_R_TYPE(rela->r_info) != R_SPARC_WPLT30 &&
-	    GELF_R_TYPE(rela->r_info) != R_386_NONE)
-		return -1;
-
-	/*
-	 * We may have already processed this object file in an earlier linker
-	 * invocation. Check to see if the present instruction sequence matches
-	 * the one we would install below.
-	 */
-	if (DT_IS_RESTORE(ip[1])) {
-		if (ip[0] == DT_OP_RET) {
-			(*off) += sizeof(ip[0]);
-			return 0;
-		}
-	} else if (DT_IS_MOV_O7(ip[1])) {
-		if (DT_IS_RETL(ip[0]))
-			return 0;
-	} else {
-		if (ip[0] == DT_OP_NOP) {
-			(*off) += sizeof(ip[0]);
-			return 0;
-		}
-	}
-
-	/*
-	 * We only expect call instructions with a displacement of 0.
-	 */
-	if (ip[0] != DT_OP_CALL) {
-		dt_dprintf("found %x instead of a call instruction at %llx\n",
-		    ip[0], (unsigned long long)rela->r_offset);
-		return -1;
-	}
-
-	/*
-	 * If the call is followed by a restore, it's a tail call so
-	 * change the call to a ret. If the call if followed by a mov
-	 * of a register into %o7, it's a tail call in leaf context
-	 * so change the call to a retl-like instruction that returns
-	 * to that register value + 8 (rather than the typical %o7 +
-	 * 8); the delay slot instruction is left, but should have no
-	 * effect. Otherwise we change the call to be a nop. We
-	 * identify the subsequent instruction as the probe point in
-	 * all but the leaf tail-call case to ensure that arguments to
-	 * the probe are complete and consistent. An astute, though
-	 * largely hypothetical, observer would note that there is the
-	 * possibility of a false-positive probe firing if the function
-	 * contained a branch to the instruction in the delay slot of
-	 * the call. Fixing this would require significant in-kernel
-	 * modifications, and isn't worth doing until we see it in the
-	 * wild.
-	 */
-	if (DT_IS_RESTORE(ip[1])) {
-		ip[0] = DT_OP_RET;
-		(*off) += sizeof(ip[0]);
-	} else if (DT_IS_MOV_O7(ip[1])) {
-		ip[0] = DT_MAKE_RETL(DT_RS2(ip[1]));
-	} else {
-		ip[0] = DT_OP_NOP;
-		(*off) += sizeof(ip[0]);
-	}
+	usdt_elf_t	*usdt = data;
+	usdt_note_t	*note;
+	dt_node_t	*dnp;
+	dt_probe_t	*prp = idp->di_data;
+	char		*buf, *p;
+	size_t		len, sz;
+	int		i;
+	char		n[DT_TYPE_NAMELEN];
+
+	len = strlen(prp->pr_name);
+	sz = ALIGN(len + 1, 4) + 2 * sizeof(uint8_t) +
+	     (prp->nargc + prp->xargc) * DT_TYPE_NAMELEN +
+	     prp->xargc * sizeof(uint8_t);
+	sz = ALIGN(sz, 4);
+
+	buf = malloc(sz);
+	if (buf == NULL)
+		return dt_set_errno(usdt->dtp, EDT_NOMEM);
+	memset(buf, 0, sz);
+
+	p = buf;
+	strcpy(p, prp->pr_name);
+	p += len + 1;
+	*(uint8_t *)p = prp->nargc;
+	p++;
+	for (dnp = prp->nargs; dnp != NULL; dnp = dnp->dn_list) {
+		strcpy(p, ctf_type_name(dnp->dn_ctfp, dnp->dn_type, n, sizeof(n)));
+		p += strlen(p) + 1;
+	}
+	*(uint8_t *)p = prp->xargc;
+	p++;
+	for (dnp = prp->xargs, i = 0; dnp != NULL; dnp = dnp->dn_list, i++) {
+		strcpy(p, ctf_type_name(dnp->dn_ctfp, dnp->dn_type, n, sizeof(n)));
+		p += strlen(p) + 1;
+		*p++ = prp->mapping[i];
+	}
+
+	sz = p - buf;
+
+	note = dt_zalloc(usdt->dtp, sizeof(usdt_note_t));
+	note->data = buf;
+	note->size = ALIGN(sz, 4);
+	note->next = usdt->notes.next;
+	usdt->notes.next = note;
 
 	return 0;
 }
 
-#elif defined(__i386) || defined(__amd64)
-
-#define	DT_OP_NOP		0x90
-#define	DT_OP_RET		0xc3
-#define	DT_OP_CALL		0xe8
-#define	DT_OP_JMP32		0xe9
-
 static int
-dt_modtext(dtrace_hdl_t *dtp, char *p, GElf_Rela *rela, uint32_t *off)
+note_add_provider(usdt_elf_t *usdt, dt_provider_t *pvp)
 {
-	uint8_t *ip = (uint8_t *)(p + rela->r_offset - 1);
-	uint8_t ret;
+	usdt_note_t	*note;
+	Elf_Data	*dbuf;
+	char		*buf, *p;
+	size_t		len, sz;
+	uint32_t	nprobes = dt_idhash_size(pvp->pv_probes);
 
-	/*
-	 * On x86, the first byte of the instruction is the call opcode and
-	 * the next four bytes are the 32-bit address; the relocation is for
-	 * the address operand. We back up the offset to the first byte of
-	 * the instruction. For is-enabled probes, we later advance the offset
-	 * so that it hits the first nop in the instruction sequence.
-	 */
-	(*off) -= 1;
+#define PROV_NOTE_HEADSZ \
+		((3 * sizeof(uint32_t)) +	/* namesz, descsz, type */ \
+		 ALIGN(strlen(_USDT_PV_NOTE_NAME) + 1, 4))	/* "prov\0" */
 
-	/*
-	 * We only know about some specific relocation types. Luckily these
-	 * types have the same values on both 32-bit and 64-bit x86
-	 * architectures.
-	 * We also recognize relocation type NONE, since that gets used for
-	 * relocations of USDT probes, and we might be re-processing a file.
-	 */
-	if (GELF_R_TYPE(rela->r_info) != R_386_PC32 &&
-	    GELF_R_TYPE(rela->r_info) != R_386_PLT32 &&
-	    GELF_R_TYPE(rela->r_info) != R_386_NONE) {
-		dt_dprintf("unexpected reloc type %li\n", GELF_R_TYPE(rela->r_info));
-		return -1;
-	}
-
-	/*
-	 * We may have already processed this object file in an earlier linker
-	 * invocation. Check to see if the present instruction sequence matches
-	 * the one we would install.
-	 */
-	if ((ip[0] == DT_OP_NOP || ip[0] == DT_OP_RET) &&
-	    ip[1] == DT_OP_NOP && ip[2] == DT_OP_NOP &&
-	    ip[3] == DT_OP_NOP && ip[4] == DT_OP_NOP)
+	if (!nprobes)
 		return 0;
 
-	/*
-	 * We expect either a call instrution with a 32-bit displacement or a
-	 * jmp instruction with a 32-bit displacement acting as a tail-call.
-	 */
-	if (ip[0] != DT_OP_CALL && ip[0] != DT_OP_JMP32) {
-		dt_dprintf("found %x instead of a call or jmp instruction at "
-		    "%llx\n", ip[0], (unsigned long long)rela->r_offset);
-		return -1;
-	}
-
-	ret = (ip[0] == DT_OP_JMP32) ? DT_OP_RET : DT_OP_NOP;
-
-	/*
-	 * Establish the instruction sequence: all nops.
-	 */
-	ip[0] = ret;
-	ip[1] = DT_OP_NOP;
-	ip[2] = DT_OP_NOP;
-	ip[3] = DT_OP_NOP;
-	ip[4] = DT_OP_NOP;
+	/* Ensure the note starts on a 4-byte alignment boundary. */
+	usdt->base = ALIGN(usdt->base + usdt->size, 4);
+	usdt->size = 0;
+
+	len = strlen(pvp->desc.dtvd_name);
+	sz = PROV_NOTE_HEADSZ +
+	     ALIGN(len + 1, 4) +	/* provider name */
+	     6 * sizeof(uint32_t);	/* stability attributes */
+
+	buf = malloc(sz);
+	if (buf == NULL)
+		return dt_set_errno(usdt->dtp, EDT_NOMEM);
+	memset(buf, 0, sz);
+
+	/* Add the note header. */
+	dbuf = elf_newdata(usdt->note);
+	dbuf->d_align = sizeof(uint32_t);
+	dbuf->d_off = usdt->base;
+	dbuf->d_buf = buf;
+	dbuf->d_size = sz;
+	usdt->size = sz;
+
+	p = buf + PROV_NOTE_HEADSZ;
+	strcpy(p, pvp->desc.dtvd_name);
+	p += ALIGN(len + 1, 4);
+	note_store_attr(&p, &pvp->desc.dtvd_attr.dtpa_provider);
+	note_store_attr(&p, &pvp->desc.dtvd_attr.dtpa_mod);
+	note_store_attr(&p, &pvp->desc.dtvd_attr.dtpa_func);
+	note_store_attr(&p, &pvp->desc.dtvd_attr.dtpa_name);
+	note_store_attr(&p, &pvp->desc.dtvd_attr.dtpa_args);
+	*(uint32_t *)p = nprobes;
+	p += sizeof(uint32_t);
+
+	/* Add the probe definitions. */
+	dt_idhash_iter(pvp->pv_probes, note_add_probe, usdt);
+
+	/* Add the note fragments. */
+	note = usdt->notes.next;
+	while (note) {
+		usdt_note_t	*next = note->next;
+
+		dbuf = elf_newdata(usdt->note);
+		dbuf->d_align = sizeof(char);
+		dbuf->d_off = usdt->base + usdt->size;
+		dbuf->d_buf = note->data;
+		dbuf->d_size = note->size;
+		usdt->size += note->size;
+
+		dt_free(usdt->dtp, note);
+		note = next;
+	}
+
+	/* Construct the note header. */
+	*((uint32_t *)&buf[0]) = 5;
+	*((uint32_t *)&buf[4]) = usdt->size - PROV_NOTE_HEADSZ;
+	*((uint32_t *)&buf[8]) = 1;
+	memcpy(&buf[12], _USDT_PV_NOTE_NAME, 4);
+
+	usdt->notes.next = NULL;
 
 	return 0;
 }
 
-#elif defined(__aarch64__)
-
-#define	DT_OP_NOP		0xd503201f
-#define	DT_OP_RET		0xd65f03c0
-#define	DT_OP_CALL26		0x94000000
-#define	DT_OP_JUMP26		0x14000000
-
 static int
-dt_modtext(dtrace_hdl_t *dtp, char *p, GElf_Rela *rela, uint32_t *off)
+note_add_version(usdt_elf_t *usdt)
 {
-	uint32_t *ip;
-
-	/*
-	 * Ensure that the offset is aligned on an instruction boundary.
-	 */
-	if ((rela->r_offset & (sizeof(uint32_t) - 1)) != 0)
-		return -1;
-
-	/*
-	 * We only know about some specific relocation types.
-	 * We also recognize relocation type NONE, since that gets used for
-	 * relocations of USDT probes, and we might be re-processing a file.
-	 */
-	if (GELF_R_TYPE(rela->r_info) != R_AARCH64_CALL26 &&
-	    GELF_R_TYPE(rela->r_info) != R_AARCH64_JUMP26 &&
-	    GELF_R_TYPE(rela->r_info) != R_AARCH64_NONE)
-		return -1;
-
-	ip = (uint32_t *)(p + rela->r_offset);
-
-	/*
-	 * We may have already processed this object file in an earlier linker
-	 * invocation. Check to see if the present instruction sequence matches
-	 * the one we would install below.
-	 */
-	if (ip[0] == DT_OP_NOP || ip[0] == DT_OP_RET)
-		return 0;
-
-	/*
-	 * We only expect call instructions with a displacement of 0, or a jump
-	 * instruction acting as a tail call.
-	 */
-	if (ip[0] != DT_OP_CALL26 && ip[0] != DT_OP_JUMP26) {
-		dt_dprintf("found %x instead of a call or jmp instruction at "
-		    "%llx\n", ip[0], (unsigned long long)rela->r_offset);
-		return -1;
-	}
-
-	/*
-	 * On arm64, we encode all probes as a regular branch for non-tail call
-	 * locations, and a jump for tail call locations.  Calls are to be
-	 * converted into a no-op whereas jumps should become a return.
-	 */
-	if (ip[0] == DT_OP_CALL26)
-		ip[0] = DT_OP_NOP;
-	else
-		ip[0] = DT_OP_RET;
+	Elf_Data	*dbuf;
+	char		*buf, *p;
+	size_t		len, sz;
+
+#define DVER_NOTE_HEADSZ \
+		((3 * sizeof(uint32_t)) +	/* namesz, descsz, type */ \
+		 ALIGN(5, 4))			/* "dver\0" */
+
+	/* Ensure the note starts on a 4-byte alignment boundary. */
+	usdt->base = ALIGN(usdt->base + usdt->size, 4);
+	usdt->size = 0;
+
+	len = strlen(_dtrace_version);
+	sz = DVER_NOTE_HEADSZ + ALIGN(len + 1, 4);
+
+	buf = malloc(sz);
+	if (buf == NULL)
+		return dt_set_errno(usdt->dtp, EDT_NOMEM);
+	memset(buf, 0, sz);
+
+	/* Construct the note header. */
+	*((uint32_t *)&buf[0]) = 5;
+	*((uint32_t *)&buf[4]) = sz - DVER_NOTE_HEADSZ;
+	*((uint32_t *)&buf[8]) = 1;
+	memcpy(&buf[12], "dver", 4);
+
+	/* Add the data. */
+	p = buf + DVER_NOTE_HEADSZ;
+	strcpy(p, _dtrace_version);
+
+	/* Add the note header. */
+	dbuf = elf_newdata(usdt->note);
+	dbuf->d_align = sizeof(uint32_t);
+	dbuf->d_off = usdt->base;
+	dbuf->d_buf = buf;
+	dbuf->d_size = sz;
+	usdt->size = sz;
+
+	usdt->notes.next = NULL;
 
 	return 0;
 }
-#else
-#error unknown ISA
-#endif
 
-/*PRINTFLIKE5*/
-_dt_printflike_(5,6)
 static int
-dt_link_error(dtrace_hdl_t *dtp, Elf *elf, int fd, dt_link_pair_t *bufs,
-    const char *format, ...)
+note_add_utsname(usdt_elf_t *usdt)
 {
-	va_list ap;
-	dt_link_pair_t *pair;
+	Elf_Data	*dbuf;
+	char		*buf, *p;
+	size_t		len, sz;
+
+#define UTSN_NOTE_HEADSZ \
+		((3 * sizeof(uint32_t)) +	/* namesz, descsz, type */ \
+		 ALIGN(5, 4))			/* "utsn\0" */
+
+	/* Ensure the note starts on a 4-byte alignment boundary. */
+	usdt->base = ALIGN(usdt->base + usdt->size, 4);
+	usdt->size = 0;
+
+	len = sizeof(struct utsname);
+	sz = UTSN_NOTE_HEADSZ + ALIGN(len, 4);
+
+	buf = malloc(sz);
+	if (buf == NULL)
+		return dt_set_errno(usdt->dtp, EDT_NOMEM);
+	memset(buf, 0, sz);
+
+	/* Construct the note header. */
+	*((uint32_t *)&buf[0]) = 5;
+	*((uint32_t *)&buf[4]) = sz - UTSN_NOTE_HEADSZ;
+	*((uint32_t *)&buf[8]) = 1;
+	memcpy(&buf[12], "utsn", 4);
+
+	/* Add the data. */
+	p = buf + UTSN_NOTE_HEADSZ;
+	memcpy(p, &usdt->dtp->dt_uts, sizeof(struct utsname));
+
+	/* Add the note header. */
+	dbuf = elf_newdata(usdt->note);
+	dbuf->d_align = sizeof(uint32_t);
+	dbuf->d_off = usdt->base;
+	dbuf->d_buf = buf;
+	dbuf->d_size = sz;
+	usdt->size = sz;
+
+	usdt->notes.next = NULL;
 
-	va_start(ap, format);
-	dt_set_errmsg(dtp, NULL, NULL, NULL, 0, format, ap);
-	va_end(ap);
-
-	if (elf != NULL)
-		elf_end(elf);
-
-	if (fd >= 0)
-		close(fd);
-
-	while ((pair = bufs) != NULL) {
-		bufs = pair->dlp_next;
-		dt_free(dtp, pair->dlp_str);
-		dt_free(dtp, pair->dlp_sym);
-		dt_free(dtp, pair);
-	}
-
-	return dt_set_errno(dtp, EDT_COMPILER);
+	return 0;
 }
 
 static int
-process_obj(dtrace_hdl_t *dtp, const char *obj, int *eprobesp)
+create_elf64(dtrace_hdl_t *dtp, dtrace_prog_t *pgp, int fd, uint_t flags)
 {
-	static const char dt_prefix[] = "__dtrace";
-	static const char dt_enabled[] = "enabled";
-	static const char dt_symprefix[] = "$dtrace";
-	static const char dt_symfmt[] = "%s%d.%s";
-	int fd, i, ndx, eprobe, mod = 0;
-	Elf *elf = NULL;
-	GElf_Ehdr ehdr;
-	Elf_Scn *scn_rel, *scn_sym, *scn_str, *scn_tgt;
-	Elf_Data *data_rel, *data_sym, *data_str, *data_tgt;
-	GElf_Shdr shdr_rel, shdr_sym, shdr_str, shdr_tgt;
-	GElf_Sym rsym, fsym, dsym;
-	GElf_Rela rela;
-	char *s, *p, *r;
-	char pname[DTRACE_PROVNAMELEN];
-	dt_provider_t *pvp;
-	dt_probe_t *prp;
-	uint32_t off, eclass, emachine1, emachine2;
-	size_t symsize, nsym, isym, istr, len;
-	key_t objkey;
-	dt_link_pair_t *pair, *bufs = NULL;
-	dt_strtab_t *strtab;
-	int flags = dtp->dt_link_no_mmap ? ELF_C_RDWR : ELF_C_RDWR_MMAP;
-
-	if ((fd = open64(obj, O_RDWR)) == -1) {
-		return dt_link_error(dtp, elf, fd, bufs,
-		    "failed to open %s: %s", obj, strerror(errno));
-	}
+	usdt_elf_t		*usdt;
+	Elf			*elf;
+	Elf64_Ehdr		*ehdr;
+	Elf64_Shdr		*shdr;
+	Elf_Scn			*scn;
+	Elf_Data		*dbuf;
+	dt_htab_next_t		*it = NULL;
+	dt_provider_t		*pvp;
+	static const char	SHSTRTAB[] = "\0"
+					     ".shstrtab\0"		/* 1 */
+#define SECT_SHSTRTAB		1
+#define NAMEOFF_SHSTRTAB	1	/* .shstrtab */
+					     ".note.GNU-stack\0"	/* 11 */
+#define SECT_NOTE_GNUTACK	2
+#define NAMEOFF_NOTE_GNUSTACK	11	/* .note.GNU-stack */
+					     ".note.usdt\0";		/* 27 */
+#define SECT_NOTE_USDT		3
+#define NAMEOFF_NOTE_USDT	27	/* .note.usdt */
+
+	if (!(flags & DTRACE_D_PROBES))
+		return 0;
 
-	if ((elf = elf_begin(fd, flags, NULL)) == NULL) {
-		return dt_link_error(dtp, elf, fd, bufs,
-		    "failed to process %s: %s", obj, elf_errmsg(elf_errno()));
+	usdt = dt_zalloc(dtp, sizeof(usdt_elf_t));
+	if (!usdt) {
+		dt_set_errno(dtp, EDT_NOMEM);
+		goto fail;
 	}
 
-	switch (elf_kind(elf)) {
-	case ELF_K_ELF:
-		break;
-	case ELF_K_AR:
-		return dt_link_error(dtp, elf, fd, bufs, "archives are not "
-		    "permitted; use the contents of the archive instead: %s",
-		    obj);
-	default:
-		return dt_link_error(dtp, elf, fd, bufs,
-		    "invalid file type: %s", obj);
-	}
+	usdt->dtp = dtp;
+	elf = elf_begin(fd, ELF_C_WRITE, NULL);
+	if (!elf)
+		goto fail;
 
-	if (gelf_getehdr(elf, &ehdr) == NULL) {
-		return dt_link_error(dtp, elf, fd, bufs, "corrupt file: %s",
-		    obj);
-	}
-
-	if (dtp->dt_oflags & DTRACE_O_ILP32) {
-		eclass = ELFCLASS32;
-#if defined(__sparc)
-		emachine1 = EM_SPARC;
-		emachine2 = EM_SPARC32PLUS;
-#elif defined(__i386) || defined(__amd64)
-		emachine1 = emachine2 = EM_386;
-#endif
-		symsize = sizeof(Elf32_Sym);
-	} else {
-		eclass = ELFCLASS64;
-#if defined(__sparc)
-		emachine1 = emachine2 = EM_SPARCV9;
-#elif defined(__i386) || defined(__amd64)
-		emachine1 = emachine2 = EM_X86_64;
+	ehdr = elf64_newehdr(elf);
+        ehdr->e_type = ET_REL;
+#if defined(__amd64)
+        ehdr->e_machine = EM_X86_64;
 #elif defined(__aarch64__)
-		emachine1 = emachine2 = EM_AARCH64;
+        ehdr->e_machine = EM_AARCH64;
 #endif
-		symsize = sizeof(Elf64_Sym);
-	}
-
-	if (ehdr.e_ident[EI_CLASS] != eclass)
-		return dt_link_error(dtp, elf, fd, bufs,
-		    "incorrect ELF class for object file: %s", obj);
-
-	if (ehdr.e_machine != emachine1 && ehdr.e_machine != emachine2)
-		return dt_link_error(dtp, elf, fd, bufs,
-		    "incorrect ELF machine type for object file: %s", obj);
-
-	/*
-	 * We use this token as a relatively unique handle for this file on the
-	 * system in order to disambiguate potential conflicts between files of
-	 * the same name which contain identially named local symbols.
-	 */
-	if ((objkey = ftok(obj, 0)) == (key_t)-1)
-		return dt_link_error(dtp, elf, fd, bufs,
-		    "failed to generate unique key for object file: %s", obj);
-
-	scn_rel = NULL;
-	while ((scn_rel = elf_nextscn(elf, scn_rel)) != NULL) {
-		if (gelf_getshdr(scn_rel, &shdr_rel) == NULL)
-			goto err;
-
-		/*
-		 * Skip any non-relocation sections.
-		 */
-		if (shdr_rel.sh_type != SHT_RELA && shdr_rel.sh_type != SHT_REL)
-			continue;
-
-		if ((data_rel = elf_getdata(scn_rel, NULL)) == NULL)
-			goto err;
-
-		/*
-		 * Grab the section, section header and section data for the
-		 * symbol table that this relocation section references.
-		 */
-		if ((scn_sym = elf_getscn(elf, shdr_rel.sh_link)) == NULL ||
-		    gelf_getshdr(scn_sym, &shdr_sym) == NULL ||
-		    (data_sym = elf_getdata(scn_sym, NULL)) == NULL)
-			goto err;
-
-		/*
-		 * Ditto for that symbol table's string table.
-		 */
-		if ((scn_str = elf_getscn(elf, shdr_sym.sh_link)) == NULL ||
-		    gelf_getshdr(scn_str, &shdr_str) == NULL ||
-		    (data_str = elf_getdata(scn_str, NULL)) == NULL)
-			goto err;
-
-		/*
-		 * Grab the section, section header and section data for the
-		 * target section for the relocations. For the relocations
-		 * we're looking for -- this will typically be the text of the
-		 * object file.
-		 */
-		if ((scn_tgt = elf_getscn(elf, shdr_rel.sh_info)) == NULL ||
-		    gelf_getshdr(scn_tgt, &shdr_tgt) == NULL ||
-		    (data_tgt = elf_getdata(scn_tgt, NULL)) == NULL)
-			goto err;
-
-		/*
-		 * We're looking for relocations to symbols matching this form:
-		 *
-		 *   __dtrace[enabled]_<prov>___<probe>
-		 *
-		 * For the generated object, we need to record the location
-		 * identified by the relocation, and create a new relocation
-		 * in the generated object that will be resolved at link time
-		 * to the location of the function in which the probe is
-		 * embedded. In the target object, we change the matched symbol
-		 * so that it will be ignored at link time, and we modify the
-		 * target (text) section to replace the call instruction with
-		 * one or more nops.
-		 *
-		 * If the function containing the probe is locally scoped
-		 * (static), we create an alias used by the relocation in the
-		 * generated object. The alias, a new symbol, will be global
-		 * (so that the relocation from the generated object can be
-		 * resolved), and hidden (so that it is converted to a local
-		 * symbol at link time). Such aliases have this form:
-		 *
-		 *   $dtrace<key>.<function>
-		 *
-		 * We take a first pass through all the relocations to
-		 * populate our string table and count the number of extra
-		 * symbols we'll require.
-		 */
-		strtab = dt_strtab_create(BUFSIZ);
-		nsym = 0;
-		isym = data_sym->d_size / symsize;
-		istr = data_str->d_size;
-
-		for (i = 0; i < shdr_rel.sh_size / shdr_rel.sh_entsize; i++) {
-
-			if (shdr_rel.sh_type == SHT_RELA) {
-				if (gelf_getrela(data_rel, i, &rela) == NULL)
-					continue;
-			} else {
-				GElf_Rel rel;
-				if (gelf_getrel(data_rel, i, &rel) == NULL)
-					continue;
-				rela.r_offset = rel.r_offset;
-				rela.r_info = rel.r_info;
-				rela.r_addend = 0;
-			}
-
-			if (gelf_getsym(data_sym, GELF_R_SYM(rela.r_info),
-			    &rsym) == NULL) {
-				dt_strtab_destroy(strtab);
-				goto err;
-			}
-
-			s = (char *)data_str->d_buf + rsym.st_name;
-
-			if (strncmp(s, dt_prefix, sizeof(dt_prefix) - 1) != 0)
-				continue;
-
-			if (dt_elf_symtab_lookup(data_sym, isym, rela.r_offset,
-			    shdr_rel.sh_info, &fsym) != 0) {
-				dt_strtab_destroy(strtab);
-				goto err;
-			}
-
-			if (GELF_ST_BIND(fsym.st_info) != STB_LOCAL)
-				continue;
-
-			if (fsym.st_name > data_str->d_size) {
-				dt_strtab_destroy(strtab);
-				goto err;
-			}
-
-			s = (char *)data_str->d_buf + fsym.st_name;
-
-			/*
-			 * If this symbol isn't of type function, we've really
-			 * driven off the rails or the object file is corrupt.
-			 */
-			if (GELF_ST_TYPE(fsym.st_info) != STT_FUNC) {
-				dt_strtab_destroy(strtab);
-				return dt_link_error(dtp, elf, fd, bufs,
-				    "expected %s to be of type function", s);
-			}
-
-			len = snprintf(NULL, 0, dt_symfmt, dt_symprefix,
-			    objkey, s) + 1;
-			if ((p = dt_alloc(dtp, len)) == NULL) {
-				dt_strtab_destroy(strtab);
-				goto err;
-			}
-			snprintf(p, len, dt_symfmt, dt_symprefix, objkey, s);
-
-			if (dt_strtab_index(strtab, p) == -1) {
-				nsym++;
-				dt_strtab_insert(strtab, p);
-			}
-
-			dt_free(dtp, p);
-		}
-
-		/*
-		 * If needed, allocate the additional space for the symbol
-		 * table and string table copying the old data into the new
-		 * buffers, and marking the buffers as dirty. We inject those
-		 * newly allocated buffers into the libelf data structures, but
-		 * are still responsible for freeing them once we're done with
-		 * the elf handle.
-		 */
-		if (nsym > 0) {
-			/*
-			 * The first byte of the string table is reserved
-			 * for the \0 entry.
-			 */
-			len = dt_strtab_size(strtab) - 1;
-
-			assert(len > 0);
-			assert(dt_strtab_index(strtab, "") == 0);
-
-			dt_strtab_destroy(strtab);
-
-			if ((pair = dt_alloc(dtp, sizeof(*pair))) == NULL)
-				goto err;
-
-			if ((pair->dlp_str = dt_alloc(dtp, data_str->d_size +
-			    len)) == NULL) {
-				dt_free(dtp, pair);
-				goto err;
-			}
-
-			if ((pair->dlp_sym = dt_alloc(dtp, data_sym->d_size +
-			    nsym * symsize)) == NULL) {
-				dt_free(dtp, pair->dlp_str);
-				dt_free(dtp, pair);
-				goto err;
-			}
-
-			pair->dlp_next = bufs;
-			bufs = pair;
-
-			memcpy(pair->dlp_str, data_str->d_buf,
-			    data_str->d_size);
-			data_str->d_buf = pair->dlp_str;
-			data_str->d_size += len;
-			elf_flagdata(data_str, ELF_C_SET, ELF_F_DIRTY);
-
-			shdr_str.sh_size += len;
-			gelf_update_shdr(scn_str, &shdr_str);
-
-			memcpy(pair->dlp_sym, data_sym->d_buf,
-			    data_sym->d_size);
-			data_sym->d_buf = pair->dlp_sym;
-			data_sym->d_size += nsym * symsize;
-			elf_flagdata(data_sym, ELF_C_SET, ELF_F_DIRTY);
-
-			shdr_sym.sh_size += nsym * symsize;
-			gelf_update_shdr(scn_sym, &shdr_sym);
-
-			nsym += isym;
-		} else {
-			dt_strtab_destroy(strtab);
-		}
-
-		/*
-		 * Now that the tables have been allocated, perform the
-		 * modifications described above.
-		 */
-		for (i = 0; i < shdr_rel.sh_size / shdr_rel.sh_entsize; i++) {
-
-			if (shdr_rel.sh_type == SHT_RELA) {
-				if (gelf_getrela(data_rel, i, &rela) == NULL)
-					continue;
-			} else {
-				GElf_Rel rel;
-				if (gelf_getrel(data_rel, i, &rel) == NULL)
-					continue;
-				rela.r_offset = rel.r_offset;
-				rela.r_info = rel.r_info;
-				rela.r_addend = 0;
-			}
-
-			ndx = GELF_R_SYM(rela.r_info);
-
-			if (gelf_getsym(data_sym, ndx, &rsym) == NULL ||
-			    rsym.st_name > data_str->d_size)
-				goto err;
-
-			s = (char *)data_str->d_buf + rsym.st_name;
-
-			if (strncmp(s, dt_prefix, sizeof(dt_prefix) - 1) != 0)
-				continue;
-
-			s += sizeof(dt_prefix) - 1;
-
-			/*
-			 * Check to see if this is an 'is-enabled' check as
-			 * opposed to a normal probe.
-			 */
-			if (strncmp(s, dt_enabled,
-			    sizeof(dt_enabled) - 1) == 0) {
-				s += sizeof(dt_enabled) - 1;
-				eprobe = 1;
-				*eprobesp = 1;
-				dt_dprintf("is-enabled probe\n");
-			} else {
-				eprobe = 0;
-				dt_dprintf("normal probe\n");
-			}
-
-			if (*s++ != '_')
-				goto err;
-
-			if ((p = strstr(s, "___")) == NULL ||
-			    p - s >= sizeof(pname))
-				goto err;
-
-			memcpy(pname, s, p - s);
-			pname[p - s] = '\0';
-
-			p = strhyphenate(p + 3); /* strlen("___") */
-
-			if (dt_elf_symtab_lookup(data_sym, isym, rela.r_offset,
-			    shdr_rel.sh_info, &fsym) != 0)
-				goto err;
-
-			if (fsym.st_name > data_str->d_size)
-				goto err;
-
-			assert(GELF_ST_TYPE(fsym.st_info) == STT_FUNC);
-
-			/*
-			 * If a NULL relocation name is passed to
-			 * dt_probe_define(), the function name is used for the
-			 * relocation. The relocation needs to use a mangled
-			 * name if the symbol is locally scoped; the function
-			 * name may need to change if we've found the global
-			 * alias for the locally scoped symbol (we prefer
-			 * global symbols to locals in dt_elf_symtab_lookup()).
-			 */
-			s = (char *)data_str->d_buf + fsym.st_name;
-			r = NULL;
-
-			if (GELF_ST_BIND(fsym.st_info) == STB_LOCAL) {
-				dsym = fsym;
-				dsym.st_name = istr;
-				dsym.st_info = GELF_ST_INFO(STB_GLOBAL,
-				    STT_FUNC);
-				dsym.st_other =
-				    ELF64_ST_VISIBILITY(STV_ELIMINATE);
-				gelf_update_sym(data_sym, isym, &dsym);
-
-				r = (char *)data_str->d_buf + istr;
-				istr += 1 + sprintf(r, dt_symfmt,
-				    dt_symprefix, objkey, s);
-				isym++;
-				assert(isym <= nsym);
-
-			} else if (strncmp(s, dt_symprefix,
-			    strlen(dt_symprefix)) == 0) {
-				r = s;
-				if ((s = strchr(s, '.')) == NULL)
-					goto err;
-				s++;
-			}
-
-			if ((pvp = dt_provider_lookup(dtp, pname)) == NULL)
-				return dt_link_error(dtp, elf, fd, bufs,
-				    "no such provider %s", pname);
-
-			if ((prp = dt_probe_lookup2(pvp, p)) == NULL)
-				return dt_link_error(dtp, elf, fd, bufs,
-				    "no such probe %s", p);
-
-			assert(fsym.st_value <= rela.r_offset);
-
-			off = rela.r_offset - fsym.st_value;
-			if (dt_modtext(dtp, data_tgt->d_buf, &rela, &off) != 0)
-				goto err;
-
-			if (dt_probe_define(pvp, prp, s, r, off, eprobe) != 0)
-				return dt_link_error(dtp, elf, fd, bufs,
-				    "failed to allocate space for probe");
-
-			/*
-			 * This symbol may already have been marked to
-			 * be ignored by another relocation referencing
-			 * the same symbol or if this object file has
-			 * already been processed by an earlier link
-			 * invocation.
-			 */
-			if (rsym.st_shndx != SHN_SUNW_IGNORE) {
-				mod = 1;
-				elf_flagdata(data_tgt, ELF_C_SET, ELF_F_DIRTY);
-				rsym.st_shndx = SHN_SUNW_IGNORE;
-				gelf_update_sym(data_sym, ndx, &rsym);
-			}
-
-			/*
-			 * This relocation is no longer needed.  The linker on
-			 * Linux doesn't know about SHN_SUNW_IGNORE, so we mark
-			 * the relocation with type NONE.  Failing to do so
-			 * causes the linker to try to fill in an address on
-			 * top of the NOPs we so carefully planted.
-			 */
-			if (rela.r_info != GELF_R_INFO(ndx,0)) {
-				mod = 1;
-				elf_flagdata(data_tgt, ELF_C_SET, ELF_F_DIRTY);
-				if (shdr_rel.sh_type == SHT_RELA) {
-					rela.r_info = GELF_R_INFO(ndx, 0);
-					gelf_update_rela(data_rel, i, &rela);
-				} else {
-					GElf_Rel rel;
-
-					rel.r_offset = rela.r_offset;
-					rel.r_info = GELF_R_INFO(ndx, 0);
-					gelf_update_rel(data_rel, i, &rel);
-				}
-			}
-		}
-	}
+        ehdr->e_version = EV_CURRENT;
+        ehdr->e_shoff = sizeof(Elf64_Ehdr);
+        ehdr->e_ehsize = sizeof(Elf64_Ehdr);
+        ehdr->e_phentsize = sizeof(Elf64_Phdr);
+        ehdr->e_shentsize = sizeof(Elf64_Shdr);
+	ehdr->e_shstrndx = 1;
+
+	/* Create .shstrtab */
+	scn = elf_newscn(elf);
+	shdr = elf64_getshdr(scn);
+	shdr->sh_name = NAMEOFF_SHSTRTAB;
+	shdr->sh_type = SHT_STRTAB;
+	shdr->sh_addralign = sizeof(char);
+
+	dbuf = elf_newdata(scn);
+	dbuf->d_size = sizeof(SHSTRTAB);
+	dbuf->d_buf = malloc(dbuf->d_size);
+	if (!dbuf->d_buf) {
+		dt_set_errno(dtp, EDT_NOMEM);
+		goto fail;
+	}
+	memcpy(dbuf->d_buf, SHSTRTAB, dbuf->d_size);
+
+	/* Create .note.GNU-stack */
+	scn = elf_newscn(elf);
+	shdr = elf64_getshdr(scn);
+	shdr->sh_name = NAMEOFF_NOTE_GNUSTACK;
+	shdr->sh_type = SHT_PROGBITS;
+	shdr->sh_addralign = sizeof(char);
+
+	dbuf = elf_newdata(scn);
+
+	/* Create .note.usdt */
+	usdt->note = elf_newscn(elf);
+	shdr = elf64_getshdr(usdt->note);
+	shdr->sh_name = NAMEOFF_NOTE_USDT;
+	shdr->sh_type = SHT_NOTE;
+	shdr->sh_addralign = sizeof(char);
+
+	/* Add the provider definitions. */
+	while ((pvp = dt_htab_next(dtp->dt_provs, &it)) != NULL)
+		note_add_provider(usdt, pvp);
+
+	if (!(flags & DTRACE_D_STRIP)) {
+		note_add_version(usdt);
+		note_add_utsname(usdt);
+	}
+
+	dt_free(dtp, usdt);
+
+	/* Write the ELF object. */
+	elf_update(elf, ELF_C_WRITE);
+	elf_end(elf);
 
-	if (mod && elf_update(elf, ELF_C_WRITE) == -1)
-		goto err;
+	return 0;
 
-	elf_end(elf);
-	close(fd);
+fail:
+	if (usdt) {
+		if (elf)
+			elf_end(elf);
 
-	while ((pair = bufs) != NULL) {
-		bufs = pair->dlp_next;
-		dt_free(dtp, pair->dlp_str);
-		dt_free(dtp, pair->dlp_sym);
-		dt_free(dtp, pair);
+		dt_free(dtp, usdt);
 	}
 
-	return 0;
-
-err:
-	return dt_link_error(dtp, elf, fd, bufs,
-	    "an error was encountered while processing %s", obj);
+	return -1;
 }
 
 int
@@ -1495,11 +414,10 @@ dtrace_program_link(dtrace_hdl_t *dtp, dtrace_prog_t *pgp, uint_t dflags,
     const char *file, int objc, char *const objv[])
 {
 	char drti[PATH_MAX], symvers[PATH_MAX];
-	dof_hdr_t *dof;
-	int fd, status, i, cur;
+	int fd, i, cur;
 	char *cmd;
 	size_t len;
-	int eprobes = 0, ret = 0;
+	int ret = 0, status = 0;
 
 	/*
 	 * A NULL program indicates a special use in which we just link
@@ -1522,17 +440,17 @@ dtrace_program_link(dtrace_hdl_t *dtp, dtrace_prog_t *pgp, uint_t dflags,
 			cur += snprintf(cmd + cur, len - cur, " %s", objv[i]);
 
 		if ((status = system(cmd)) == -1)
-			return dt_link_error(dtp, NULL, -1, NULL,
+			return dt_link_error(dtp, NULL, -1,
 			    "failed to run %s: %s", dtp->dt_ld_path,
 			    strerror(errno));
 
 		if (WIFSIGNALED(status))
-			return dt_link_error(dtp, NULL, -1, NULL,
+			return dt_link_error(dtp, NULL, -1,
 			    "failed to link %s: %s failed due to signal %d",
 			    file, dtp->dt_ld_path, WTERMSIG(status));
 
 		if (WEXITSTATUS(status) != 0)
-			return dt_link_error(dtp, NULL, -1, NULL,
+			return dt_link_error(dtp, NULL, -1,
 			    "failed to link %s: %s exited with status %d\n",
 			    file, dtp->dt_ld_path, WEXITSTATUS(status));
 
@@ -1543,40 +461,13 @@ dtrace_program_link(dtrace_hdl_t *dtp, dtrace_prog_t *pgp, uint_t dflags,
 		return 0;
 	}
 
-	for (i = 0; i < objc; i++) {
-		if (process_obj(dtp, objv[i], &eprobes) != 0)
-			return -1; /* errno is set for us */
-
-		/*
-		 * If there are is-enabled probes then we need to error out if
-		 * DOF version 2 was used, preventing linkage of pre-existing
-		 * objects that contain return-value-driven is-enabled probes
-		 * with a DTrace that implements argument-driven is-enabled
-		 * probes.  (New objects will at this stage have DOF version 1.)
-		 */
-		if (eprobes && pgp->dp_dofversion == DOF_VERSION_2)
-			return dt_link_error(dtp, NULL, -1, NULL,
-			    "DOF in %s is too old: regenerate with dtrace -G",
-			    objv[i]);
-	}
-
-	/*
-	 * If there are is-enabled probes then we need to force use of DOF
-	 * version 3.
-	 */
-	if (eprobes && pgp->dp_dofversion < DOF_VERSION_3)
-		pgp->dp_dofversion = DOF_VERSION_3;
-
-	if ((dof = dtrace_dof_create(dtp, pgp, dflags)) == NULL)
-		return -1; /* errno is set for us */
-
 	/*
 	 * Create a temporary file and then unlink it if we're going to
 	 * combine it with drti.o later.  We can still refer to it in child
 	 * processes as /dev/fd/<fd>.
 	 */
 	if ((fd = open64(file, O_RDWR | O_CREAT | O_TRUNC, 0666)) == -1)
-		return dt_link_error(dtp, NULL, -1, NULL,
+		return dt_link_error(dtp, NULL, -1,
 		    "failed to open %s: %s", file, strerror(errno));
 
 	/*
@@ -1585,37 +476,26 @@ dtrace_program_link(dtrace_hdl_t *dtp, dtrace_prog_t *pgp, uint_t dflags,
 	 */
 	switch (dtp->dt_linktype) {
 	case DT_LTYP_DOF:
-		if (dt_write(dtp, fd, dof, dof->dofh_filesz) < dof->dofh_filesz)
-			ret = errno;
-
-		if (close(fd) != 0 && ret == 0)
-			ret = errno;
-
-		if (ret != 0)
-			return dt_link_error(dtp, NULL, -1, NULL,
-			    "failed to write %s: %s", file, strerror(ret));
-
-		return 0;
+		return dt_link_error(dtp, NULL, -1,
+				     "link type %u (DOF) no longer supported\n",
+				     dtp->dt_linktype);
 
 	case DT_LTYP_ELF:
 		break; /* fall through to the rest of dtrace_program_link() */
 
 	default:
-		return dt_link_error(dtp, NULL, -1, NULL,
-		    "invalid link type %u\n", dtp->dt_linktype);
+		return dt_link_error(dtp, NULL, -1, "invalid link type %u\n",
+				     dtp->dt_linktype);
 	}
 
 
 	if (!dtp->dt_lazyload)
 		unlink(file);
 
-	if (dtp->dt_oflags & DTRACE_O_ILP32)
-		status = dump_elf32(dtp, dof, fd);
-	else
-		status = dump_elf64(dtp, dof, fd);
+	create_elf64(dtp, pgp, fd, dflags | dtp->dt_dflags);
 
 	if (status != 0 || lseek(fd, 0, SEEK_SET) != 0)
-		return dt_link_error(dtp, NULL, -1, NULL,
+		return dt_link_error(dtp, NULL, -1,
 		    "failed to write %s: %s", file, strerror(errno));
 
 	if (!dtp->dt_lazyload) {
@@ -1650,7 +530,7 @@ dtrace_program_link(dtrace_hdl_t *dtp, dtrace_prog_t *pgp, uint_t dflags,
 				symvers, fd, drti);
 
 		if ((status = system(cmd)) == -1) {
-			ret = dt_link_error(dtp, NULL, -1, NULL,
+			ret = dt_link_error(dtp, NULL, -1,
 			    "failed to run %s: %s", dtp->dt_ld_path,
 			    strerror(errno));
 			goto done;
@@ -1659,14 +539,14 @@ dtrace_program_link(dtrace_hdl_t *dtp, dtrace_prog_t *pgp, uint_t dflags,
 		close(fd);
 
 		if (WIFSIGNALED(status)) {
-			ret = dt_link_error(dtp, NULL, -1, NULL,
+			ret = dt_link_error(dtp, NULL, -1,
 			    "failed to link %s: %s failed due to signal %d",
 			    file, dtp->dt_ld_path, WTERMSIG(status));
 			goto done;
 		}
 
 		if (WEXITSTATUS(status) != 0) {
-			ret = dt_link_error(dtp, NULL, -1, NULL,
+			ret = dt_link_error(dtp, NULL, -1,
 			    "failed to link %s: %s exited with status %d\n",
 			    file, dtp->dt_ld_path, WEXITSTATUS(status));
 			goto done;
@@ -1675,6 +555,5 @@ dtrace_program_link(dtrace_hdl_t *dtp, dtrace_prog_t *pgp, uint_t dflags,
 		close(fd); /* release temporary file */
 
 done:
-	dtrace_dof_destroy(dtp, dof);
 	return ret;
 }
diff --git a/libdtrace/dt_program.c b/libdtrace/dt_program.c
index d1c5272b..a2d1918a 100644
--- a/libdtrace/dt_program.c
+++ b/libdtrace/dt_program.c
@@ -356,7 +356,9 @@ dt_header_decl(dt_idhash_t *dhp, dt_ident_t *idp, void *data)
 	dtrace_hdl_t *dtp = infop->dthi_dtp;
 	dt_probe_t *prp = idp->di_data;
 	dt_node_t *dnp;
+#if 0
 	char buf[DT_TYPE_NAMELEN];
+#endif
 	char *fname;
 	const char *p;
 	int i;
@@ -368,15 +370,28 @@ dt_header_decl(dt_idhash_t *dhp, dt_ident_t *idp, void *data)
 	fname = alloca(strlen(prp->pr_name) + 1 + i);
 	dt_header_fmt_func(fname, prp->pr_name);
 
-	if (fprintf(infop->dthi_out, "extern void __dtrace_%s___%s(",
+	if (fprintf(infop->dthi_out, "extern void __usdt1_%s___%s(",
 	    infop->dthi_pfname, fname) < 0)
 		return dt_set_errno(dtp, errno);
 
+	/*
+	 * Generate a function prototype with void * as type for each probe
+	 * argument.  This is used as a "trick" to ensure that probe invocation
+	 * using the DTRACE_PROBE() macro pass the correct number of arguments.
+	 * (That macro defines the same function prototype, with the number of
+	 *  arguments passed, so the compiler will complain if they do not
+	 *  match.)
+	 */
 	for (dnp = prp->nargs, i = 0; dnp != NULL; dnp = dnp->dn_list, i++) {
+#if 0
 		if (fprintf(infop->dthi_out, "%s",
 		    ctf_type_name(dnp->dn_ctfp, dnp->dn_type,
 		    buf, sizeof(buf))) < 0)
 			return dt_set_errno(dtp, errno);
+#else
+		if (fprintf(infop->dthi_out, "unsigned long") < 0)
+			return dt_set_errno(dtp, errno);
+#endif
 
 		if (i + 1 < prp->nargc &&
 		    fprintf(infop->dthi_out, ", ") < 0)
@@ -389,10 +404,17 @@ dt_header_decl(dt_idhash_t *dhp, dt_ident_t *idp, void *data)
 	if (fprintf(infop->dthi_out, ");\n") < 0)
 		return dt_set_errno(dtp, errno);
 
+#if 0
 	if (fprintf(infop->dthi_out,
-	    "extern void __dtraceenabled_%s___%s(uint32_t *flag);\n",
+	    "extern void __usdt2_%s___%s(uint32_t *flag);\n",
 	    infop->dthi_pfname, fname) < 0)
 		return dt_set_errno(dtp, errno);
+#else
+	if (fprintf(infop->dthi_out,
+	    "extern void __usdt2_%s___%s(unsigned long);\n",
+	    infop->dthi_pfname, fname) < 0)
+		return dt_set_errno(dtp, errno);
+#endif
 
 	return 0;
 }
@@ -435,16 +457,18 @@ dt_header_probe(dt_idhash_t *dhp, dt_ident_t *idp, void *data)
 		if (fprintf(infop->dthi_out, ") \\\n\t") < 0)
 			return dt_set_errno(dtp, errno);
 
+#if 0
 		if (fprintf(infop->dthi_out, "__dtrace_%s___%s(",
 		    infop->dthi_pfname, fname) < 0)
 			return dt_set_errno(dtp, errno);
+#else
+		if (fprintf(infop->dthi_out, "_USDT_PROBE(%s, %s",
+		    infop->dthi_pfname, fname) < 0)
+			return dt_set_errno(dtp, errno);
+#endif
 
 		for (i = 0; i < prp->nargc; i++) {
-			if (fprintf(infop->dthi_out, "arg%d", i) < 0)
-				return dt_set_errno(dtp, errno);
-
-			if (i + 1 != prp->nargc &&
-			    fprintf(infop->dthi_out, ", ") < 0)
+			if (fprintf(infop->dthi_out, ", arg%d", i) < 0)
 				return dt_set_errno(dtp, errno);
 		}
 	}
@@ -457,11 +481,10 @@ dt_header_probe(dt_idhash_t *dhp, dt_ident_t *idp, void *data)
 		    "#ifdef __GNUC__\n"
 		    "#define\t%s_%s_ENABLED() \\\n"
 		    "\t({ uint32_t enabled = 0; \\\n"
-		    "\t__dtraceenabled_%s___%s(&enabled); \\\n"
+		    "\t   _USDT_PROBE_ENABLED(%s, %s, &enabled); \\\n"
 		    "\t   enabled; })\n"
 		    "#else\n"
-		    "#define\t%s_%s_ENABLED() (1)\\n"
-		    "#endif\n"
+		    "#define\t%s_%s_ENABLED() (1)\n"
 		    "#endif\n",
 		    infop->dthi_pmname, mname,
 		    infop->dthi_pfname, fname,
@@ -486,6 +509,8 @@ dt_header_provider(dtrace_hdl_t *dtp, dt_provider_t *pvp, FILE *out)
 
 	if (pvp->pv_flags & DT_PROVIDER_IMPL)
 		return 0;
+	if (!dt_idhash_size(pvp->pv_probes))
+		return 0;
 
 	/*
 	 * Count the instances of the '-' character since we'll need to double
@@ -548,7 +573,8 @@ dtrace_program_header(dtrace_hdl_t *dtp, FILE *out, const char *fname)
 	}
 
 	if (fprintf(out, "#include <unistd.h>\n"
-		"#include <inttypes.h>\n\n") < 0)
+			 "#include <inttypes.h>\n"
+			 "#include <sys/usdt.h>\n\n") < 0)
 		return -1;
 
 	if (fprintf(out, "#ifdef\t__cplusplus\nextern \"C\" {\n#endif\n\n") < 0)
diff --git a/test/triggers/Build b/test/triggers/Build
index 3b5df3ec..d49b996a 100644
--- a/test/triggers/Build
+++ b/test/triggers/Build
@@ -1,5 +1,5 @@
 # Oracle Linux DTrace.
-# Copyright (c) 2011, 2024, Oracle and/or its affiliates. All rights reserved.
+# Copyright (c) 2011, 2025, Oracle and/or its affiliates. All rights reserved.
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 
@@ -13,7 +13,9 @@ EXTERNAL_64BIT_TRIGGERS = testprobe readwholedir mmap bogus-ioctl open delaydie
     ustack-tst-spin ustack-tst-mtspin \
     visible-constructor visible-constructor-static visible-constructor-static-unstripped
 
-EXTERNAL_64BIT_SDT_TRIGGERS = usdt-tst-argmap usdt-tst-args usdt-tst-forker usdt-tst-defer \
+EXTERNAL_64BIT_SDT_TRIGGERS = usdt-tst-argmap usdt-tst-args \
+    usdt-tst-arg-const usdt-tst-arg-reg \
+    usdt-tst-deref-decode usdt-tst-forker usdt-tst-defer \
     usdt-tst-multiprovider usdt-tst-multiprov-dupprobe usdt-tst-special
 EXTERNAL_64BIT_TRIGGERS += $(EXTERNAL_64BIT_SDT_TRIGGERS)
 
@@ -197,10 +199,23 @@ profile-tst-ufuncsort_CFLAGS := -O0
 usdt-tst-argmap_CFLAGS := -Iuts/common
 usdt-tst-argmap_PROV := usdt-tst-argmap-prov.d
 
+# usdt-tst-deref-decode calls USDT probes using sys/sdt.h
+usdt-tst-deref-decode_CFLAGS := -Iuts/common -O3
+usdt-tst-deref-decode_SOURCES := usdt-tst-deref-decode.${ARCH}.c
+usdt-tst-deref-decode_PROV := usdt-tst-deref-decode-prov.d
+
 # usdt-tst-args calls USDT probes using sys/sdt.h
 usdt-tst-args_CFLAGS := -Iuts/common
 usdt-tst-args_PROV := usdt-tst-args-prov.d
 
+# usdt-tst-args-const calls USDT probes based on dtrace -h
+usdt-tst-arg-const_CFLAGS := -Iuts/common
+usdt-tst-arg-const_PROV := usdt-tst-arg-const-prov.d
+
+# usdt-tst-args-reg calls USDT probes based on dtrace -h
+usdt-tst-arg-reg_CFLAGS := -Iuts/common -O0
+usdt-tst-arg-reg_PROV := usdt-tst-arg-reg-prov.d
+
 # usdt-tst-forker calls USDT probes based on dtrace -h
 usdt-tst-forker_PROV := usdt-tst-forker-prov.d
 
diff --git a/test/triggers/usdt-tst-arg-const-prov.d b/test/triggers/usdt-tst-arg-const-prov.d
new file mode 100644
index 00000000..915a61da
--- /dev/null
+++ b/test/triggers/usdt-tst-arg-const-prov.d
@@ -0,0 +1,19 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/* @@skip: provider declaration - not a test */
+
+provider test_prov {
+	probe uval1(uint8_t a);
+	probe sval1(int8_t a);
+	probe uval2(uint16_t a);
+	probe sval2(int16_t a);
+	probe uval4(uint32_t a);
+	probe sval4(int32_t a);
+	probe uval8(uint64_t a);
+	probe sval8(int64_t a);
+};
diff --git a/test/triggers/usdt-tst-arg-const.c b/test/triggers/usdt-tst-arg-const.c
new file mode 100644
index 00000000..e0cbfa1e
--- /dev/null
+++ b/test/triggers/usdt-tst-arg-const.c
@@ -0,0 +1,25 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+#include "usdt-tst-arg-const-prov.h"
+
+int
+main(int argc, char **argv)
+{
+	for (;;) {
+		TEST_PROV_UVAL1(0x12);
+		TEST_PROV_SVAL1(-0x12);
+		TEST_PROV_UVAL2(0x1234);
+		TEST_PROV_SVAL2(-0x1234);
+		TEST_PROV_UVAL4(0x12345678);
+		TEST_PROV_SVAL4(-0x12345678);
+		TEST_PROV_UVAL8(0x1234567890abcdefULL);
+		TEST_PROV_SVAL8(-0x1234567890abcdefLL);
+	}
+
+	return 0;
+}
diff --git a/test/triggers/usdt-tst-arg-reg-prov.d b/test/triggers/usdt-tst-arg-reg-prov.d
new file mode 100644
index 00000000..915a61da
--- /dev/null
+++ b/test/triggers/usdt-tst-arg-reg-prov.d
@@ -0,0 +1,19 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/* @@skip: provider declaration - not a test */
+
+provider test_prov {
+	probe uval1(uint8_t a);
+	probe sval1(int8_t a);
+	probe uval2(uint16_t a);
+	probe sval2(int16_t a);
+	probe uval4(uint32_t a);
+	probe sval4(int32_t a);
+	probe uval8(uint64_t a);
+	probe sval8(int64_t a);
+};
diff --git a/test/triggers/usdt-tst-arg-reg.c b/test/triggers/usdt-tst-arg-reg.c
new file mode 100644
index 00000000..ed8e097c
--- /dev/null
+++ b/test/triggers/usdt-tst-arg-reg.c
@@ -0,0 +1,35 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+#define _DT_ARG_CONSTRAINT	r
+#include "usdt-tst-arg-reg-prov.h"
+
+int
+main(int argc, char **argv)
+{
+	uint8_t		a = 0x12;
+	int8_t		b = -0x12;
+	uint16_t	c = 0x1234;
+	int16_t		d = -0x1234;
+	uint32_t	e = 0x12345678;
+	int32_t		f = -0x12345678;
+	uint64_t	g = 0x1234567890abcdefULL;
+	int64_t		h = -0x1234567890abcdefLL;
+
+	for (;;) {
+		TEST_PROV_UVAL1(a);
+		TEST_PROV_SVAL1(b);
+		TEST_PROV_UVAL2(c);
+		TEST_PROV_SVAL2(d);
+		TEST_PROV_UVAL4(e);
+		TEST_PROV_SVAL4(f);
+		TEST_PROV_UVAL8(g);
+		TEST_PROV_SVAL8(h);
+	}
+
+	return 0;
+}
diff --git a/test/triggers/usdt-tst-deref-decode-prov.d b/test/triggers/usdt-tst-deref-decode-prov.d
new file mode 100644
index 00000000..1456e274
--- /dev/null
+++ b/test/triggers/usdt-tst-deref-decode-prov.d
@@ -0,0 +1,11 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+provider test_prov {
+	probe deref(int64_t a, int64_t b, int64_t c, int64_t d, int64_t e,
+		    int64_t f, int64_t g, int64_t h, int64_t i, int64_t j);
+};
diff --git a/test/triggers/usdt-tst-deref-decode.aarch64.c b/test/triggers/usdt-tst-deref-decode.aarch64.c
new file mode 100644
index 00000000..70343e0b
--- /dev/null
+++ b/test/triggers/usdt-tst-deref-decode.aarch64.c
@@ -0,0 +1,84 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+#include <stdlib.h>
+#include <sys/sdt.h>
+
+int
+main(int argc, char **argv)
+{
+ int *stp = calloc(100, sizeof(int));
+ long i = 0;
+
+ for (i = 0; i < 100; i++)
+    stp[i] = (i % 2 == 0) ? i : -i;
+
+ i = 0;
+ for (;;) {
+  /*
+   * Using pre-generated macro expansions because we need to force specific
+   * expresisons for the probe argument to exercise the decoder.
+   */
+  do {
+    /*  extern void __usdt1_test_prov___deref(unsigned long); */
+    __asm__ __volatile__ (
+      ".altmacro" "\n"
+      ".macro _SST x y z" "\n"
+      ".iflt \\x" "\n"
+      ".ascii \"-\"" "\n"
+      ".endif" "\n"
+      ".ascii \"\\y\"" "\n"
+      ".ifc 8,\\z" "\n"
+      ".ascii \"f\"" "\n"
+      ".endif" "\n"
+      ".ascii \"@\"" "\n"
+      ".endm" "\n"
+      ".macro SST x" "\n"
+      "_SST \\x, %%(-(\\x*((\\x>0)-(\\x<0)))>>8), %%((\\x))&(0xff)" "\n"
+      ".endm" "\n"
+      "mov x8, %[i]" "\n"
+      "mov x9, %[stp]" "\n"
+      "lsl x7, x8, #2" "\n"
+      "0: nop" "\n"
+      ".pushsection .note.usdt,\"?\",@note" "\n"
+      ".balign 4" "\n"
+      ".4byte 2f-1f" "\n"
+      ".4byte 4f-3f" "\n"
+      ".4byte 1" "\n"
+      "1: .asciz \"usdt\"" "\n"
+      "2: .balign 4" "\n"
+      "3: .8byte 0b" "\n"
+      ".8byte %[fn]" "\n"
+      ".asciz \"test_prov\"" "\n"
+      ".asciz \"deref\"" "\n"
+      ".byte 10" "\n"
+      ".ascii \"-4@[x9,x7,4] \"" "\n"
+      ".ascii \"-4@[x9,x8,4] \"" "\n"
+      ".ascii \"-4@52 \"" "\n"
+      ".ascii \"-4@[x9,4] \"" "\n"
+      ".ascii \"-4@[x9,x7] \"" "\n"
+      ".ascii \"-4@[x9,x8] \"" "\n"
+      ".ascii \"-8@x7 \"" "\n"
+      ".ascii \"-4@[x9] \"" "\n"
+      ".ascii \"-8@x9 \"" "\n"
+      ".ascii \"-8@x8\"" "\n"
+      ".byte 0" "\n"
+      "4: .balign 4" "\n"
+      ".popsection" "\n"
+      ".purgem SST" "\n"
+      ".purgem _SST" "\n"
+      :: [i] "r" (i),
+         [stp] "r" (stp),
+	 [fn] "s" (__func__)
+      :  "x7", "x8", "x9" );
+  } while (0);
+
+  if (++i >= 25)
+   i = 0;
+ }
+ return 0;
+}
diff --git a/test/triggers/usdt-tst-deref-decode.x86_64.c b/test/triggers/usdt-tst-deref-decode.x86_64.c
new file mode 100644
index 00000000..66a76789
--- /dev/null
+++ b/test/triggers/usdt-tst-deref-decode.x86_64.c
@@ -0,0 +1,80 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+#include <stdlib.h>
+#include <sys/sdt.h>
+
+int
+main(int argc, char **argv)
+{
+ int *stp = calloc(100, sizeof(int));
+ long i = 0;
+
+ for (i = 0; i < 100; i++)
+    stp[i] = (i % 2 == 0) ? i : -i;
+
+ for (;;) {
+  /*
+   * Using pre-generated macro expansions because we need to force specific
+   * expresisons for the probe argument to exercise the decoder.
+   */
+  do {
+    /* extern void __usdt1_test_prov___deref(unsigned long); */
+    __asm__ __volatile__ (
+      ".altmacro" "\n"
+      ".macro _SST x y z" "\n"
+      ".iflt \\x" "\n"
+      ".ascii \"-\"" "\n"
+      ".endif" "\n"
+      ".ascii \"\\y\"" "\n"
+      ".ifc 8,\\z" "\n"
+      ".ascii \"f\"" "\n"
+      ".endif" "\n"
+      ".ascii \"@\"" "\n"
+      ".endm" "\n"
+      ".macro SST x" "\n"
+      "_SST \\x, %%(-(\\x*((\\x>0)-(\\x<0)))>>8), %%((\\x))&(0xff)" "\n"
+      ".endm" "\n"
+      "0: nop" "\n"
+      ".pushsection .note.usdt,\"?\",@note" "\n"
+      ".balign 4" "\n"
+      ".4byte 2f-1f" "\n"
+      ".4byte 4f-3f" "\n"
+      ".4byte 1" "\n"
+      "1: .asciz \"usdt\"" "\n"
+      "2: .balign 4" "\n"
+      "3: .8byte 0b" "\n"
+      ".8byte %p[fn]" "\n"
+      ".asciz \"test_prov\"" "\n"
+      ".asciz \"deref\"" "\n"
+      ".byte 10" "\n"
+      ".ascii \"-4@4(%%rcx,%%rdx,4) \"" "\n"
+      ".ascii \"-4@4(%%rcx,%%rdx) \"" "\n"
+      ".ascii \"-8@4(,%%rdx,4) \"" "\n"
+      ".ascii \"-4@4(%%rcx) \"" "\n"
+      ".ascii \"-4@(%%rcx,%%rdx,4) \"" "\n"
+      ".ascii \"-4@(%%rcx,%%rdx) \"" "\n"
+      ".ascii \"-8@(,%%rdx,4) \"" "\n"
+      ".ascii \"-4@(%%rcx) \"" "\n"
+      ".ascii \"-8@%%rcx \"" "\n"
+      ".ascii \"-8@%%rdx\"" "\n"
+      ".byte 0" "\n"
+      "4: .balign 4" "\n"
+      ".popsection" "\n"
+      ".purgem SST" "\n"
+      ".purgem _SST" "\n"
+      :: [arr] "c" (stp),
+	 [idx] "d" (i),
+         [fn] "s" (__func__) );
+  } while (0);
+
+  if (++i >= 25)
+   i = 0;
+ }
+
+ return 0;
+}
diff --git a/test/unittest/options/tst.strip.sh b/test/unittest/options/tst.strip.sh
index f7960d7a..d25f76af 100755
--- a/test/unittest/options/tst.strip.sh
+++ b/test/unittest/options/tst.strip.sh
@@ -45,20 +45,20 @@ if [ $? -ne 0 ]; then
 	exit 1
 fi
 
-# link with and without -xstrip, dumping the DOF section
+# link with and without -xstrip, dumping the USDT note
 
-objdump="${OBJDUMP} --full-contents --section=.SUNW_dof prov.o"
+objdump="${OBJDUMP} --full-contents --section=.note.usdt prov.o"
 
 $dtrace $dt_flags -G -xstrip -s prov.d test.o
 if [ $? -ne 0 ]; then
-	echo "failed to create DOF (stripped)" >& 2
+	echo "failed to create USDT notes (stripped)" >& 2
 	exit 1
 fi
 $objdump >& out.stripped.txt
 
 $dtrace $dt_flags -G -s prov.d test.o
 if [ $? -ne 0 ]; then
-	echo "failed to create DOF" >& 2
+	echo "failed to create USDT notes" >& 2
 	exit 1
 fi
 $objdump >& out.default.txt
diff --git a/test/unittest/usdt/tst.guess32.sh b/test/unittest/usdt/err.wrong-probe-argc-cc.sh
similarity index 57%
rename from test/unittest/usdt/tst.guess32.sh
rename to test/unittest/usdt/err.wrong-probe-argc-cc.sh
index 21961236..73e11f9b 100755
--- a/test/unittest/usdt/tst.guess32.sh
+++ b/test/unittest/usdt/err.wrong-probe-argc-cc.sh
@@ -1,49 +1,45 @@
 #!/bin/bash
 #
 # Oracle Linux DTrace.
-# Copyright (c) 2006, 2025, Oracle and/or its affiliates. All rights reserved.
+# Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
-
+#
 if [ $# != 1 ]; then
 	echo expected one argument: '<'dtrace-path'>'
 	exit 2
 fi
 
 dtrace=$1
+CC=/usr/bin/gcc
 CFLAGS="$test_cppflags"
 LDFLAGS="$test_ldflags"
 
-DIRNAME="$tmpdir/usdt-guess32.$$.$RANDOM"
+DIRNAME="$tmpdir/usdt-wrong-probe.$$.$RANDOM"
 mkdir -p $DIRNAME
 cd $DIRNAME
 
 cat > prov.d <<EOF
 provider test_prov {
-	probe go();
+	probe go(int a, int b);
 };
 EOF
 
-$dtrace $dt_flags -h -s prov.d
-if [ $? -ne 0 ]; then
-	echo "failed to generate header file" >& 2
-	exit 1
-fi
-
 cat > test.c <<EOF
-#include <sys/types.h>
+#include <sys/sdt.h>
 #include "prov.h"
 
 int
 main(int argc, char **argv)
 {
-	if (TEST_PROV_GO_ENABLED()) {
-		TEST_PROV_GO();
-	}
+	DTRACE_PROBE(test_prov, go, 1);
+
+	return 0;
 }
 EOF
 
-${CC} ${CFLAGS} -m32 -c test.c
+$dtrace $dt_flags -h -s prov.d
+${CC} ${CFLAGS} -c test.c
 if [ $? -ne 0 ]; then
 	echo "failed to compile test.c" >& 2
 	exit 1
@@ -53,23 +49,13 @@ if [ $? -ne 0 ]; then
 	echo "failed to create DOF" >& 2
 	exit 1
 fi
-${CC} ${LDFLAGS} -m32 -o test test.o prov.o
+${CC} ${LDFLAGS} -o test test.o prov.o
 if [ $? -ne 0 ]; then
 	echo "failed to link final executable" >& 2
 	exit 1
 fi
 
-script()
-{
-	$dtrace $dt_flags -c ./test -qs /dev/stdin <<EOF
-	test_prov\$target:::
-	{
-		printf("%s:%s:%s\n", probemod, probefunc, probename);
-	}
-EOF
-}
-
-script
-status=$?
+$dtrace $dt_flags -c ./test -n 'test_prov$target:::go, tick-1s { exit(0); }'
+rc=$?
 
-exit $status
+exit $rc
diff --git a/test/unittest/usdt/err.wrong-probe-argc-rt.sh b/test/unittest/usdt/err.wrong-probe-argc-rt.sh
new file mode 100755
index 00000000..1e34e4ff
--- /dev/null
+++ b/test/unittest/usdt/err.wrong-probe-argc-rt.sh
@@ -0,0 +1,59 @@
+#!/bin/bash
+#
+# Oracle Linux DTrace.
+# Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
+# Licensed under the Universal Permissive License v 1.0 as shown at
+# http://oss.oracle.com/licenses/upl.
+#
+if [ $# != 1 ]; then
+	echo expected one argument: '<'dtrace-path'>'
+	exit 2
+fi
+
+dtrace=$1
+CC=/usr/bin/gcc
+CFLAGS="$test_cppflags"
+LDFLAGS="$test_ldflags"
+
+DIRNAME="$tmpdir/usdt-wrong-probe.$$.$RANDOM"
+mkdir -p $DIRNAME
+cd $DIRNAME
+
+cat > prov.d <<EOF
+provider test_prov {
+	probe go(int a, int b);
+};
+EOF
+
+cat > test.c <<EOF
+#include <sys/sdt.h>
+
+int
+main(int argc, char **argv)
+{
+	DTRACE_PROBE(test_prov, go, 1);
+
+	return 0;
+}
+EOF
+
+${CC} ${CFLAGS} -c test.c
+if [ $? -ne 0 ]; then
+	echo "failed to compile test.c" >& 2
+	exit 1
+fi
+$dtrace $dt_flags -G -s prov.d test.o
+if [ $? -ne 0 ]; then
+	echo "failed to create DOF" >& 2
+	exit 1
+fi
+${CC} ${LDFLAGS} -o test test.o prov.o
+if [ $? -ne 0 ]; then
+	echo "failed to link final executable" >& 2
+	exit 1
+fi
+
+$dtrace $dt_flags -c ./test -n 'test_prov$target:::go, tick-1s { exit(0); }'
+rc=$?
+
+exit $rc
diff --git a/test/unittest/usdt/err.wrong-probe.sh b/test/unittest/usdt/err.wrong-probe.sh
new file mode 100755
index 00000000..c7ae74f2
--- /dev/null
+++ b/test/unittest/usdt/err.wrong-probe.sh
@@ -0,0 +1,59 @@
+#!/bin/bash
+#
+# Oracle Linux DTrace.
+# Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
+# Licensed under the Universal Permissive License v 1.0 as shown at
+# http://oss.oracle.com/licenses/upl.
+#
+if [ $# != 1 ]; then
+	echo expected one argument: '<'dtrace-path'>'
+	exit 2
+fi
+
+dtrace=$1
+CC=/usr/bin/gcc
+CFLAGS="$test_cppflags"
+LDFLAGS="$test_ldflags"
+
+DIRNAME="$tmpdir/usdt-wrong-probe.$$.$RANDOM"
+mkdir -p $DIRNAME
+cd $DIRNAME
+
+cat > prov.d <<EOF
+provider test_prov {
+	probe go();
+};
+EOF
+
+cat > test.c <<EOF
+#include <sys/sdt.h>
+
+int
+main(int argc, char **argv)
+{
+	DTRACE_PROBE(test_prov, bad);
+
+	return 0;
+}
+EOF
+
+${CC} ${CFLAGS} -c test.c
+if [ $? -ne 0 ]; then
+	echo "failed to compile test.c" >& 2
+	exit 1
+fi
+$dtrace $dt_flags -G -s prov.d test.o
+if [ $? -ne 0 ]; then
+	echo "failed to create DOF" >& 2
+	exit 1
+fi
+${CC} ${LDFLAGS} -o test test.o prov.o
+if [ $? -ne 0 ]; then
+	echo "failed to link final executable" >& 2
+	exit 1
+fi
+
+$dtrace $dt_flags -c ./test -n 'test_prov$target:::, tick-1s { exit(0); }'
+rc=$?
+
+exit $rc
diff --git a/test/unittest/usdt/err.wrong-prov.sh b/test/unittest/usdt/err.wrong-prov.sh
new file mode 100755
index 00000000..4562a3ae
--- /dev/null
+++ b/test/unittest/usdt/err.wrong-prov.sh
@@ -0,0 +1,59 @@
+#!/bin/bash
+#
+# Oracle Linux DTrace.
+# Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
+# Licensed under the Universal Permissive License v 1.0 as shown at
+# http://oss.oracle.com/licenses/upl.
+#
+if [ $# != 1 ]; then
+	echo expected one argument: '<'dtrace-path'>'
+	exit 2
+fi
+
+dtrace=$1
+CC=/usr/bin/gcc
+CFLAGS="$test_cppflags"
+LDFLAGS="$test_ldflags"
+
+DIRNAME="$tmpdir/usdt-wrong-prov.$$.$RANDOM"
+mkdir -p $DIRNAME
+cd $DIRNAME
+
+cat > prov.d <<EOF
+provider test_prov {
+	probe go();
+};
+EOF
+
+cat > test.c <<EOF
+#include <sys/sdt.h>
+
+int
+main(int argc, char **argv)
+{
+	DTRACE_PROBE(bad_prov, go);
+
+	return 0;
+}
+EOF
+
+${CC} ${CFLAGS} -c test.c
+if [ $? -ne 0 ]; then
+	echo "failed to compile test.c" >& 2
+	exit 1
+fi
+$dtrace $dt_flags -G -s prov.d test.o
+if [ $? -ne 0 ]; then
+	echo "failed to create DOF" >& 2
+	exit 1
+fi
+${CC} ${LDFLAGS} -o test test.o prov.o
+if [ $? -ne 0 ]; then
+	echo "failed to link final executable" >& 2
+	exit 1
+fi
+
+$dtrace $dt_flags -c ./test -n '*_prov$target:::, tick-1s { exit(0); }'
+rc=$?
+
+exit $rc
diff --git a/test/unittest/usdt/tst.arg-reg.d b/test/unittest/usdt/tst.arg-reg.d
new file mode 100644
index 00000000..123e7e21
--- /dev/null
+++ b/test/unittest/usdt/tst.arg-reg.d
@@ -0,0 +1,38 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/* @@trigger: usdt-tst-arg-reg */
+/* @@trigger-timing: before */
+/* @@runtest-opts: $_pid */
+
+#pragma D option quiet
+
+BEGIN
+{
+	/* Timeout after 5 seconds */
+	timeout = timestamp + 5000000000;
+}
+
+test_prov$1:::sval*,
+test_prov$1:::uval*
+/firings[probename]++/
+{
+	exit(0);
+}
+
+test_prov$1:::sval*,
+test_prov$1:::uval*
+{
+	printf("%s: arg is %d\n", probename, arg0);
+}
+
+profile:::tick-1
+/timestamp > timeout/
+{
+	trace("test timed out");
+	exit(1);
+}
diff --git a/test/unittest/usdt/tst.arg-reg.r b/test/unittest/usdt/tst.arg-reg.r
new file mode 100644
index 00000000..ce792166
--- /dev/null
+++ b/test/unittest/usdt/tst.arg-reg.r
@@ -0,0 +1,9 @@
+uval1: arg is 18
+sval1: arg is -18
+uval2: arg is 4660
+sval2: arg is -4660
+uval4: arg is 305419896
+sval4: arg is -305419896
+uval8: arg is 1311768467294899695
+sval8: arg is -1311768467294899695
+
diff --git a/test/unittest/usdt/tst.badguess.sh b/test/unittest/usdt/tst.badguess.sh
deleted file mode 100755
index 6cd959bb..00000000
--- a/test/unittest/usdt/tst.badguess.sh
+++ /dev/null
@@ -1,63 +0,0 @@
-#!/bin/bash
-#
-# Oracle Linux DTrace.
-# Copyright (c) 2006, 2025, Oracle and/or its affiliates. All rights reserved.
-# Licensed under the Universal Permissive License v 1.0 as shown at
-# http://oss.oracle.com/licenses/upl.
-#
-if [ $# != 1 ]; then
-	echo expected one argument: '<'dtrace-path'>'
-	exit 2
-fi
-
-dtrace=$1
-CFLAGS="$test_cppflags"
-LDFLAGS="$test_ldflags"
-
-DIRNAME="$tmpdir/usdt-badguess.$$.$RANDOM"
-mkdir -p $DIRNAME
-cd $DIRNAME
-
-cat > prov.d <<EOF
-provider test_prov {
-	probe go();
-};
-EOF
-
-$dtrace $dt_flags -h -s prov.d
-if [ $? -ne 0 ]; then
-	echo "failed to generate header file" >& 2
-	exit 1
-fi
-
-cat > test.c <<EOF
-#include <sys/types.h>
-#include "prov.h"
-
-int
-main(int argc, char **argv)
-{
-	if (TEST_PROV_GO_ENABLED()) {
-		TEST_PROV_GO();
-	}
-}
-EOF
-
-$CC $CFLAGS -c -o test64.o test.c
-if [ $? -ne 0 ]; then
-	echo "failed to compile test.c 64-bit" >& 2
-	exit 1
-fi
-$CC $LDFLAGS -m32 -c -o test32.o test.c
-if [ $? -ne 0 ]; then
-	echo "failed to compile test.c 32-bit" >& 2
-	exit 1
-fi
-
-$dtrace $dt_flags -G -s prov.d test32.o test64.o
-if [ $? -eq 0 ]; then
-	echo "DOF generation failed to generate a warning" >& 2
-	exit 1
-fi
-
-exit 0
diff --git a/test/unittest/usdt/tst.badguess.x b/test/unittest/usdt/tst.badguess.x
deleted file mode 100755
index b4030d55..00000000
--- a/test/unittest/usdt/tst.badguess.x
+++ /dev/null
@@ -1,7 +0,0 @@
-#!/bin/bash
-# Licensed under the Universal Permissive License v 1.0 as shown at
-# http://oss.oracle.com/licenses/upl.
-#
-# If we can't compile a trivial 32-bit program, this test
-# will fail.
-echo 'int main (void) { }' | $CC -x c -c -o /dev/null -m32 - 2>/dev/null
diff --git a/test/unittest/usdt/tst.const.d b/test/unittest/usdt/tst.const.d
new file mode 100644
index 00000000..515de7f8
--- /dev/null
+++ b/test/unittest/usdt/tst.const.d
@@ -0,0 +1,38 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/* @@trigger: usdt-tst-arg-const */
+/* @@trigger-timing: before */
+/* @@runtest-opts: $_pid */
+
+#pragma D option quiet
+
+BEGIN
+{
+	/* Timeout after 5 seconds */
+	timeout = timestamp + 5000000000;
+}
+
+test_prov$1:::sval*,
+test_prov$1:::uval*
+/firings[probename]++/
+{
+	exit(0);
+}
+
+test_prov$1:::sval*,
+test_prov$1:::uval*
+{
+	printf("%s: arg is %d\n", probename, arg0);
+}
+
+profile:::tick-1
+/timestamp > timeout/
+{
+	trace("test timed out");
+	exit(1);
+}
diff --git a/test/unittest/usdt/tst.const.r b/test/unittest/usdt/tst.const.r
new file mode 100644
index 00000000..ce792166
--- /dev/null
+++ b/test/unittest/usdt/tst.const.r
@@ -0,0 +1,9 @@
+uval1: arg is 18
+sval1: arg is -18
+uval2: arg is 4660
+sval2: arg is -4660
+uval4: arg is 305419896
+sval4: arg is -305419896
+uval8: arg is 1311768467294899695
+sval8: arg is -1311768467294899695
+
diff --git a/test/unittest/usdt/tst.deref-decode.d b/test/unittest/usdt/tst.deref-decode.d
new file mode 100644
index 00000000..fc019eb5
--- /dev/null
+++ b/test/unittest/usdt/tst.deref-decode.d
@@ -0,0 +1,39 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/* @@trigger: usdt-tst-deref-decode */
+/* @@trigger-timing: before */
+/* @@runtest-opts: $_pid */
+
+#pragma D option quiet
+
+BEGIN
+{
+	/* Timeout after 5 seconds */
+	timeout = timestamp + 5000000000;
+}
+
+test_prov$1:::deref
+/arg9 == 12 && (arg0 != -13 || arg1 != 4 || arg2 != 52 || arg3 != -1 ||
+		arg4 != 12 || arg5 != -3 || arg6 != 48 || arg7 != 0)/
+{
+	printf("args are %d %d %d %d %d %d %d %d %d; should be -13 4 52 -1 12 -3 48 0 12", arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg9);
+	exit(1);
+}
+
+test_prov$1:::deref
+/arg9 == 12/
+{
+	exit(0);
+}
+
+profile:::tick-1
+/timestamp > timeout/
+{
+	trace("test timed out");
+	exit(1);
+}
diff --git a/test/unittest/usdt/tst.guess32.x b/test/unittest/usdt/tst.guess32.x
deleted file mode 100755
index a0b1b73e..00000000
--- a/test/unittest/usdt/tst.guess32.x
+++ /dev/null
@@ -1,8 +0,0 @@
-#!/bin/bash
-# Licensed under the Universal Permissive License v 1.0 as shown at
-# http://oss.oracle.com/licenses/upl.
-#
-# The existence of this file is a reasonable proxy for
-# being on a 32-bit-capable host.
-[[ -e test/triggers/libproc-sleeper-32 ]] && exit 0
-exit 1
diff --git a/test/unittest/usdt/tst.multiprov-dupprobe-shlibs.r.p b/test/unittest/usdt/tst.multiprov-dupprobe-shlibs.r.p
index ff7128a2..3018b827 100755
--- a/test/unittest/usdt/tst.multiprov-dupprobe-shlibs.r.p
+++ b/test/unittest/usdt/tst.multiprov-dupprobe-shlibs.r.p
@@ -1,5 +1,9 @@
 #!/usr/bin/gawk -f
 
+# Initialize tgt to a dummy value so output without a correct first line does
+# not result in trying to replace every character in output with $target.
+BEGIN { tgt = "DUMMY"; }
+
 # first line: get the target pid
 /^target = [0-9]*$/ { tgt = $3; next }
 
diff --git a/test/utils/Build b/test/utils/Build
index 10f4e726..7976272f 100644
--- a/test/utils/Build
+++ b/test/utils/Build
@@ -1,5 +1,5 @@
 # Oracle Linux DTrace.
-# Copyright (c) 2011, 2023, Oracle and/or its affiliates. All rights reserved.
+# Copyright (c) 2011, 2025, Oracle and/or its affiliates. All rights reserved.
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 
@@ -31,8 +31,8 @@ $(foreach util,$(TEST_UTILS),$(eval $(call test-util-template,$(util))))
 
 # The showUSDT utility needs to be linked against libelf, and should not be
 # linked against libdtrace.
-showUSDT_DEPS =
-showUSDT_LIBS = -lelf
+showUSDT_DEPS = libcommon.a
+showUSDT_LIBS = -lelf -L$(objdir) -lcommon
 
 # The print-stack-layout utility needs dt_impl.h which needs dt_git_version.h.
 print-stack-layout_SRCDEPS := $(objdir)/dt_git_version.h
diff --git a/test/utils/showUSDT.c b/test/utils/showUSDT.c
index 3ab2632e..63abc602 100644
--- a/test/utils/showUSDT.c
+++ b/test/utils/showUSDT.c
@@ -1,6 +1,6 @@
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2013, 2019, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2013, 2025, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
@@ -15,12 +15,30 @@
 #include <sys/utsname.h>
 #include <sys/dtrace.h>
 
+#include <dt_htab.h>
+
+#include <ctype.h>
+
 #ifndef SHT_SUNW_dof
 # define SHT_SUNW_dof	0x6ffffff4
 #endif
 
+#define ALIGN(v, p2)	 (((v) + ((p2) - 1)) & ~((p2) - 1))
+
 static int	arch;
 
+void *dt_alloc(void *dmy, size_t size) {
+    return malloc(size);
+}
+
+void *dt_calloc(void *dmy, size_t num, size_t size) {
+    return calloc(num, size);
+}
+
+void dt_free(void *dmy, void *ptr) {
+    free(ptr);
+}
+
 static void printComments(dof_sec_t *sec, void *data) {
     printf("    Comment:\n" \
 	   "      %s\n", (char *)data + sec->dofs_offset);
@@ -349,10 +367,273 @@ static int processDOF(dof_hdr_t *dof, size_t size) {
     return 0;
 }
 
+typedef struct dt_probe		dt_probe_t;
+typedef struct dt_provider	dt_provider_t;
+
+struct dt_probe {
+    dt_hentry_t		he;
+    dt_provider_t	*prov;
+    const char		*prv;
+    const char		*fun;
+    const char		*prb;
+};
+
+struct dt_provider {
+    dt_hentry_t		he;
+    const char		*name;
+    uint32_t		pattr;
+    uint32_t		mattr;
+    uint32_t		fattr;
+    uint32_t		nattr;
+    uint32_t		aattr;
+    uint32_t		probec;
+    dt_htab_t		*pmap;
+    dt_probe_t		*probes;
+};
+
+dt_htab_t	*prvmap;
+dt_htab_t	*prbmap;
+
+extern uint32_t str2hval(const char *, uint32_t);
+
+static uint32_t prv_hval(const dt_provider_t *pvp) {
+	return str2hval(pvp->name, 0);
+}
+
+static int prv_cmp(const dt_provider_t *p, const dt_provider_t *q) {
+	return strcmp(p->name, q->name);
+}
+
+DEFINE_HE_STD_LINK_FUNCS(prv, dt_provider_t, he)
+DEFINE_HTAB_STD_OPS(prv)
+
+static uint32_t prb_hval(const dt_probe_t *prp) {
+	uint32_t	hval;
+
+	hval = str2hval(prp->prv, 0);
+	hval = str2hval(prp->fun, hval);
+
+	return str2hval(prp->prb, hval);
+}
+
+static int prb_cmp(const dt_probe_t *p, const dt_probe_t *q) {
+	int	rc;
+
+	if (p->fun != NULL) {
+		if (q->fun == NULL)
+			return 1;
+		else {
+			rc = strcmp(p->fun, q->fun);
+			if (rc != 0)
+				return rc;
+		}
+	} else if (q->fun == NULL)
+		return -1;
+
+	return strcmp(p->prb, q->prb);
+}
+
+DEFINE_HE_STD_LINK_FUNCS(prb, dt_probe_t, he)
+DEFINE_HTAB_STD_OPS(prb)
+
+static int processNote(const char *name, int type, const char *data, int size,
+		       Elf_Data *rodata) {
+    int			i;
+    dt_probe_t		prbt, *prp;
+    dt_provider_t	prvt, *prov;
+
+    printf("    Note %s, type %d:\n", name, type);
+    if (strcmp(name, "usdt") == 0) {
+	const char	*p = data;
+	uint64_t	off, fno;
+	const char	*prv, *fun, *prb;
+
+	off = *(uint64_t *)p;
+	p += 8;
+	fno = *(uint64_t *)p;
+	p += 8;
+
+	if (fno < rodata->d_off)
+	    return -1;
+	fno -= rodata->d_off;
+	if (fno >= rodata->d_size)
+	    return -1;
+
+	fun = &((char *)rodata->d_buf)[fno];
+
+	printf("      Offset %#lx\n", off);
+	printf("      Function Offset %#lx\n", fno);
+	prv = p;
+	p += strlen(p) + 1;
+	prb = p;
+	p += strlen(p) + 1;
+	printf("      Probe %s::%s:%s%s\n", prv, fun, prb, type == 2 ? " (is-enabled)" : "");
+	printf("      ");
+
+	prvt.name = prv;
+	prov = dt_htab_lookup(prvmap, &prvt);
+	if (prov == NULL) {
+	    prov = malloc(sizeof(dt_provider_t));
+	    memset(prov, 0, sizeof(dt_provider_t));
+	    prov->name = prv;
+	    dt_htab_insert(prvmap, prov);
+	    prov->pmap = dt_htab_create(&prb_htab_ops);
+	}
+
+	prbt.prv = prv;
+	prbt.fun = fun;
+	prbt.prb = prb;
+
+	prp = dt_htab_lookup(prbmap, &prbt);
+	if (prp == NULL) {
+	    prp = malloc(sizeof(dt_probe_t));
+	    memset(prp, 0, sizeof(dt_probe_t));
+	    prp->prv = prov->name;
+	    prp->fun = fun;
+	    prp->prb = prb;
+	    dt_htab_insert(prbmap, prp);
+	}
+
+	for (i = p - data; i < size; i++)
+	    printf("%c", isprint(data[i]) ? data[i] : '.');
+	printf("\n");
+    } else if (strcmp(name, "prov") == 0) {
+	const char	*p = data;
+	const uint32_t	*attr;
+	dt_provider_t	*prov;
+
+	prvt.name = p;
+	prov = dt_htab_lookup(prvmap, &prvt);
+	if (prov == NULL) {
+	    prov = malloc(sizeof(dt_provider_t));
+	    memset(prov, 0, sizeof(dt_provider_t));
+	    prov->name = p;
+	    dt_htab_insert(prvmap, prov);
+	    prov->pmap = dt_htab_create(&prb_htab_ops);
+	}
+
+	p += ALIGN(strlen(p) + 1, 4);
+	attr = (uint32_t *)ALIGN((uintptr_t)p, 4);
+	prov->pattr = *attr++;
+	prov->mattr = *attr++;
+	prov->fattr = *attr++;
+	prov->nattr = *attr++;
+	prov->aattr = *attr++;
+	prov->probec = *attr++;
+	printf("      Provider '%s' with %d probe%s:\n",
+	       prov->name, prov->probec, prov->probec == 1 ? "" : "s");
+
+	p = (char *)attr;
+	for (i = 0; i < prov->probec; i++) {
+	    int	j, argc;
+
+	    p = (const char *)ALIGN((uintptr_t)p, 4);
+	    prbt.prv = prov->name;
+	    prbt.fun = NULL;
+	    prbt.prb = p;
+
+	    prp = dt_htab_lookup(prov->pmap, &prbt);
+	    if (prp == NULL) {
+		prp = malloc(sizeof(dt_probe_t));
+		memset(prp, 0, sizeof(dt_probe_t));
+		prp->prv = prov->name;
+		prp->fun = NULL;
+		prp->prb = p;
+		dt_htab_insert(prov->pmap, prp);
+	    }
+
+	    printf("      Probe %d: %s:::%s\n", i, prp->prv, prp->prb);
+
+	    p += strlen(p) + 1;
+	    argc = *(uint8_t *)p++;
+
+	    for (j = 0; j < argc; j++) {
+		printf("          (native) argv[%d]: %s\n", j, p);
+		p += strlen(p) + 1;
+	    }
+
+	    argc = *(uint8_t *)p++;
+
+	    for (j = 0; j < argc; j++) {
+		const char	*arg;
+		uint8_t		m;
+
+		arg = p;
+		p += strlen(arg) + 1;
+		m = *p++;
+		printf("          (translated) argv[%d] (from native argv[%hhd]): %s\n",
+		       j, m, arg);
+	    }
+	}
+    } else if (strcmp(name, "dver") == 0) {
+	const char	*p = data;
+
+	printf("      %s:\n", p);
+    } else if (strcmp(name, "utsn") == 0) {
+	struct utsname	*uts = (struct utsname *)(char *)data;
+
+	printf("      UTS Name:\n" \
+	       "        sysname  = %s\n" \
+	       "        nodename = %s\n" \
+	       "        release  = %s\n" \
+	       "        version  = %s\n" \
+	       "        machine  = %s\n",
+	       uts->sysname, uts->nodename, uts->release, uts->version,
+	       uts->machine);
+    }
+
+    return 0;
+}
+
+static int processNotes(char *data, size_t size, Elf_Data *rodata) {
+    size_t		idx = 0;
+    int			ret = 0;
+    dt_htab_next_t	*hit;
+    dt_provider_t	*pvp;
+    dt_probe_t		*prp;
+
+    prvmap = dt_htab_create(&prv_htab_ops);
+    prbmap = dt_htab_create(&prb_htab_ops);
+
+    for (idx = 0; idx < size; ) {
+	int	nsz, dsz, type;
+
+	nsz = *((int *)&data[idx]);
+	dsz = *((int *)&data[idx + 4]);
+	type = *((int *)&data[idx + 8]);
+
+	ret = processNote(&data[idx + 12], type,
+			  &data[idx + 12 + ALIGN(nsz, 4)], dsz, rodata);
+	if (ret != 0)
+	    break;
+
+	idx += 12 + ALIGN(nsz, 4) + ALIGN(dsz, 4);
+    }
+
+    printf("----------\n");
+    /* List all providers. */
+    hit = NULL;
+    while ((pvp = dt_htab_next(prvmap, &hit)) != NULL) {
+	printf("      Provider '%s' with %d probe%s:\n",
+	       pvp->name, pvp->probec, pvp->probec == 1 ? "" : "s");
+    }
+
+    /* List all probes (to be added/validated) to providers. */
+    hit = NULL;
+    while ((prp = dt_htab_next(prbmap, &hit)) != NULL) {
+	printf("      Probe %s::%s:%s\n", prp->prv, prp->fun, prp->prb);
+    }
+
+    return ret;
+}
+
 static int readObj(const char *fn) {
-    int		fd;
+    int		fd, i;
     int		ret = 1;
     Elf		*elf = NULL;
+    Elf_Data	*strtab = NULL;
+    Elf_Data	*rodata = NULL;
+    char 	*sname;
     Elf_Data	*data;
     Elf_Scn	*scn;
     GElf_Ehdr	ehdr;
@@ -381,10 +662,7 @@ static int readObj(const char *fn) {
 	goto out;
     }
     switch (ehdr.e_machine) {
-	case EM_386:
 	case EM_X86_64:
-	case EM_SPARC:
-	case EM_SPARCV9:
 	case EM_AARCH64:
 	    arch = ehdr.e_machine;
 	    break;
@@ -396,28 +674,94 @@ static int readObj(const char *fn) {
 
     printf("Processing %s:\n", fn);
 
+    /* Get the .shstrtab data. */
+    for (i = 1, scn = NULL; (scn = elf_nextscn(elf, scn)) != NULL; i++) {
+	if (i == ehdr.e_shstrndx)
+		break;
+    }
+    if (scn == NULL ||
+	gelf_getshdr(scn, &shdr) == NULL ||
+	shdr.sh_type != SHT_STRTAB) {
+	printf("  Section .shstrtab not found!\n");
+	goto out;
+    }
+    if ((strtab = elf_getdata(scn, NULL)) == NULL) {
+	printf("  Failed to read data for .shstrtab section!\n");
+	goto out;
+    }
+
+    /* Get the .rodata data. */
     scn = NULL;
     while ((scn = elf_nextscn(elf, scn)) != NULL) {
 	if (gelf_getshdr(scn, &shdr) == NULL)
 	    goto err;
-
-	if (shdr.sh_type == SHT_SUNW_dof)
+	if (shdr.sh_type != SHT_PROGBITS)
+	    continue;
+	if (shdr.sh_name >= strtab->d_size) {
+	    printf("  Invalid section name!\n");
+	    goto out;
+	}
+	sname = &((char *)strtab->d_buf)[shdr.sh_name];
+	if (strcmp(sname, ".rodata") == 0)
 	    break;
     }
 
-    if (shdr.sh_type != SHT_SUNW_dof) {
-	printf("  No DOF section found!\n");
+    if (scn == NULL) {
+	printf("  No .rodata section found!\n");
 	goto out;
     }
 
-    if ((data = elf_getdata(scn, NULL)) == NULL) {
-	printf("  Failed to read data for SUNW_dof section!\n");
+    if ((rodata = elf_getdata(scn, NULL)) == NULL) {
+	printf("  Failed to read data for .rodata section!\n");
 	goto out;
     }
 
-    processDOF(data->d_buf, data->d_size);
+    /* (Ab)use the offset to store the load base for the data. */
+    rodata->d_off = shdr.sh_addr;
+
+    /* Process note sections. */
+    scn = NULL;
+    while ((scn = elf_nextscn(elf, scn)) != NULL) {
+	if (gelf_getshdr(scn, &shdr) == NULL)
+	    goto err;
+
+	switch (shdr.sh_type) {
+	    case SHT_NOTE:
+		if (shdr.sh_name >= strtab->d_size) {
+		    printf("  Invalid section name!\n");
+		    goto out;
+		}
+
+		sname = &((char *)strtab->d_buf)[shdr.sh_name];
+		if (strcmp(sname, ".note.usdt") != 0)
+			continue;
+
+		if ((data = elf_getdata(scn, NULL)) == NULL) {
+		    printf("  Failed to read data for .note.usdt section!\n");
+		    goto out;
+		}
+
+		ret = processNotes(data->d_buf, data->d_size, rodata);
+		if (ret != 0)
+			goto out;
+
+		break;
+	    case SHT_SUNW_dof:
+		if ((data = elf_getdata(scn, NULL)) == NULL) {
+		    printf("  Failed to read data for .note.usdt section!\n");
+		    goto out;
+		}
+
+		ret = processDOF(data->d_buf, data->d_size);
+		if (ret != 0)
+			goto out;
+
+		break;
+	    default:
+		continue;
+	}
+    }
 
-    ret = 0;
     goto out;
 err:
     printf("  An error was encountered while processing %s\n", fn);
diff --git a/uts/common/sys/sdt.h b/uts/common/sys/sdt.h
index ea46e56d..58f4b709 100644
--- a/uts/common/sys/sdt.h
+++ b/uts/common/sys/sdt.h
@@ -1,170 +1,15 @@
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2011, 2018, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2011, 2025, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
 
+/* This exists for backwards compatibility only. */
+
 #ifndef _SYS_SDT_H_
 #define	_SYS_SDT_H_
 
-#ifdef	__cplusplus
-extern "C" {
-#endif
-
-#if (__STDC_VERSION__ >= 199901L && __GNUC__ && !__STRICT_ANSI__) || defined(__cplusplus)
-
-#define __stringify_1(...)	# __VA_ARGS__
-#define __stringify(...)	__stringify_1(__VA_ARGS__)
-#include <sys/sdt_internal.h>
-
-#define __DTRACE_TYPE_UNSIGNED_LONG_EACH(x) unsigned long
-#define __DTRACE_ULONG_CAST_EACH(x) (unsigned long)x
-
-#define	DTRACE_PROBE(provider, name, ...)	{                       \
-	extern void __dtrace_##provider##___##name(__DTRACE_APPLY_DEFAULT(__DTRACE_TYPE_UNSIGNED_LONG_EACH, void, ## __VA_ARGS__)); \
-	__dtrace_##provider##___##name(__DTRACE_APPLY(__DTRACE_ULONG_CAST_EACH, ## __VA_ARGS__)); \
-}
-
-#else
-
-#define	DTRACE_PROBE(provider, name) {					\
-	extern void __dtrace_##provider##___##name(void);		\
-	__dtrace_##provider##___##name();				\
-}
-
-#endif
-
-/*
- * For backward compatibility and pre-C99 compilers.
- */
-
-#define	DTRACE_PROBE1(provider, name, arg1) {				\
-	extern void __dtrace_##provider##___##name(unsigned long);	\
-	__dtrace_##provider##___##name((unsigned long)arg1);		\
-}
-
-#define	DTRACE_PROBE2(provider, name, arg1, arg2) {			\
-	extern void __dtrace_##provider##___##name(unsigned long,	\
-	    unsigned long);						\
-	__dtrace_##provider##___##name((unsigned long)arg1,		\
-	    (unsigned long)arg2);					\
-}
-
-#define	DTRACE_PROBE3(provider, name, arg1, arg2, arg3) {		\
-	extern void __dtrace_##provider##___##name(unsigned long,	\
-	    unsigned long, unsigned long);				\
-	__dtrace_##provider##___##name((unsigned long)arg1,		\
-	    (unsigned long)arg2, (unsigned long)arg3);			\
-}
-
-#define	DTRACE_PROBE4(provider, name, arg1, arg2, arg3, arg4) {		\
-	extern void __dtrace_##provider##___##name(unsigned long,	\
-	    unsigned long, unsigned long, unsigned long);		\
-	__dtrace_##provider##___##name((unsigned long)arg1,		\
-	    (unsigned long)arg2, (unsigned long)arg3,			\
-	    (unsigned long)arg4);					\
-}
-
-#define	DTRACE_PROBE5(provider, name, arg1, arg2, arg3, arg4, arg5) {	\
-	extern void __dtrace_##provider##___##name(unsigned long,	\
-	    unsigned long, unsigned long, unsigned long, unsigned long);\
-	__dtrace_##provider##___##name((unsigned long)arg1,		\
-	    (unsigned long)arg2, (unsigned long)arg3,			\
-	    (unsigned long)arg4, (unsigned long)arg5);			\
-}
-
-#define	DTRACE_PROBE6(provider, name, arg1, arg2, arg3, arg4, arg5,	\
-	arg6) {								\
-	extern void __dtrace_##provider##___##name(unsigned long,	\
-	    unsigned long, unsigned long, unsigned long, unsigned long,	\
-	    unsigned long);						\
-	__dtrace_##provider##___##name((unsigned long)arg1,		\
-	    (unsigned long)arg2, (unsigned long)arg3,			\
-	    (unsigned long)arg4, (unsigned long)arg5,			\
-	    (unsigned long)arg6);					\
-}
-
-#define	DTRACE_PROBE7(provider, name, arg1, arg2, arg3, arg4, arg5,	\
-	arg6, arg7) {							\
-	extern void __dtrace_##provider##___##name(unsigned long,	\
-	    unsigned long, unsigned long, unsigned long, unsigned long,	\
-	    unsigned long, unsigned long);				\
-	__dtrace_##provider##___##name((unsigned long)arg1,		\
-	    (unsigned long)arg2, (unsigned long)arg3,			\
-	    (unsigned long)arg4, (unsigned long)arg5,			\
-	    (unsigned long)arg6, (unsigned long)arg7);			\
-}
-
-#define	DTRACE_PROBE8(provider, name, arg1, arg2, arg3, arg4, arg5,	\
-	arg6, arg7, arg8) {						\
-	extern void __dtrace_##provider##___##name(unsigned long,	\
-	    unsigned long, unsigned long, unsigned long, unsigned long,	\
-	    unsigned long, unsigned long, unsigned long);		\
-	__dtrace_##provider##___##name((unsigned long)arg1,		\
-	    (unsigned long)arg2, (unsigned long)arg3,			\
-	    (unsigned long)arg4, (unsigned long)arg5,			\
-	    (unsigned long)arg6, (unsigned long)arg7,			\
-	    (unsigned long)arg8);					\
-}
-
-#define	DTRACE_PROBE9(provider, name, arg1, arg2, arg3, arg4, arg5,	\
-	arg6, arg7, arg8, arg9) {					\
-	extern void __dtrace_##provider##___##name(unsigned long,	\
-	    unsigned long, unsigned long, unsigned long, unsigned long,	\
-	    unsigned long, unsigned long, unsigned long, unsigned long);\
-	__dtrace_##provider##___##name((unsigned long)arg1,		\
-	    (unsigned long)arg2, (unsigned long)arg3,			\
-	    (unsigned long)arg4, (unsigned long)arg5,			\
-	    (unsigned long)arg6, (unsigned long)arg7,			\
-	    (unsigned long)arg8, (unsigned long)arg9);			\
-}
-
-#define	DTRACE_PROBE10(provider, name, arg1, arg2, arg3, arg4, arg5,	\
-	arg6, arg7, arg8, arg9, arg10) {				\
-	extern void __dtrace_##provider##___##name(unsigned long,	\
-	    unsigned long, unsigned long, unsigned long, unsigned long,	\
-	    unsigned long, unsigned long, unsigned long, unsigned long,	\
-	    unsigned long);						\
-	__dtrace_##provider##___##name((unsigned long)arg1,		\
-	    (unsigned long)arg2, (unsigned long)arg3,			\
-	    (unsigned long)arg4, (unsigned long)arg5,			\
-	    (unsigned long)arg6, (unsigned long)arg7,			\
-	    (unsigned long)arg8, (unsigned long)arg9,			\
-	    (unsigned long)arg10);					\
-}
-
-#define	DTRACE_PROBE11(provider, name, arg1, arg2, arg3, arg4, arg5,	\
-	arg6, arg7, arg8, arg9, arg10, arg11) {				\
-	extern void __dtrace_##provider##___##name(unsigned long,	\
-	    unsigned long, unsigned long, unsigned long, unsigned long,	\
-	    unsigned long, unsigned long, unsigned long, unsigned long,	\
-	    unsigned long, unsigned long);				\
-	__dtrace_##provider##___##name((unsigned long)arg1,		\
-	    (unsigned long)arg2,  (unsigned long)arg3,			\
-	    (unsigned long)arg4,  (unsigned long)arg5,			\
-	    (unsigned long)arg6,  (unsigned long)arg7,			\
-	    (unsigned long)arg8,  (unsigned long)arg9,			\
-	    (unsigned long)arg10, (unsigned long)arg11);		\
-}
-
-#define	DTRACE_PROBE12(provider, name, arg1, arg2, arg3, arg4, arg5,	\
-	arg6, arg7, arg8, arg9, arg10, arg11, arg12) {			\
-	extern void __dtrace_##provider##___##name(unsigned long,	\
-	    unsigned long, unsigned long, unsigned long, unsigned long,	\
-	    unsigned long, unsigned long, unsigned long, unsigned long,	\
-	    unsigned long, unsigned long, unsigned long);		\
-	__dtrace_##provider##___##name((unsigned long)arg1,		\
-	    (unsigned long)arg2,  (unsigned long)arg3,			\
-	    (unsigned long)arg4,  (unsigned long)arg5,			\
-	    (unsigned long)arg6,  (unsigned long)arg7,			\
-	    (unsigned long)arg8,  (unsigned long)arg9,			\
-	    (unsigned long)arg10, (unsigned long)arg11,			\
-	    (unsigned long)arg12);					\
-}
-
-#ifdef	__cplusplus
-}
-#endif
+#include <sys/usdt.h>
 
 #endif /* _SYS_SDT_H_ */
diff --git a/uts/common/sys/usdt.h b/uts/common/sys/usdt.h
new file mode 100644
index 00000000..7913559c
--- /dev/null
+++ b/uts/common/sys/usdt.h
@@ -0,0 +1,83 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2011, 2025, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+#ifndef _SYS_USDT_H_
+#define	_SYS_USDT_H_
+
+#ifdef	__cplusplus
+extern "C" {
+#endif
+
+#define __stringify_1(...)	# __VA_ARGS__
+#define __stringify(...)	__stringify_1(__VA_ARGS__)
+
+#include "usdt_gennote.h"
+
+#define __DT_TYPE_UNSIGNED_LONG_EACH(n, x) unsigned long
+#define __DT_ULONG_CAST_EACH(n, x) (unsigned long)x
+
+#define	DTRACE_PROBE(provider, name, ...) \
+		_USDT_PROBE(provider, name, ## __VA_ARGS__)
+
+/* For backward compatibility and pre-C99 compilers. */
+
+#define	DTRACE_PROBE1(provider, name, arg1)				\
+		DTRACE_PROBE(provider, name, arg1)
+
+#define	DTRACE_PROBE2(provider, name, arg1, arg2)			\
+		DTRACE_PROBE(provider, name, arg1, arg2)
+
+#define	DTRACE_PROBE3(provider, name, arg1, arg2, arg3)			\
+		DTRACE_PROBE(provider, name, arg1, arg2, arg3)
+
+#define	DTRACE_PROBE4(provider, name, arg1, arg2, arg3, arg4)		\
+		DTRACE_PROBE(provider, name, arg1, arg2, arg3, arg4)
+
+#define	DTRACE_PROBE5(provider, name, arg1, arg2, arg3, arg4, arg5)	\
+		DTRACE_PROBE(provider, name, arg1, arg2, arg3, arg4, arg5)
+
+#define	DTRACE_PROBE6(provider, name, arg1, arg2, arg3, arg4, arg5,	\
+		      arg6)						\
+		DTRACE_PROBE(provider, name, arg1, arg2, arg3, arg4,	\
+			     arg5, arg6)
+
+#define	DTRACE_PROBE7(provider, name, arg1, arg2, arg3, arg4, arg5,	\
+		     arg6, arg7)					\
+		DTRACE_PROBE(provider, name, arg1, arg2, arg3, arg4,	\
+			     arg5, arg6, arg7)
+
+#define	DTRACE_PROBE8(provider, name, arg1, arg2, arg3, arg4, arg5,	\
+		      arg6, arg7, arg8)					\
+		DTRACE_PROBE(provider, name, arg1, arg2, arg3, arg4,	\
+			     arg5, arg6, arg7, arg8)
+
+#define	DTRACE_PROBE9(provider, name, arg1, arg2, arg3, arg4, arg5,	\
+		      arg6, arg7, arg8, arg9)				\
+		DTRACE_PROBE(provider, name, arg1, arg2, arg3, arg4,	\
+			     arg5, arg6, arg7, arg8, arg9)
+
+#define	DTRACE_PROBE10(provider, name, arg1, arg2, arg3, arg4, arg5,	\
+		       arg6, arg7, arg8, arg9, arg10)			\
+		DTRACE_PROBE(provider, name, arg1, arg2, arg3, arg4,	\
+			     arg5, arg6, arg7, arg8, arg9, arg10)
+
+#define	DTRACE_PROBE11(provider, name, arg1, arg2, arg3, arg4, arg5,	\
+		       arg6, arg7, arg8, arg9, arg10, arg11)		\
+		DTRACE_PROBE(provider, name, arg1, arg2, arg3, arg4,	\
+			     arg5, arg6, arg7, arg8, arg9, arg10, arg11)
+
+#define	DTRACE_PROBE12(provider, name, arg1, arg2, arg3, arg4, arg5,	\
+		       arg6, arg7, arg8, arg9, arg10, arg11, arg12)	\
+		DTRACE_PROBE(provider, name, arg1, arg2, arg3, arg4,	\
+			     arg5, arg6, arg7, arg8, arg9, arg10,	\
+			     arg11, arg12)
+
+#ifdef	__cplusplus
+}
+#endif
+
+#endif /* _SYS_USDT_H_ */
diff --git a/uts/common/sys/usdt_gennote.h b/uts/common/sys/usdt_gennote.h
new file mode 100644
index 00000000..f063bc9d
--- /dev/null
+++ b/uts/common/sys/usdt_gennote.h
@@ -0,0 +1,139 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+#ifndef _SYS_USDT_GENNOTE_H_
+#define	_SYS_USDT_GENNOTE_H_
+
+#include "usdt_internal.h"
+#include "usdt_note_defs.h"
+
+#ifdef __aarch64__
+# define _DT_FN_MOD
+# define _DT_FN_CONSTRAINT	S
+#else
+# define _DT_FN_MOD		p
+# define _DT_FN_CONSTRAINT	s
+#endif
+
+#ifndef _DT_ARG_CONSTRAINT
+# define _DT_ARG_CONSTRAINT	nor
+#endif
+
+#define __dt_s(...)		# __VA_ARGS__
+#define _dt_s(...)		__dt_s(__VA_ARGS__)
+
+#define _DT_ASM(...)		__dt_s(__VA_ARGS__) "\n"
+
+/* XXX */
+#define _DT_INTTYPE(expr) \
+  __typeof( \
+    __builtin_choose_expr( \
+      ((__builtin_classify_type(expr) + 3) & -4) == 4, (expr), 0UL \
+    ) \
+  )
+#define _DT_SIGNED(expr) \
+  ((_DT_INTTYPE(expr))-1 < (_DT_INTTYPE(expr))0)
+#define _DT_ARRAY(expr) \
+  (__builtin_classify_type(expr) == 5 || __builtin_classify_type(expr) == 14)
+#define _DT_SIZEOF(expr) \
+  (_DT_ARRAY(expr) ? sizeof(void *) : sizeof(expr))
+#define _DT_TCLASS(expr) \
+  (__builtin_classify_type(expr) & 0x7f)
+
+#define _DT_ARGSST(arg) \
+  ( \
+    (_DT_SIGNED(arg) ? -1 : 1) * \
+    (((int)(_DT_SIZEOF(arg) << 8)) + ((int)_DT_TCLASS(arg))) \
+  )
+
+/*
+ * Assembler macros to construct the sign/size/type prefix for arguments:
+ *   - '-' if the argument is signed (omitted for unsigned)
+ *   - Then the size follows (in bytes)
+ *   - Then 'f' if the argument is floating point (omitted if not)
+ *   - Then '@'
+ *
+ * This prefix is derived from the value calculated using the _DT_ARGSST(arg)
+ * macro defined above.
+ */
+#define _DT_ASM_DEFINE_MACROS \
+  _DT_ASM(.altmacro) \
+  _DT_ASM(.macro _SST x y z) \
+  _DT_ASM(.iflt \\x) \
+  _DT_ASM(.ascii "-") \
+  _DT_ASM(.endif) \
+  _DT_ASM(.ascii "\y") \
+  _DT_ASM(.ifc 8,\\z) \
+  _DT_ASM(.ascii "f") \
+  _DT_ASM(.endif) \
+  _DT_ASM(.ascii "@") \
+  _DT_ASM(.endm) \
+  _DT_ASM(.macro SST x) \
+  _DT_ASM(_SST \\x, %%(-(\\x*((\\x>0)-(\\x<0)))>>8), %%((\\x))&(0xff)) \
+  _DT_ASM(.endm)
+
+#define _DT_ASM_UNDEF_MACROS \
+  _DT_ASM(.purgem SST) \
+  _DT_ASM(.purgem _SST)
+
+#define _DT_SEP_NONE
+#define _DT_SEP_COMMA	,
+
+#define _DT_ARG_TYPE(n, arg)	unsigned long
+
+#define _DT_ASM_ARGDATA(n, arg) \
+  _DT_ASM(   SST %c[SST##n]) \
+  _DT_ASM(   .ascii _dt_s(%[VAL##n]))
+
+#define _DT_ASM_ARGDEF(n, arg) \
+  [SST##n] "n" (_DT_ARGSST(arg)), \
+  [VAL##n] _dt_s(_DT_ARG_CONSTRAINT) (arg),
+
+#define _DT_ASM_OUT_1(n, arg)
+#define _DT_ASM_OUT_2(n, arg)	"+m" (*arg)
+
+#define _DT_CLOBBER_1	"memory"
+#define _DT_CLOBBER_2
+
+#define _USDT_PROBE__(prv, prb, typ, ...) \
+  do { \
+    extern void __usdt##typ##_##prv##___##prb(__DT_APPLY_DEFAULT(_DT_ARG_TYPE, void, ## __VA_ARGS__)); \
+    __asm__ __volatile__ (\
+      _DT_ASM_DEFINE_MACROS \
+      _DT_ASM(0: nop) \
+      _DT_ASM(	 .pushsection _USDT_SECT_NAME,"?",@note) \
+      _DT_ASM(	 .balign 4) \
+      _DT_ASM(	 .4byte 2f-1f) \
+      _DT_ASM(	 .4byte 4f-3f) \
+      _DT_ASM(	 .4byte typ) \
+      _DT_ASM(1: .asciz _USDT_TP_NOTE_NAME) \
+      _DT_ASM(2: .balign 4) \
+      _DT_ASM(3: .8byte 0b) \
+      _DT_ASM(	 .8byte %_DT_FN_MOD[fn]) \
+      _DT_ASM(	 .asciz _dt_s(prv)) \
+      _DT_ASM(	 .asciz _dt_s(prb)) \
+      _DT_ASM(	 .byte __DT_NARGS(__VA_ARGS__)) \
+      __DT_APPLY_SEP(_DT_ASM_ARGDATA, _DT_ASM(   .ascii " "), ## __VA_ARGS__) \
+      _DT_ASM(	 .byte 0) \
+      _DT_ASM(4: .balign 4) \
+      _DT_ASM(	 .popsection) \
+      _DT_ASM_UNDEF_MACROS \
+      : __DT_APPLY(__DT_CAT(_DT_ASM_OUT_, typ), ## __VA_ARGS__) \
+      : __DT_APPLY(_DT_ASM_ARGDEF, ## __VA_ARGS__) \
+         [fn] _dt_s(_DT_FN_CONSTRAINT) (__func__) \
+      : __DT_CAT(_DT_CLOBBER_, typ) \
+    ); \
+  } while (0)
+
+#define _USDT_PROBE_(prv, prb, typ, ...) \
+		_USDT_PROBE__(prv, prb, typ, ## __VA_ARGS__)
+#define _USDT_PROBE(prv, prb, ...) \
+		_USDT_PROBE_(prv, prb, _USDT_TP_NOTE_TYPE, ## __VA_ARGS__)
+#define _USDT_PROBE_ENABLED(prv, prb, ...) \
+		_USDT_PROBE_(prv, prb, _USDT_EN_NOTE_TYPE, ## __VA_ARGS__)
+
+#endif /* _SYS_USDT_GENNOTE_H_ */
diff --git a/uts/common/sys/usdt_internal.h b/uts/common/sys/usdt_internal.h
new file mode 100644
index 00000000..cfdb8ea2
--- /dev/null
+++ b/uts/common/sys/usdt_internal.h
@@ -0,0 +1,245 @@
+/*
+ * Hide away all the terrible macro magic.
+ *
+ * Oracle Linux DTrace.
+ * Copyright (c) 2016, 2025, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+#ifndef _LINUX_SDT_INTERNAL_H_
+#define _LINUX_SDT_INTERNAL_H_
+
+/*
+ * This counts the number of args.
+ */
+#define __DT_NARGS_SEQ(dummy,_1,_2,_3,_4,_5,_6,_7,_8,_9,_10,_11,_12,_13,_14,_15,_16,_17,_18,_19,_20,_21,_22,_23,_24,_25,_26,_27,_28,_29,_30,_31,_32,_33,_34,_35,_36,N,...) N
+#define __DT_NARGS(...)						\
+	__DT_NARGS_SEQ(dummy, ##__VA_ARGS__, 36, 35, 34, 33, 32, 31, 30, 29, 28, 27, 26, 25, 24, 23, 22, 21, 20, 19, 18, 17, 16, 15, 14, 13, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1, 0)
+
+/*
+ * This will let macros expand before concatting them.
+ */
+#define __DT_PRIMITIVE_CAT(x, y) x ## y
+#define __DT_CAT(x, y) __DT_PRIMITIVE_CAT(x, y)
+
+#define __DT_COMMA ,
+#define __DT_NO_COMMA
+#define __DT_NONE(x)
+
+/*
+ * This will call two macros on each argument-pair passed in (the first two args
+ * are the names of the macros to call).  Its TYPE and NAME variants will throw
+ * away the name and type arguments, respectively. __DT_*_APPLY_NOCOMMA
+ * are like DTRACE_*_APPLY, but also omit the comma between arguments in the
+ * expansion of the macro.  DTRACE_TYPE_APPLY_DEFAULT lets you specify a default
+ * if no variadic args are provided.
+ */
+#define __DT_DOUBLE_APPLY(type_macro, arg_macro, ...)		\
+	__DT_CAT(__DT_DOUBLE_APPLY_,				\
+		     __DT_NARGS(__VA_ARGS__))(type_macro,		\
+						  arg_macro, __DT_COMMA, \
+						  __DT_COMMA, , ## __VA_ARGS__)
+#define __DT_DOUBLE_APPLY_NOCOMMA(type_macro, arg_macro, ...)		\
+	__DT_CAT(__DT_DOUBLE_APPLY_,				\
+		     __DT_NARGS(__VA_ARGS__))(type_macro,		\
+						  arg_macro, __DT_NO_COMMA, \
+						  __DT_NO_COMMA, , ## __VA_ARGS__)
+#define __DT_TYPE_APPLY(type_macro, ...)				\
+	__DT_CAT(__DT_DOUBLE_APPLY_,				\
+		     __DT_NARGS(__VA_ARGS__))(type_macro,		\
+						  __DT_NONE, __DT_NO_COMMA, \
+						  __DT_COMMA, , ## __VA_ARGS__)
+#define __DT_TYPE_APPLY_NOCOMMA(type_macro, ...)			\
+	__DT_CAT(__DT_DOUBLE_APPLY_,				\
+		     __DT_NARGS(__VA_ARGS__))(type_macro,		\
+						  __DT_NONE, __DT_NO_COMMA, \
+						  __DT_NO_COMMA, , ## __VA_ARGS__)
+#define __DT_TYPE_APPLY_DEFAULT(type_macro, def, ...)		\
+	__DT_CAT(__DT_DOUBLE_APPLY_,				\
+		     __DT_NARGS(__VA_ARGS__))(type_macro,		\
+						  __DT_NONE, __DT_NO_COMMA, \
+						  __DT_COMMA, def, ## __VA_ARGS__)
+#define __DT_ARG_APPLY(arg_macro, ...)				\
+	__DT_CAT(__DT_DOUBLE_APPLY_,				\
+		     __DT_NARGS(__VA_ARGS__))(__DT_NONE,	\
+						  arg_macro, __DT_NO_COMMA,	\
+						  __DT_COMMA, , ## __VA_ARGS__)
+#define __DT_DOUBLE_APPLY_0(t, a, comma_t, comma_a, def) def
+#define __DT_DOUBLE_APPLY_2(t, a, comma_t, comma_a, def, type1, arg1) \
+	t(type1) comma_t a(arg1)
+#define __DT_DOUBLE_APPLY_4(t, a, comma_t, comma_a, def, type1, arg1, type2, arg2) \
+	t(type1) comma_t a(arg1) comma_a t(type2) comma_t a(arg2)
+#define __DT_DOUBLE_APPLY_6(t, a, comma_t, comma_a, def, type1, arg1, type2, arg2, type3, arg3) \
+	t(type1) comma_t a(arg1) comma_a t(type2) comma_t a(arg2) comma_a \
+	t(type3) comma_t a(arg3)
+#define __DT_DOUBLE_APPLY_8(t, a, comma_t, comma_a, def, type1, arg1, type2, arg2, type3, arg3, type4, arg4) \
+	t(type1) comma_t a(arg1) comma_a t(type2) comma_t a(arg2) comma_a \
+	t(type3) comma_t a(arg3) comma_a t(type4) comma_t a(arg4)
+#define __DT_DOUBLE_APPLY_10(t, a, comma_t, comma_a, def, type1, arg1, type2, arg2, type3, arg3, type4, arg4, type5, arg5) \
+	t(type1) comma_t a(arg1) comma_a t(type2) comma_t a(arg2) comma_a \
+	t(type3) comma_t a(arg3) comma_a t(type4) comma_t a(arg4) comma_a \
+	t(type5) comma_t a(arg5)
+#define __DT_DOUBLE_APPLY_12(t, a, comma_t, comma_a, def, type1, arg1, type2, arg2, type3, arg3, type4, arg4, type5, arg5, type6, arg6) \
+	t(type1) comma_t a(arg1) comma_a t(type2) comma_t a(arg2) comma_a \
+	t(type3) comma_t a(arg3) comma_a t(type4) comma_t a(arg4) comma_a \
+	t(type5) comma_t a(arg5) comma_a t(type6) comma_t a(arg6)
+#define __DT_DOUBLE_APPLY_14(t, a, comma_t, comma_a, def, type1, arg1, type2, arg2, type3, arg3, type4, arg4, type5, arg5, type6, arg6, type7, arg7) \
+	t(type1) comma_t a(arg1) comma_a t(type2) comma_t a(arg2) comma_a \
+	t(type3) comma_t a(arg3) comma_a t(type4) comma_t a(arg4) comma_a \
+	t(type5) comma_t a(arg5) comma_a t(type6) comma_t a(arg6) comma_a \
+	t(type7) comma_t a(arg7)
+#define __DT_DOUBLE_APPLY_16(t, a, comma_t, comma_a, def, type1, arg1, type2, arg2, type3, arg3, type4, arg4, type5, arg5, type6, arg6, type7, arg7, type8, arg8) \
+	t(type1) comma_t a(arg1) comma_a t(type2) comma_t a(arg2) comma_a \
+	t(type3) comma_t a(arg3) comma_a t(type4) comma_t a(arg4) comma_a \
+	t(type5) comma_t a(arg5) comma_a t(type6) comma_t a(arg6) comma_a \
+	t(type7) comma_t a(arg7) comma_a t(type8) comma_t a(arg8)
+#define __DT_DOUBLE_APPLY_18(t, a, comma_t, comma_a, def, type1, arg1, type2, arg2, type3, arg3, type4, arg4, type5, arg5, type6, arg6, type7, arg7, type8, arg8, type9, arg9) \
+	t(type1) comma_t a(arg1) comma_a t(type2) comma_t a(arg2) comma_a \
+	t(type3) comma_t a(arg3) comma_a t(type4) comma_t a(arg4) comma_a \
+	t(type5) comma_t a(arg5) comma_a t(type6) comma_t a(arg6) comma_a \
+	t(type7) comma_t a(arg7) comma_a t(type8) comma_t a(arg8) comma_a \
+	t(type9) comma_t a(arg9)
+#define __DT_DOUBLE_APPLY_20(t, a, comma_t, comma_a, def, type1, arg1, type2, arg2, type3, arg3, type4, arg4, type5, arg5, type6, arg6, type7, arg7, type8, arg8, type9, arg9, typea, arga) \
+	t(type1) comma_t a(arg1) comma_a t(type2) comma_t a(arg2) comma_a \
+	t(type3) comma_t a(arg3) comma_a t(type4) comma_t a(arg4) comma_a \
+	t(type5) comma_t a(arg5) comma_a t(type6) comma_t a(arg6) comma_a \
+	t(type7) comma_t a(arg7) comma_a t(type8) comma_t a(arg8) comma_a \
+	t(type9) comma_t a(arg9) comma_a t(typea) comma_t a(arga)
+#define __DT_DOUBLE_APPLY_22(t, a, comma_t, comma_a, def, type1, arg1, type2, arg2, type3, arg3, type4, arg4, type5, arg5, type6, arg6, type7, arg7, type8, arg8, type9, arg9, typea, arga, typeb, argb) \
+	t(type1) comma_t a(arg1) comma_a t(type2) comma_t a(arg2) comma_a \
+	t(type3) comma_t a(arg3) comma_a t(type4) comma_t a(arg4) comma_a \
+	t(type5) comma_t a(arg5) comma_a t(type6) comma_t a(arg6) comma_a \
+	t(type7) comma_t a(arg7) comma_a t(type8) comma_t a(arg8) comma_a \
+	t(type9) comma_t a(arg9) comma_a t(typea) comma_t a(arga) comma_a \
+	t(typeb) comma_t a(argb)
+#define __DT_DOUBLE_APPLY_24(t, a, comma_t, comma_a, def, type1, arg1, type2, arg2, type3, arg3, type4, arg4, type5, arg5, type6, arg6, type7, arg7, type8, arg8, type9, arg9, typea, arga, typeb, argb, typec, argc) \
+	t(type1) comma_t a(arg1) comma_a t(type2) comma_t a(arg2) comma_a \
+	t(type3) comma_t a(arg3) comma_a t(type4) comma_t a(arg4) comma_a \
+	t(type5) comma_t a(arg5) comma_a t(type6) comma_t a(arg6) comma_a \
+	t(type7) comma_t a(arg7) comma_a t(type8) comma_t a(arg8) comma_a \
+	t(type9) comma_t a(arg9) comma_a t(typea) comma_t a(arga) comma_a \
+	t(typeb) comma_t a(argb) comma_a t(typec) comma_t a(argc)
+#define __DT_DOUBLE_APPLY_26(t, a, comma_t, comma_a, def, type1, arg1, type2, arg2, type3, arg3, type4, arg4, type5, arg5, type6, arg6, type7, arg7, type8, arg8, type9, arg9, typea, arga, typeb, argb, typec, argc, typed, argd) \
+	t(type1) comma_t a(arg1) comma_a t(type2) comma_t a(arg2) comma_a \
+	t(type3) comma_t a(arg3) comma_a t(type4) comma_t a(arg4) comma_a \
+	t(type5) comma_t a(arg5) comma_a t(type6) comma_t a(arg6) comma_a \
+	t(type7) comma_t a(arg7) comma_a t(type8) comma_t a(arg8) comma_a \
+	t(type9) comma_t a(arg9) comma_a t(typea) comma_t a(arga) comma_a \
+	t(typeb) comma_t a(argb) comma_a t(typec) comma_t a(argc) comma_a \
+	t(typed) comma_t a(argd)
+#define __DT_DOUBLE_APPLY_28(t, a, comma_t, comma_a, def, type1, arg1, type2, arg2, type3, arg3, type4, arg4, type5, arg5, type6, arg6, type7, arg7, type8, arg8, type9, arg9, typea, arga, typeb, argb, typec, argc, typed, argd, typee, arge) \
+	t(type1) comma_t a(arg1) comma_a t(type2) comma_t a(arg2) comma_a \
+	t(type3) comma_t a(arg3) comma_a t(type4) comma_t a(arg4) comma_a \
+	t(type5) comma_t a(arg5) comma_a t(type6) comma_t a(arg6) comma_a \
+	t(type7) comma_t a(arg7) comma_a t(type8) comma_t a(arg8) comma_a \
+	t(type9) comma_t a(arg9) comma_a t(typea) comma_t a(arga) comma_a \
+	t(typeb) comma_t a(argb) comma_a t(typec) comma_t a(argc) comma_a \
+	t(typed) comma_t a(argd) comma_a t(typee) comma_t a(arge)
+#define __DT_DOUBLE_APPLY_30(t, a, comma_t, comma_a, def, type1, arg1, type2, arg2, type3, arg3, type4, arg4, type5, arg5, type6, arg6, type7, arg7, type8, arg8, type9, arg9, typea, arga, typeb, argb, typec, argc, typed, argd, typee, arge, typef, argf) \
+	t(type1) comma_t a(arg1) comma_a t(type2) comma_t a(arg2) comma_a \
+	t(type3) comma_t a(arg3) comma_a t(type4) comma_t a(arg4) comma_a \
+	t(type5) comma_t a(arg5) comma_a t(type6) comma_t a(arg6) comma_a \
+	t(type7) comma_t a(arg7) comma_a t(type8) comma_t a(arg8) comma_a \
+	t(type9) comma_t a(arg9) comma_a t(typea) comma_t a(arga) comma_a \
+	t(typeb) comma_t a(argb) comma_a t(typec) comma_t a(argc) comma_a \
+	t(typed) comma_t a(argd) comma_a t(typee) comma_t a(arge) comma_a \
+	t(typef) comma_t a(argf)
+#define __DT_DOUBLE_APPLY_32(t, a, comma_t, comma_a, def, type1, arg1, type2, arg2, type3, arg3, type4, arg4, type5, arg5, type6, arg6, type7, arg7, type8, arg8, type9, arg9, typea, arga, typeb, argb, typec, argc, typed, argd, typee, arge, typef, argf, typeg, argg) \
+	t(type1) comma_t a(arg1) comma_a t(type2) comma_t a(arg2) comma_a \
+	t(type3) comma_t a(arg3) comma_a t(type4) comma_t a(arg4) comma_a \
+	t(type5) comma_t a(arg5) comma_a t(type6) comma_t a(arg6) comma_a \
+	t(type7) comma_t a(arg7) comma_a t(type8) comma_t a(arg8) comma_a \
+	t(type9) comma_t a(arg9) comma_a t(typea) comma_t a(arga) comma_a \
+	t(typeb) comma_t a(argb) comma_a t(typec) comma_t a(argc) comma_a \
+	t(typed) comma_t a(argd) comma_a t(typee) comma_t a(arge) comma_a \
+	t(typef) comma_t a(argf) comma_a t(typeg) comma_t a(argg)
+#define __DT_DOUBLE_APPLY_34(t, a, comma_t, comma_a, def, type1, arg1, type2, arg2, type3, arg3, type4, arg4, type5, arg5, type6, arg6, type7, arg7, type8, arg8, type9, arg9, typea, arga, typeb, argb, typec, argc, typed, argd, typee, arge, typef, argf, typeg, argg, typeh, argh) \
+	t(type1) comma_t a(arg1) comma_a t(type2) comma_t a(arg2) comma_a \
+	t(type3) comma_t a(arg3) comma_a t(type4) comma_t a(arg4) comma_a \
+	t(type5) comma_t a(arg5) comma_a t(type6) comma_t a(arg6) comma_a \
+	t(type7) comma_t a(arg7) comma_a t(type8) comma_t a(arg8) comma_a \
+	t(type9) comma_t a(arg9) comma_a t(typea) comma_t a(arga) comma_a \
+	t(typeb) comma_t a(argb) comma_a t(typec) comma_t a(argc) comma_a \
+	t(typed) comma_t a(argd) comma_a t(typee) comma_t a(arge) comma_a \
+	t(typef) comma_t a(argf) comma_a t(typeg) comma_t a(argg) comma_a \
+	t(typeh) comma_t a(argh)
+#define __DT_DOUBLE_APPLY_36(t, a, comma_t, comma_a, def, type1, arg1, type2, arg2, type3, arg3, type4, arg4, type5, arg5, type6, arg6, type7, arg7, type8, arg8, type9, arg9, typea, arga, typeb, argb, typec, argc, typed, argd, typee, arge, typef, argf, typeg, argg, typeh, argh, typei, argi) \
+	t(type1) comma_t a(arg1) comma_a t(type2) comma_t a(arg2) comma_a \
+	t(type3) comma_t a(arg3) comma_a t(type4) comma_t a(arg4) comma_a \
+	t(type5) comma_t a(arg5) comma_a t(type6) comma_t a(arg6) comma_a \
+	t(type7) comma_t a(arg7) comma_a t(type8) comma_t a(arg8) comma_a \
+	t(type9) comma_t a(arg9) comma_a t(typea) comma_t a(arga) comma_a \
+	t(typeb) comma_t a(argb) comma_a t(typec) comma_t a(argc) comma_a \
+	t(typed) comma_t a(argd) comma_a t(typee) comma_t a(arge) comma_a \
+	t(typef) comma_t a(argf) comma_a t(typeg) comma_t a(argg) comma_a \
+	t(typeh) comma_t a(argh) comma_a t(typei) comma_t a(argi)
+
+#define __DT_DOUBLE_APPLY_ERROR Error: type specified without arg.
+#define __DT_DOUBLE_APPLY_1 __DT_DOUBLE_APPLY_ERROR
+#define __DT_DOUBLE_APPLY_3 __DT_DOUBLE_APPLY_ERROR
+#define __DT_DOUBLE_APPLY_5 __DT_DOUBLE_APPLY_ERROR
+#define __DT_DOUBLE_APPLY_7 __DT_DOUBLE_APPLY_ERROR
+#define __DT_DOUBLE_APPLY_9 __DT_DOUBLE_APPLY_ERROR
+#define __DT_DOUBLE_APPLY_11 __DT_DOUBLE_APPLY_ERROR
+#define __DT_DOUBLE_APPLY_13 __DT_DOUBLE_APPLY_ERROR
+#define __DT_DOUBLE_APPLY_15 __DT_DOUBLE_APPLY_ERROR
+#define __DT_DOUBLE_APPLY_17 __DT_DOUBLE_APPLY_ERROR
+#define __DT_DOUBLE_APPLY_19 __DT_DOUBLE_APPLY_ERROR
+#define __DT_DOUBLE_APPLY_21 __DT_DOUBLE_APPLY_ERROR
+#define __DT_DOUBLE_APPLY_23 __DT_DOUBLE_APPLY_ERROR
+#define __DT_DOUBLE_APPLY_25 __DT_DOUBLE_APPLY_ERROR
+#define __DT_DOUBLE_APPLY_27 __DT_DOUBLE_APPLY_ERROR
+#define __DT_DOUBLE_APPLY_29 __DT_DOUBLE_APPLY_ERROR
+#define __DT_DOUBLE_APPLY_31 __DT_DOUBLE_APPLY_ERROR
+#define __DT_DOUBLE_APPLY_33 __DT_DOUBLE_APPLY_ERROR
+#define __DT_DOUBLE_APPLY_35 __DT_DOUBLE_APPLY_ERROR
+#define __DT_DOUBLE_APPLY_37 __DT_DOUBLE_APPLY_ERROR
+
+#define __DT_UINTPTR_EACH(x) uintptr_t
+
+#define __DT_UINTCAST_EACH(x) (uintptr_t)(x)
+#define __DT_TYPE_EACH(x) ".ascii \"" __stringify(x) ",\"\n"
+
+/*
+ * Convert everything to the appropriate integral type, unless too large to fit
+ * into any of them, in which case its address is taken instead.
+ */
+
+/*
+ * This will call macro(idx, arg, sep) for each argument passed in (idx is the
+ * index of the argument).
+ * Use __DT_APPLY(macro, ...) to generate a simple concatenation of the result
+ * of applying macro to each argument.
+ * Use __DT_APPLY_SEP(macro, sep, ...) to generate output with the result of
+ * applying macro to each argument separated by sep.
+ * Use __DT_PPLY_COMMA(macro, ...) to generate output with the result of
+ * applying maro to each argument separated by a comma.
+ */
+#define __DT_APPLY(macro, ...) __DT_CAT(__DT_APPLY_, __DT_NARGS(__VA_ARGS__))(macro, , , ## __VA_ARGS__)
+#define __DT_APPLY_SEP(macro, sep, ...) __DT_CAT(__DT_APPLY_, __DT_NARGS(__VA_ARGS__))(macro, sep, , ## __VA_ARGS__)
+#define __DT_APPLY_COMMA(macro, ...) __DT_CAT(__DT_APPLY_, __DT_NARGS(__VA_ARGS__))(macro, __DT_COMMA, , ## __VA_ARGS__)
+#define __DT_APPLY_SEP_DEFAULT(macro, sep, def, ...) __DT_CAT(__DT_APPLY_, __DT_NARGS(__VA_ARGS__))(macro, sep, def, ## __VA_ARGS__)
+#define __DT_APPLY_DEFAULT(macro, def, ...) __DT_CAT(__DT_APPLY_, __DT_NARGS(__VA_ARGS__))(macro, __DT_COMMA, def, ## __VA_ARGS__)
+
+#define __DT_APPLY_0(m, sep, def) def
+#define __DT_APPLY_1(m, sep, def, x1) m(1, x1)
+#define __DT_APPLY_2(m, sep, def, x1, x2) m(1, x1) sep m(2, x2)
+#define __DT_APPLY_3(m, sep, def, x1, x2, x3) m(1, x1) sep m(2, x2) sep m(3, x3)
+#define __DT_APPLY_4(m, sep, def, x1, x2, x3, x4) m(1, x1) sep m(2, x2) sep m(3, x3) sep m(4, x4)
+#define __DT_APPLY_5(m, sep, def, x1, x2, x3, x4, x5) m(1, x1) sep m(2, x2) sep m(3, x3) sep m(4, x4) sep m(5, x5)
+#define __DT_APPLY_6(m, sep, def, x1, x2, x3, x4, x5, x6) m(1, x1) sep m(2, x2) sep m(3, x3) sep m(4, x4) sep m(5, x5) sep m(6, x6)
+#define __DT_APPLY_7(m, sep, def, x1, x2, x3, x4, x5, x6, x7) m(1, x1) sep m(2, x2) sep m(3, x3) sep m(4, x4) sep m(5, x5) sep m(6, x6) sep m(7, x7)
+#define __DT_APPLY_8(m, sep, def, x1, x2, x3, x4, x5, x6, x7, x8) m(1, x1) sep m(2, x2) sep m(3, x3) sep m(4, x4) sep m(5, x5) sep m(6, x6) sep m(7, x7) sep m(8, x8)
+#define __DT_APPLY_9(m, sep, def, x1, x2, x3, x4, x5, x6, x7, x8, x9) m(1, x1) sep m(2, x2) sep m(3, x3) sep m(4, x4) sep m(5, x5) sep m(6, x6) sep m(7, x7) sep m(8, x8) sep m(9, x9)
+#define __DT_APPLY_10(m, sep, def, x1, x2, x3, x4, x5, x6, x7, x8, x9, x10) m(1, x1) sep m(2, x2) sep m(3, x3) sep m(4, x4) sep m(5, x5) sep m(6, x6) sep m(7, x7) sep m(8, x8) sep m(9, x9) sep m(10, x10)
+#define __DT_APPLY_11(m, sep, def, x1, x2, x3, x4, x5, x6, x7, x8, x9, x10, x11) m(1, x1) sep m(2, x2) sep m(3, x3) sep m(4, x4) sep m(5, x5) sep m(6, x6) sep m(7, x7) sep m(8, x8) sep m(9, x9) sep m(10, x10) sep m(11, x11)
+#define __DT_APPLY_12(m, sep, def, x1, x2, x3, x4, x5, x6, x7, x8, x9, x10, x11, x12) m(1, x1) sep m(2, x2) sep m(3, x3) sep m(4, x4) sep m(5, x5) sep m(6, x6) sep m(7, x7) sep m(8, x8) sep m(9, x9) sep m(10, x10) sep m(11, x11) sep m(12, x12)
+#define __DT_APPLY_13(m, sep, def, x1, x2, x3, x4, x5, x6, x7, x8, x9, x10, x11, x12, x13) m(1, x1) sep m(2, x2) sep m(3, x3) sep m(4, x4) sep m(5, x5) sep m(6, x6) sep m(7, x7) sep m(8, x8) sep m(9, x9) sep m(10, x10) sep m(11, x11) sep m(12, x12) sep m(13, x13)
+#define __DT_APPLY_14(m, sep, def, x1, x2, x3, x4, x5, x6, x7, x8, x9, x10, x11, x12, x13, x14) m(1, x1) sep m(2, x2) sep m(3, x3) sep m(4, x4) sep m(5, x5) sep m(6, x6) sep m(7, x7) sep m(8, x8) sep m(9, x9) sep m(10, x10) sep m(11, x11) sep m(12, x12) sep m(13, x13) sep m(14, x14)
+#define __DT_APPLY_15(m, sep, def, x1, x2, x3, x4, x5, x6, x7, x8, x9, x10, x11, x12, x13, x14, x15) m(1, x1) sep m(2, x2) sep m(3, x3) sep m(4, x4) sep m(5, x5) sep m(6, x6) sep m(7, x7) sep m(8, x8) sep m(9, x9) sep m(10, x10) sep m(11, x11) sep m(12, x12) sep m(13, x13) sep m(14, x14) sep m(15, x15)
+#define __DT_APPLY_16(m, sep, def, x1, x2, x3, x4, x5, x6, x7, x8, x9, x10, x11, x12, x13, x14, x15, x16) m(1, x1) sep m(2, x2) sep m(3, x3) sep m(4, x4) sep m(5, x5) sep m(6, x6) sep m(7, x7) sep m(8, x8) sep m(9, x9) sep m(10, x10) sep m(11, x11) sep m(12, x12) sep m(13, x13) sep m(14, x14) sep m(15, x15) sep m(16, x16)
+#define __DT_APPLY_17(m, sep, def, x1, x2, x3, x4, x5, x6, x7, x8, x9, x10, x11, x12, x13, x14, x15, x16, x17) m(1, x1) sep m(2, x2) sep m(3, x3) sep m(4, x4) sep m(5, x5) sep m(6, x6) sep m(7, x7) sep m(8, x8) sep m(9, x9) sep m(10, x10) sep m(11, x11) sep m(12, x12) sep m(13, x13) sep m(14, x14) sep m(15, x15) sep m(16, x16) sep m(17, x17)
+#define __DT_APPLY_18(m, sep, def, x1, x2, x3, x4, x5, x6, x7, x8, x9, x10, x11, x12, x13, x14, x15, x16, x17, x18) m(1, x1) sep m(2, x2) sep m(3, x3) sep m(4, x4) sep m(5, x5) sep m(6, x6) sep m(7, x7) sep m(8, x8) sep m(9, x9) sep m(10, x10) sep m(11, x11) sep m(12, x12) sep m(13, x13) sep m(14, x14) sep m(15, x15) sep m(16, x16) sep m(17, x17) sep m(18, x18)
+
+#endif	/* _LINUX_SDT_INTERNAL_H */
-- 
2.45.2

