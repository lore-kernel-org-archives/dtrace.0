Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 351AA1CA9E
	for <dtrace@lists.linux.dev>; Thu, 27 Jun 2024 05:35:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719466541; cv=fail; b=tkZM3on608u3RnwfNMietFrppeEhG3RCqIrOANA+icw0mtd4v4bbZoGaDoZ+2uozfh4TgXBhLG5qHPyqcCmMAHXjtPJf3+pPFMxbefFs9fAF+O8oMTtVfWx3lyqtReCLQbFI7wSA+ZGIt77IrJJLrrhczEmYIG2Ja5C+Mgnm9uc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719466541; c=relaxed/simple;
	bh=pbE7RJy1AqbZRqwrsioOTf/VeTS+fAJjMzZ+o16U03A=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=KgsWzzjFqmm/hQHCQhKLvIlMQaCp0Q8ysws5Z+6QC3+IFAHcF/1fLkZAghtO3i6O0wNdoOlHQ1SFgfXcNKeQ5IXOhG9eGJfBBhog+y1j5NPVGQ26s6TpqS3jvKuwGR+3jf7iP07fJJ+gWXCkC1zRi8kKd8inX6qK06f86cmpHIk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=HyAKIWLZ; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=iqumFwKI; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="HyAKIWLZ";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="iqumFwKI"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45QLMfS8013432
	for <dtrace@lists.linux.dev>; Thu, 27 Jun 2024 05:35:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:subject:date:message-id:in-reply-to:references
	:content-type:mime-version; s=corp-2023-11-20; bh=1kYcF4ZKcpQWed
	hBl+FHzVgDrl0LcpzWnuw18/1pZBI=; b=HyAKIWLZwBAGoFAjBjfUHmC4n+HYGa
	Qma9A6+XF+Sm1WLQ+ZpX7iN8vLh9hX8yAHkatvrPjhRq5V8Z3+W6mr8CxrzXIUOh
	RhlyvZlxo9Lh8qz2cwjgIQ0VPdcwNjJ1aSGSGfWJYlXjI6khvvjhgkzMPzTadd+e
	z9l/F0GVu4QA4bcEOeY5kQVQ5L52sznKiYEQNgMsrVChMX8Fadr4kO5GTmMuzlDn
	f6Ao3QiaGFblaKxa/Adq+yPjVkQfvD8lYSzoD36SyY8+/z18Yuf59ginR/gPI5vR
	VrfPD2fCRVND2s1A7rmerD5xrbIjN+dRoxfBp5ZpV3Uty628LWfn5oAg==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3ywpg9cqm3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 27 Jun 2024 05:35:39 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 45R5Us1U017823
	for <dtrace@lists.linux.dev>; Thu, 27 Jun 2024 05:35:38 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2049.outbound.protection.outlook.com [104.47.66.49])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3ywn29v78a-4
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 27 Jun 2024 05:35:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IFmu2i4K+Uf4KisXXVfx1TpHcss1XJZC2kWpZOdQw1jQqdBgtob5M7rxlCDgl0I9aRwtZGQSW1CKU2QbuaY+xNa7DIe45GvktErzYFgnaJIA7N9M3URQotU3sxgqvNULEf+ChexM4na6TZoqbEpvs6ae4QmtiKsryWA5MfLTaTEB/zgT9XF/8Dytx6EQ1Ydex/Zxu61DLIDy22HGKNQDTwH2RKs84Y7dBvI59GCfTzQc4w/ULS+oMvkezoq9p6mY4Oq40vO7Hy9OdUiNf50TTrxf2URYsdXXG/ABWJMir2f/gMqr+0riHX035hcX/qT9LILKaLo9HLSHy3mZgofh7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1kYcF4ZKcpQWedhBl+FHzVgDrl0LcpzWnuw18/1pZBI=;
 b=nk7XvHSRqnau+cv/fs7VLZ90hzYLPZr+aGtDomss+FP5V+U2S/l9QO39yz8EiogZpr/8VnMfJNldX0A461Fh1if2IJhk64Ou4RyANl7xBC6ukAJnayGfd68ZNA9nJmmluJ54gtFEic4VHbpJDG+fHTtsQMDsFHYimnIGS/9YCeogic7JA5NJ1Ckzcb5muiTNhKhsgvzsdbex0vxylPPKVA11kjcZsewxppMnVYY2uWQABXVY5fLMfRQCOScJdhOsG1XgFNZXLHEjaxi1t/SBO1RFyZi31nJavHIjfZZ/PFZKL03Sd/4lvdzofIpoBugzU8GkDZHRNR87fmtjwXv7Tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1kYcF4ZKcpQWedhBl+FHzVgDrl0LcpzWnuw18/1pZBI=;
 b=iqumFwKIAQVPGk+GPLWOVcTKuf2OgWolijEN0rX6KpmzwUia6P+H0z4FoiN5n18sU6aK2isUEh+0R0WZcDwZq5ElRV9e7CBybUuu+biPWubBvVS2qOh7tQOr5AXAJc/rO5peSA5k1v4n6hv3rEG5KEZGnrTygm1rREeZbVjkBTw=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by DS0PR10MB7400.namprd10.prod.outlook.com (2603:10b6:8:138::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.32; Thu, 27 Jun
 2024 05:35:35 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%4]) with mapi id 15.20.7698.025; Thu, 27 Jun 2024
 05:35:35 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 14/38] Remove orphaned dtrace_hdl_t component dt_maxformat
Date: Thu, 27 Jun 2024 01:34:31 -0400
Message-Id: <20240627053455.21567-15-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20240627053455.21567-1-eugene.loh@oracle.com>
References: <20240627053455.21567-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0277.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::12) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|DS0PR10MB7400:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a2e7a4e-daf8-4644-92d2-08dc966af7a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?T8/voOFq7W19bL0Tnhs7z3QPVeSsW2OZ136flypTxyUU+ejAKriL70YRDkVT?=
 =?us-ascii?Q?w9y8y6Eh4N5Z+7lM06ZZIqcXYvhTp1Vv7B4mvoM72BYhUlAJOjA6oQa18RO4?=
 =?us-ascii?Q?IEqbgbgbPH2sd2c8MxX9qj+HzY63EHxziLaYKMl/tzCVTJC2Elx15nlN+s0R?=
 =?us-ascii?Q?vBLptpMeGiLgFuj/N327tDjHaJmW3gTpz3oQP6Cm5xjBykWIdXHANyUx4PK8?=
 =?us-ascii?Q?H6Sz+FDcViLzw3hY2GZysMUrgAw7UxProJV1oFq2jbX+Vt8Jr/jHJRyrSLWM?=
 =?us-ascii?Q?jmTqDn6RFc5qr8Ru/ICRgex8DvzJrv/4F9x1kgy1cKnjgmHpO0aNpR8+jqIr?=
 =?us-ascii?Q?6Kr7B5aYe6dspRmwJvneoYaPQmzEZ1gWijeIYX7whudvH3UWrN1trOSOTpj7?=
 =?us-ascii?Q?iHT+zntGwlH+9auA4H0Uwez33ZOi6C/0IkEthIP4Eurrl0JzEKf2rVLsiT8h?=
 =?us-ascii?Q?OCZsisJ4LJJxOq4ZiXgkmsg6E+M7+scqdU+7pApu+3ytxN6l1IoeljkDgEoB?=
 =?us-ascii?Q?85P3Y8gnumzqoSNFhS6aRkHctJ5ClvOfHNwaKshM1DZ3w7UmD2A+gL+Tud0V?=
 =?us-ascii?Q?7K8fI5WpHC+SWpXH9Jf4I+JzPLCdt+TU5Z21AXCUK0i6Ar7Wof+ZJ9VNTFHR?=
 =?us-ascii?Q?5rfS3lSBpvY6d21IaKFifVux2ETWbnn11e2uS3xPqbnaa+ZSH/8K5BELzRZg?=
 =?us-ascii?Q?JcDRaqSbxjT2Vv345hYk4JqldGDHrRf9F45+SQG5XtH+pE7+mBv/K0Gqcm+T?=
 =?us-ascii?Q?fOaUExOqasP61cvJ3ZKZmbWlM7zie+MvW+I4K7aBpoNt/hdSt9ouzdgZE9RM?=
 =?us-ascii?Q?2Cm7FxMC+vpRXk6MD+Tf4m4PcvAbve30+ImOxts5BHRMYZah+DTeLlB/FQHC?=
 =?us-ascii?Q?lUR9A8i6rKsSORwhwneEUwBiDjZIaZL94usr6FXIfZik17ymVFPBtsjdFlaV?=
 =?us-ascii?Q?dqUw6N57igr0fZoRUs9e/uFEXjHrjpLJzkFfv0HsfpgrWu1VjU4A059WyCI9?=
 =?us-ascii?Q?+DfJblLx3M+0WXftp3smZePE5Y9j+VBcKYM+HPXuy4tRF5bTLWtUzLdEcgzk?=
 =?us-ascii?Q?JRScRj1Nw1SRT8LNFWZhIaLzAySZa13s3VsWVXbO5PnzJlNlyGDtV/seIk7d?=
 =?us-ascii?Q?iI+Tb38/vo49ctT7ZqZdk41zL6QXPvPYt4LNc0BnbdAU5IKAnv4ppogLesfE?=
 =?us-ascii?Q?8PiWJa9dT6pNcj2ygYKi4CO1qwYo39Y+DRPoYJkdTERhR/5VbYvDhh4sCAAQ?=
 =?us-ascii?Q?qHPs280JOiocMMxEDcfRCBgz947/vMuiGBlmmzdL2uuSwxDC4jUXAvRAo5HR?=
 =?us-ascii?Q?Y9NHXO8R60I33rCoDiG/HsI0jMkSKj3BffIVNgi9No135A=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?8behN/G+vo0Tdnksn04xqx2z0kCV3PP0mo04TvvoW7dk+bvjnTKKDgSQ10PB?=
 =?us-ascii?Q?ovLU6tQzF2TL/DeAktnHqkRXxjjLE5wRQVnXV8rKJyKiFBDLSTocRfVWZeKM?=
 =?us-ascii?Q?JEiHP31RIFGod2sEe6NNWGDBlD7YIyg0IJDwNrrH3r8/PHQmqeqKLGTpSy4f?=
 =?us-ascii?Q?5Ulyq1oZ68ix6wCndsTRoaKm+MuYGKd6CC3vpoh6x7q5VSeJGZaol/pJE3YW?=
 =?us-ascii?Q?i4u1/Yw4hJ8eunzkPkRV7fenOgJFkrQep+q1HUQKL6+qKiYkkPj5HB/1avom?=
 =?us-ascii?Q?i+8yDZpv4iYi2Pf99tsrI1WEBNigzP7mMCnePha4E7iNtgKivJIxsO//xZIF?=
 =?us-ascii?Q?ZAbPJ2cfJ5K3NfIHD596UBC5UpUf49jlw7mq2hwUpjAuNYALgeN/nj+UcKm1?=
 =?us-ascii?Q?nIV4CTzCjfGHZ6f9tElmd2Ngb0QfD3zmzgW2mJoe3Qpn5IdRjZp9GQafCA2U?=
 =?us-ascii?Q?8ngeUFsQ/iFUr+JqHJf5L3/0EzRgKfhFIsbnjKmRx7t04iDqlai2FM3prJ96?=
 =?us-ascii?Q?ZtRk8irqjCRHBnc3uVX0ttJCs9nFqXzBdkpDCF+h63iBqUBZ3wsOoE9yHbXD?=
 =?us-ascii?Q?+eKm5RRF9th9GkscvVVWbktB6t+IH/wqZMQqL+xSzIJkUtlp6GYRpRRLryDV?=
 =?us-ascii?Q?BNiekPxd/fqnd4x7cSOEx+kxvpw7mLZyZ47BibYM/A1DwtChqI4L6nOy6pZs?=
 =?us-ascii?Q?yWaGxFacFYTBiyh6uIjfsHflzGQR+1GV+he2rn5pi4gPUd+NEq93+v+VlJDk?=
 =?us-ascii?Q?VHTPy/stJdp5WlzKohoYZWuHMTeOz4cbLZoGPTKjXrdJ5qfqa/Ndw0lS19rH?=
 =?us-ascii?Q?KAtkY/HSA1YZs6geJiNkHJW9pcdzsyPoGJEHgc1TtjiBpfj6KLvuQKh+4+NW?=
 =?us-ascii?Q?sWXNrW3ip/fNQ1VlSxAzAWWpOzr/F0O61GhUShnz6vI63KfRyoeZF+6Bp10+?=
 =?us-ascii?Q?kq2AXQ/dS9JK7aNowzSFDCpJpfkL/vcCAWbSsbre9kDKWT2OSbgxCDW3Qkpy?=
 =?us-ascii?Q?KCSm/qq4mfUmlqMP6js0fVst0aqg6pcCYnMibBtfDsp+Npevq5WctGwxjUED?=
 =?us-ascii?Q?pvVIStiCpHrvH+EYD3Z/T3Jw4ZHWwgv8Mj/h0ThHpWuKEUO2OKoJymPl6kf9?=
 =?us-ascii?Q?Diz2xk8ESCUG3GY9AmwSX2NlzYYBXdUC6iFLAWQ396t8KXxHZchq21k63rW9?=
 =?us-ascii?Q?bOhG8LPA6lZL70IB4MBdG6sPI9AhlFVSZiSFaKKbGJQvKn8YJGoE44+NvpQG?=
 =?us-ascii?Q?UD/9Oz1+eb8yma3PPLsNbq0vEBkpP4qnHNs1Je/6zkNytFugLL9a136ULm0b?=
 =?us-ascii?Q?zYuYEnZ6FyUkMQJpT5jkhSdPbUhP05sxssJQ7Oj+YWyVhVdY9J/XYsnXzG5V?=
 =?us-ascii?Q?XN9tX/xx7HgZWHpdm3E3giPvXHiLdCA3zCWV01GLsEC/qHXlPedn8PV0lKBF?=
 =?us-ascii?Q?gbjq6Uxy/BNRxnS9DkjkLRwJdf4gD04qLbaCFqfZgC+pjmQgwqThr8zpV94f?=
 =?us-ascii?Q?MxBuJHENKRwuV+fvCjJ8fzA1lMNQ+Xudhfi9xpVCLjcX30qZLeYQNriB4QIA?=
 =?us-ascii?Q?+tuvxI2mi0KF+QfzgRYFBGOWbJ7YeuK9KJIYaNgS?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	sthAyeUznfgJLpdvsXAu9rm5GfpQSVyc3NYirWGUfpGnboHHm2Pn/G0aX49T7fsIaT/jOjr7t8nP2V8ZyA07AAD+ybzD8W8eV+ECmAD4GpPXR5fppgd9Kf7ihdRFA7x0wlkBKu9gz+UuF5y1vEJzgUFyzlGGNca9kguGNiSDJftGhZjkUybuYhxBONPeEBuxgZlgLa8OVINXrf2q0i9TMk43AauP0c+RiomznCUzygi70X3y1yTiDV3mLBgQn2Sh0jKCRL2SbFggoPIY9Oe25lUw3mWDd2dNGNbWh5oFKXKxud/54oGUcY/mCNyb6y/aE8+b3ykL8Ygc1KI4rGb7S9eBBffmScBZmwEo4UG8jhTrgku0da1FOrIEyUrVvRDgkIQK/mA46/LmOrBc/PKUviHCOxeuzAvjH58dl9rkIFWdqx7unNCrNOAHuILjuJcMsCNs4HZJg6LlxQf+2r6dEvMmmeEs6JhqncxnzEidw85WV6MkPZk+aTOqPQ0Bh7aVdO+OUZ8mtGyb3dpJedu9AN2sFd1AcR1KBsG5kFPDe1cIvxGiWSV2Mab7lVtRDE5RjmcxQtwM3oZsejX2lV1Iote7h/vlnmrkq6E8LvCBE2I=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a2e7a4e-daf8-4644-92d2-08dc966af7a1
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2024 05:35:34.6357
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: we5FG+/IQdnf0XtUL6Y0D/2OtIlEAKdDLhVce4BHm5WJZdIWtSp23ynjZODpAnUqABcsoDR/BzceZj6uyTqQUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7400
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-27_02,2024-06-25_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 malwarescore=0 adultscore=0
 phishscore=0 bulkscore=0 mlxlogscore=999 suspectscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2406180000
 definitions=main-2406270040
X-Proofpoint-ORIG-GUID: ivey47FlRbzDgx8C3vMLawxOiM25bB7C
X-Proofpoint-GUID: ivey47FlRbzDgx8C3vMLawxOiM25bB7C

From: Eugene Loh <eugene.loh@oracle.com>

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 libdtrace/dt_impl.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/libdtrace/dt_impl.h b/libdtrace/dt_impl.h
index b5408c1c..3d3f58d5 100644
--- a/libdtrace/dt_impl.h
+++ b/libdtrace/dt_impl.h
@@ -368,7 +368,6 @@ struct dtrace_hdl {
 	dtrace_probedesc_t **dt_pdesc; /* probe descriptions for enabled prbs */
 	size_t dt_maxagg;	/* max aggregation ID */
 	dtrace_aggdesc_t **dt_adesc; /* aggregation descriptions */
-	int dt_maxformat;	/* max format ID */
 	dt_aggregate_t dt_aggregate; /* aggregate */
 	struct dt_pebset *dt_pebset; /* perf event buffers set */
 	struct dt_pfdict *dt_pfdict; /* dictionary of printf conversions */
-- 
2.18.4

