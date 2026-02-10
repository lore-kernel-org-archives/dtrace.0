Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3399A329E5A
	for <dtrace@lists.linux.dev>; Tue, 10 Feb 2026 20:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770757160; cv=fail; b=ltvvzC0kPHQZ0z9gCMM43MJYY73uI6ioh4+LG2tEIgArmLj8ok0uuGiQOT5t7uA7j/YXd2d8f9quIcwrNzLzncPsc0tI3GFzBZZkB9dGpcCNMVQH1HWDekDCA5JfVqAYl3rd3dtJTt0G/Ct20b+OAHRS8Cvz4dYlmhlIUdvWOac=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770757160; c=relaxed/simple;
	bh=exOVUw43ancs/FQSM2aHRLS23Wg48DXnat1w6cjr5a8=;
	h=Date:From:To:Subject:Content-Type:Message-ID:MIME-Version; b=IE6u3RVhbs+5e2K8xNt+40YBvYDXxZ2kz13P0bmuXtCF0tDaF45T0s1eiRifDe4hcvbF4pkXgQF2ZFU2WuyhR7baJxKhI5p45utOQVeAgHDGW2hSzybUusakhoUYqGr+iReqb4OKFVPs4h+9Yt9TPeesgAjO4wi9gvvb2xJv80Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=HEEl8Y3Y; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=LjGo9lBH; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="HEEl8Y3Y";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="LjGo9lBH"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61AJBt5O3921971
	for <dtrace@lists.linux.dev>; Tue, 10 Feb 2026 20:59:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=bpoxOrKSmjjfPAk8oSLpbGQjCS+8/XvvOIaDgtmSFB4=; b=
	HEEl8Y3YxAcWKQSkB+K8pXZnJd44bI4hrONd1ZCcsHU8UsHiEqFurvA4f7dMkuVJ
	F4PP397b4pM3E0QxEd64pqq78Gr/HH9VS+wGoTPAseEXppnrTs5rOFlZEYMW6qZR
	yAK3HYjhms1aiFGAZDsLY5Gh7iCsAabJO4im74aTGLOGML5ULOe8alB6E/n/ct3O
	bJ5wCpuFS1Wqdjh4/TTnbmpyHCiUgqu7t2+g3fsWYFT49Tuo6J98vjP5AlgKmUFL
	juKXU6V0g44pPDmEfK2TG+Rvy1i0bX3/6ys17wsT4i9GOCWoxl+A1rNxRfC78B8X
	UCUN2ySqgKfPrh0L+dqr2A==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4c7rxu1v10-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 10 Feb 2026 20:59:16 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 61AKDk1U008681
	for <dtrace@lists.linux.dev>; Tue, 10 Feb 2026 20:59:16 GMT
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11010071.outbound.protection.outlook.com [40.93.198.71])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4c8234v3ty-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 10 Feb 2026 20:59:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s34U70IfQyjS+AXKw0bCYs0iq9PVLvfn8qHul1R94pk18lKZwsoWKIwmYAwBKr+4uyPbuESCyjuOX2Q4NtDjlaIb7Q4L0O1WBzzTzppPp/HcoizafbimfCIXJotLsYPQBzKZnIYLpSWTX124+OU1kWSIXOLHbf934/0ew7A52GJ+H7lwdR6KhQr8n1ZF7yOwtayat+eTwy/dOa/oY2TY6DVsg6WAbr++mKLXydPgj4NuzuYkOCZpLf9tfZV0rCqC8FIopT3uLWJAL2D9oomKpTIc4N3EZ+oCVI9UfQHVZ8SWl26Pn9t6DFxiCEf73yll2snZNOj1rXBT0Cp8J87iBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bpoxOrKSmjjfPAk8oSLpbGQjCS+8/XvvOIaDgtmSFB4=;
 b=WCAjHpKqA8NlUwWgtAvLCwLWvY34CGvy6A7wsdaML0qyT4+03XIYURVFV18Y/0mFwa2ZZFYqQ7oVi1CdmH/jfNy4IkyX1sBVKhOauIXhBSh1RubNO/zk6xWuJhKq2SH1NH+7+zow64LCmztr7dTn2Pz5lCgHaI2fU5gYyVntRMQlVfzFaA+cxCzK8LW8PmeKA+DSMcMGaovvMF9Z+q1qAnYrfHDtDvfzXaIPPDUS9MSkzmHu8MthiUpHDbMVnyuJex5rZYEU7Pwh9tPL7aYzJqZwEVbKshUiM4J4owor3EX8gSWhXMgunrEVCcvz/XZ9sEQ+geSuUdZJcwmjuBhDhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bpoxOrKSmjjfPAk8oSLpbGQjCS+8/XvvOIaDgtmSFB4=;
 b=LjGo9lBHF8EXPYfrXzrEqL/2g4lCkNYp8LV0uDYQ2RWR1qOFSuuyBgZ2jXUMDuhWYR9p/CMNvuQe6nU6fIT/43f9+wq7AaL6TEsHw1+zVCujw3JrtXFBK2yHb+TGSgs5+/oGtuBEjW6Om0sltpAlU5zxDsYjokU54scSIxzIFNg=
Received: from DS0PR10MB7522.namprd10.prod.outlook.com (2603:10b6:8:15e::16)
 by LV8PR10MB7773.namprd10.prod.outlook.com (2603:10b6:408:1e6::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.20; Tue, 10 Feb
 2026 20:59:07 +0000
Received: from DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a]) by DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a%6]) with mapi id 15.20.9587.017; Tue, 10 Feb 2026
 20:59:07 +0000
Date: Tue, 10 Feb 2026 15:59:06 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v4] Add packaging configuration for Debian
Content-Type: text/plain
X-ClientProxiedBy: BLAPR05CA0019.namprd05.prod.outlook.com
 (2603:10b6:208:36e::24) To DS0PR10MB7522.namprd10.prod.outlook.com
 (2603:10b6:8:15e::16)
Message-ID:
 <DS0PR10MB752255507DE8C6B11F027AF4C262A@DS0PR10MB7522.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB7522:EE_|LV8PR10MB7773:EE_
X-MS-Office365-Filtering-Correlation-Id: c4acbb02-3760-4af9-bb4a-08de68e73b1d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?kl02gql5FOJQJm4tc5crVGOG0cIzlhIWI9L+562kcBy2v0eNxlk6BFoYpzP8?=
 =?us-ascii?Q?9MVGqt68sseWFdJTFMHygeNuT4MkZGO4jsXfR0q9lioWsCuSM3kYINtYRc5I?=
 =?us-ascii?Q?qkYnUAMizVKO7qlQCHEvcFnz95YrTRAzcJH5BoitzpZ7MbM8nYTCVd6btLk8?=
 =?us-ascii?Q?vpUjMW7Y2qyPKmYixiAjDsvSy+ZeGe/7mst4/jy8iNKxPNTKUjWtmm26RBGD?=
 =?us-ascii?Q?QocARD5xPcgzsp5utH1SSD61DSVoq3lhx3vfkwDB8dy6gMwfaBophem0etyg?=
 =?us-ascii?Q?QttoifIehcsza+fCTNeYV3HFBvFgCor5o94Kqz5NyjgmM4Br23/tEi7WTiCj?=
 =?us-ascii?Q?IpQqOtAxJl3WNZVzFUMAMuzChOYYch33xi7INk6pU39ToA8eEGWQhgIyb6va?=
 =?us-ascii?Q?0wuTzuNxA8CJQ2+E5ag4r0fxAf4khHc632LGxAyd2gowqAbwIZ780OqT3AG0?=
 =?us-ascii?Q?RqAZxIMXeNXhAfd8dRfgHrO9eVY3aD3LPzqRc47Dh1Lhc76sxqenxb5fEJzp?=
 =?us-ascii?Q?tbZVgrMMs0T7C8xDNotK9rlUPx8pkVcs0NnUrQ/9RovgWW+CcPDWvWCuuyYy?=
 =?us-ascii?Q?A+5h9vClR7+PFgLRrtdvB1CnGrYPJ9FCPqzqiejk4ix2t3e6GeuMU3Su7eOe?=
 =?us-ascii?Q?Om2xz3JLZfz43/l3O63PuKWho6VtT5vvJTzc/U4Kkff2qjfFgCENYnmDdeoI?=
 =?us-ascii?Q?UVWxwX3M5cUaWwBziFRuv1nmdD37T8WGe8OL1bI+iG7yv7/b5weidhiKdsNI?=
 =?us-ascii?Q?HdUUIWtSMhaTIXu6R+0F6iqJrEmkOmqoZ/Wgnd/0GcAUhMS6VazFgntIKjSv?=
 =?us-ascii?Q?uPPgHLIhwsabYGojNTqA2YswJY+a2oTUbReGM0lQfIKxKUiUMIC8R/Q5mtdR?=
 =?us-ascii?Q?+dFOmsJgY+SO8JNIlZKRBplvNsxBQUvSKlRe2yKgm37T7lxzXmKRQk7zmor+?=
 =?us-ascii?Q?Ri/UdTi0ZUEVLGcOKSN1dT5Ds3R2CsNeEzmNiSwpBYBMgsPu+a6Z2hePu4S9?=
 =?us-ascii?Q?BnZLgh0sp17y85gASPOX2PPygh0mgmkXhHfUvn7MkavOGWwGXzHfm2unjR0g?=
 =?us-ascii?Q?wVTqlh6plCWfhnYbi61xbQad9F/6p8WuWdmhLRS39Ky7UdW47L5t9UN7KdH0?=
 =?us-ascii?Q?73dr0JwPJWB5+KK3rOHLjUfqdU2jLbLuHQz2lmO8TD1Lc6Ht0hPQP9y7+DoF?=
 =?us-ascii?Q?SXIFn137WxUx9zPyN0dvFI76sKwj2c8Xx7Izcad1bGuUV2K+DrimGzObPKT1?=
 =?us-ascii?Q?Kh2pUKuaei0aVZmplfI5ecnvAfTd8GoKCDrboTj+YZBZk5cCKiTr5AMnIGIo?=
 =?us-ascii?Q?PjT0VvDm2dQildq8UEW0j254722fZXBQ+AB7TtnM9wojTaHc3iNLFhlzYllA?=
 =?us-ascii?Q?/qW1ewrHu11NaD2+aMXXNK61qdgKK6tsHGwQfIqoKr6puWw37WvoRrfjdQ+v?=
 =?us-ascii?Q?KrxobRD3FZJanQezuXjnSFiwooFzffJh3G/VNYV0NjlV4GE7Js4rAkXIVTQH?=
 =?us-ascii?Q?P1A2HEq9ul3zVI8baBA+Ci8xT3X9GKl+9iEM?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB7522.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?2bzXNMpcPjT4bbcYv0YgZMdOdB6K/9+KmxDYOmY9RxtcDfoqe3mItDUEf4TN?=
 =?us-ascii?Q?Cy6mJBOwTCnABzEr8t8fU1Imci9xXe0oF6z5mFy9whY+ZNLOjg2+sm15AIxq?=
 =?us-ascii?Q?+zqkDFyxhip3hdkCXyx9VeTQXdCOT49gdYlcfKL6BZT2oP23Ljf49gqa5yhd?=
 =?us-ascii?Q?jr1Pt+I9SCuHhJdm1uGle2Aa7zp9C70cAyhIrslDrmwG4DA5XDZONTZt63LI?=
 =?us-ascii?Q?FFG8/gnnDgHWKSR8lcq2BlSXY/14ZMucG5/DCVVXcWG8lGPxHLGlGDGyb7Fm?=
 =?us-ascii?Q?Y92pTHwUpKIFUFnR8D4p0VQOcCrHFyITSKXzf0HK+WaT4sSBm013KCW/NgCP?=
 =?us-ascii?Q?kXj4x41A7Lmzu2V8zVKwo7Dj+B8bTyCGCLGBBULZP2i5Rtq6njGKbXQPr9jD?=
 =?us-ascii?Q?LDvR99Vsi4SaRbUNh/vEywkqqrFLUznmdeYnFHijTg2R/8V56m6U0KJndTdB?=
 =?us-ascii?Q?piRE1XBOXOs7yXSVCpAQF7tawx2uAFpUIoVAmaOChxoB307sbIv7g+psyALh?=
 =?us-ascii?Q?apcXoSaK0HPoff8RzUIwYVrWoYxQMLqSdWT1Rf39OSm3f7UmEYlokHb2IIOe?=
 =?us-ascii?Q?R89xV4/i0743qmGbxZubGu4pdzyV3/YzzVur7B5JBjnXaJbMjlg7xQOGpBii?=
 =?us-ascii?Q?UPNMd8KvCdBDJhZT5g7ZobD4XlgqIYXikL8HO1O8ghdwXXH2vowcuGPVbHna?=
 =?us-ascii?Q?C3V68wRR4hvucpQ99uKmqMoQYlNsMSJRyomGmYbtpO7ZdIIPBVfFqzEWplZW?=
 =?us-ascii?Q?1/7J09GkNVgFVOMjSpwbm0DHwIFztH77Odw9RgBMvNX19FAR6aYp/UYjfwtS?=
 =?us-ascii?Q?7xB1ZT0JTj1jCP4SL6SETqyytbqLSdzUbgR1mf2Eo7NMiQgshQ89qK8+T/6c?=
 =?us-ascii?Q?gphmqQ1/65mW7CfqsosSQOvCD8qyeuDOG94ReTQlpIgfl1itqTJYzummLFj9?=
 =?us-ascii?Q?rnlsbpoQmEjAI9CfgtL+EDzgtysJysoKQC9/npiBGbj0jtsYO4zA8eNktFZ6?=
 =?us-ascii?Q?MIcuXj8Ns/0UJ+pG5GZuHLC006x5Nj/p/HvV0ehjyoAwc+epFoMH3PQSl5/5?=
 =?us-ascii?Q?Q0SbmtUGQQWWBGOi2OFXtLznrPOOMpK9gWp7u9eCRDeev+8j8J5of6jdmixM?=
 =?us-ascii?Q?+wkPeWR7xc2w+Cqe9RliM42bq2i6M6B34hmLBdnr4DYrEmW6A0KjU44e9n/m?=
 =?us-ascii?Q?bVQtM7qCJmpHeOdJN6VokvoBA4fua3RRMfTOARfio6m9JGLCutKYQB9MXKqD?=
 =?us-ascii?Q?PFXudAR5sfBsIYBD2ozKG2cAU7/J5K6jQVEnwCUhDgCZZN2T42ww3PUC7KZA?=
 =?us-ascii?Q?C8SGD6lE0GDth7A14+mhSYrX4t8ISbPyZzf5rH71ll7DiktFR/QmLbPPTcu1?=
 =?us-ascii?Q?7U+fmcIzYSA1xry2HWQ7mmQg13ZOrdCE2kpYdihi0XHGpEDMZh61EXAPChuL?=
 =?us-ascii?Q?FhGgwbTUULFk25+vpilZnt4KcXD5HpCctQnzvX2GGFtrrVHDIdKq/LfBespW?=
 =?us-ascii?Q?gVROUyPGPLxkBXnTPSEbERpen4RDhrAfSlWatnTkMpcBuqenegA1bNu6ZTKl?=
 =?us-ascii?Q?Hg5X9TwrLeFgz6hR3Ti5mpWEvwbNZ+pQAsF8g75JfXhXkPQBSnjx+UzAz9H9?=
 =?us-ascii?Q?kCwdL1PSY3HmVpR2IYSOIBDoE7dnqvPPmwbAGDEL4hJMJr1uJxUOSXQ1jruF?=
 =?us-ascii?Q?q3ksLQplmvlym55kro0xRI6lMheFcVaMwk8dbMpZpQ+sWf9ujMsDSkOYD9a5?=
 =?us-ascii?Q?uWQuOR7VKm6jrRm0tFo4siSth/OAQMo=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Y8h9OAAgDGp1axeoR4YRR0NITcmllewDWl65eJKNpD0Pds5OVHPV+wNwZMAqLJt57R2ovzjXEKkNI1iRQs8Oa5v02liYlWj5z4KuZJHIMDB2fZLxobvFiTmIhhssBoJB1CJAECZyZwjHhtJ2IYXn7bS48E+qeeW8A+avgHbvNXdXb8LAv9PXRUjCp9DiPzBkcn0EBdDSQQH71i4hxWMknnDJ9pj/S4QH5oc1WZSn6IMHRINqlzN6YrYtgMrlZ6cn7KGPy1T/fc9Gf2TMJGHKMqCO1onLaG1wDxGb4hid14fg4dzIa0s8rsWdM6+HnplucCxHGNBL1aB4boMrwzJKQ59EkLzJh6FZbur51hXk7WmfVGv6bjNJmu/a90OkFpXBp0pEk2hnnZbEu1HwSe1WySGyqxIWXQSWN62G4RRkpTBzgXVbDkgG/B2PLxTkgB2Mu1EljpqQ9tviQ8iThYXX3ZqJMuVxzLKrp+dPlAmD5tPF3u2mHu/0JlNNXDJrQTBJROV2VKTvxNTXyscF1OZ77K9DPeak/9HfGz+UKbJnLLWg/vH45Z6wbqOROvH8YuR45LTY0pQ9zjVUvqwqSN9/jFU6F2QZZ9+rbuAfqp3SM5c=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4acbb02-3760-4af9-bb4a-08de68e73b1d
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB7522.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 20:59:07.4118
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yGBpZY4nETScTHAhJCyQYTta95bg6KMQQVEtnhxwp295nIKlQQ0yTorsPJdrZtmSKWQzXYCTUbGza/NEKn2UOSPjNo5nujaKrEJatjNBjDo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR10MB7773
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-10_03,2026-02-10_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxlogscore=999
 adultscore=0 bulkscore=0 suspectscore=0 malwarescore=0 phishscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2601150000 definitions=main-2602100174
X-Proofpoint-GUID: 41IppVNpY2slkjOGZQONWq5eBvsqvoJ3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEwMDE3NCBTYWx0ZWRfX+bbZGI5sVpQa
 J/GNTGr6E6U+CyxYN/XpLxmf0BlIoXTggXUji+BRCQdvEoKP3MypdpJDLRbL75FmLadD8Ff/BlT
 Pouate6F9vBJz6oE8uz0IjHUxblSIJlZYxl3Bgsk5uLWObnlPYoz/xcAFTcjpFmQbBZJtXI+Kvk
 3JRav3ZsB1EkolI4OfrLsOy636uywvA36a6hRmBJAYrcltwh2L9yM0zxSOJRlVqW1t4K5/a7Wda
 CPXfoVhoNvu4emdKItR905+2EM2OYAotjiUzfF+RuLOthqdP2HpvOTnOzZBcPXxu07+13tjKwKd
 AkJz1WxxgtS/FOY3akKp6Nc9xpDElyXO2j94+htcvVvKl9v3WjWXIBtb4JgC1/M4lkfJYt57aSo
 rNztoyh1hAcKTSZI2GV3GWdh9LxiW0QP26//gkJMPoHUSnUGJUmG8W6dvM43pkUgmtatLteHIWj
 DeNjq1i4DbDuzIr+Miw==
X-Proofpoint-ORIG-GUID: 41IppVNpY2slkjOGZQONWq5eBvsqvoJ3
X-Authority-Analysis: v=2.4 cv=Y6f1cxeN c=1 sm=1 tr=0 ts=698b9c25 cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=HzLeVaNsDn8A:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=yPCof4ZbAAAA:8 a=NEAV23lmAAAA:8 a=xNf9USuDAAAA:8
 a=Ixkok3qfAAAA:8 a=mDV3o1hIAAAA:8 a=I5J9bQijOuhHCpxPiRcA:9 a=3ZKOabzyN94A:10
 a=_4Lj5ymMnAn2NA9aJKr1:22

Packaging configuration files for Debian are provided in dists/debian.

Sample steps to build DEB packages:

 - make dist
 - cp dtrace-x.y.z.tar.bz2 $D/dtrace_x.y.z.orig.tar.bz2
 - cd $D
 - tar -jxpSf dtrace_x.y.z.orig.tar.bz2
 - cd dtrace-x.y.z
 - make prep-debian
 - debuild

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 dists/Build                                   |  16 ++
 dists/debian/control                          |  74 ++++++++
 dists/debian/copyright                        | 103 +++++++++++
 dists/debian/dtrace-tests.install             |   1 +
 dists/debian/dtrace-tests.lintian-overrides   |   8 +
 dists/debian/dtrace.docs                      |   1 +
 dists/debian/dtrace.install                   |   1 +
 dists/debian/dtrace.lintian-overrides         |   1 +
 dists/debian/dtrace.manpages                  |   1 +
 dists/debian/libdtrace2-dev.install           |   5 +
 dists/debian/libdtrace2.install               |  12 ++
 dists/debian/libdtrace2.lintian-overrides     |   4 +
 dists/debian/libdtrace2.manpages              |   1 +
 dists/debian/mkChangelog                      | 174 ++++++++++++++++++
 dists/debian/patches/debian-configure.patch   |  17 ++
 .../patches/debian-interpreter-paths.patch    | 107 +++++++++++
 dists/debian/patches/series                   |   3 +
 dists/debian/rules                            |  24 +++
 dists/debian/source/format                    |   1 +
 19 files changed, 554 insertions(+)
 create mode 100644 dists/Build
 create mode 100644 dists/debian/control
 create mode 100644 dists/debian/copyright
 create mode 100644 dists/debian/dtrace-tests.install
 create mode 100644 dists/debian/dtrace-tests.lintian-overrides
 create mode 100644 dists/debian/dtrace.docs
 create mode 100644 dists/debian/dtrace.install
 create mode 100644 dists/debian/dtrace.lintian-overrides
 create mode 100644 dists/debian/dtrace.manpages
 create mode 100644 dists/debian/libdtrace2-dev.install
 create mode 100644 dists/debian/libdtrace2.install
 create mode 100644 dists/debian/libdtrace2.lintian-overrides
 create mode 100644 dists/debian/libdtrace2.manpages
 create mode 100755 dists/debian/mkChangelog
 create mode 100644 dists/debian/patches/debian-configure.patch
 create mode 100644 dists/debian/patches/debian-interpreter-paths.patch
 create mode 100644 dists/debian/patches/series
 create mode 100755 dists/debian/rules
 create mode 100644 dists/debian/source/format

diff --git a/dists/Build b/dists/Build
new file mode 100644
index 00000000..c75f9332
--- /dev/null
+++ b/dists/Build
@@ -0,0 +1,16 @@
+#
+# Oracle Linux DTrace.
+# Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
+# Licensed under the Universal Permissive License v 1.0 as shown at
+# http://oss.oracle.com/licenses/upl.
+
+dists_DIR := $(current-dir)
+
+# Prepare package building on Debian (copy ./dists/debian in ./debian, and
+# generate the debian/changelog file.
+
+prep-debian::
+	$(call describe-target,DIST-PREP,Debian)
+	rm -rf debian
+	cp -rp $(dists_DIR)/debian .
+	debian/mkChangelog debian/control dtrace.spec > debian/changelog
diff --git a/dists/debian/control b/dists/debian/control
new file mode 100644
index 00000000..56687a82
--- /dev/null
+++ b/dists/debian/control
@@ -0,0 +1,74 @@
+Source: dtrace
+Section: utils
+Priority: optional
+Maintainer: Kris Van Hees <kris.van.hees@oracle.com>
+Build-Depends: debhelper-compat (= 13),
+ bison, flex, gawk, gcc-bpf, binutils-bpf, valgrind, binutils-dev, login.defs,
+ libbpf-dev, libc-dev (>= 2.34), libelf-dev, libfuse3-dev, libpcap-dev,
+ libpfm4-dev, libsystemd-dev, libz-dev
+Standards-Version: 4.5.1
+Homepage: https://github.com/oracle/dtrace-utils/
+Rules-Requires-Root: no
+
+Package: dtrace
+Architecture: any
+Depends: ${misc:Depends}, ${shlibs:Depends}
+Description: Dynamic tracing for Linux (DTrace)
+ This is the official Linux port of the advanced tracing tool DTrace.
+ .
+ DTrace is a high-level dynamic tracing tool for Linux, built on kernel
+ tracing features (tracepoints, function probes (fentry/fexit), dynamic
+ kernel probes (kprobes), dynamic userspace probes (uprobes), ... and
+ leveraging BPF as execution engine.  It features an integrated compiler
+ for its high-level tracing language and native support for interacting
+ with the BPF engine, significantly reducing runtime dependencies
+
+Package: libdtrace2
+Architecture: any
+Depends: ${misc:Depends}, ${shlibs:Depends},
+ fuse3, libctf0, libelf1t64, libfuse3-4, libpcap0.8t64, libpfm4, libz1
+Description: Dynamic tracing for Linux (DTrace) (library)
+ This is the official Linux port of the advanced tracing tool DTrace.
+ .
+ DTrace is a high-level dynamic tracing tool for Linux, built on kernel
+ tracing features (tracepoints, function probes (fentry/fexit), dynamic
+ kernel probes (kprobes), dynamic userspace probes (uprobes), ... and
+ leveraging BPF as execution engine.  It features an integrated compiler
+ for its high-level tracing language and native support for interacting
+ with the BPF engine, significantly reducing runtime dependencies
+ .
+ This package contains the shared library.
+
+Package: libdtrace2-dev
+Architecture: any
+Depends: ${misc:Depends},
+ libdtrace2 (= ${binary:Version})
+Description: Dynamic tracing for Linux (DTrace) (development)
+ This is the official Linux port of the advanced tracing tool DTrace.
+ .
+ DTrace is a high-level dynamic tracing tool for Linux, built on kernel
+ tracing features (tracepoints, function probes (fentry/fexit), dynamic
+ kernel probes (kprobes), dynamic userspace probes (uprobes), ... and
+ leveraging BPF as execution engine.  It features an integrated compiler
+ for its high-level tracing language and native support for interacting
+ with the BPF engine, significantly reducing runtime dependencies
+ .
+ This package contains the development files necessary to develop
+ alternative implementations of the user interface for libdtrace, i.e.
+ replacements for dtrace(1) itself.
+
+Package: dtrace-tests
+Architecture: any
+Depends: ${misc:Depends}, ${shlibs:Depends}, ${perl:Depends},
+ binutils, cpp, gawk, gcc, make, pkgconf, tshark, bpftool
+Description: Dynamic tracing for Linux (DTrace) (testsuite)
+ This is the official Linux port of the advanced tracing tool DTrace.
+ .
+ DTrace is a high-level dynamic tracing tool for Linux, built on kernel
+ tracing features (tracepoints, function probes (fentry/fexit), dynamic
+ kernel probes (kprobes), dynamic userspace probes (uprobes), ... and
+ leveraging BPF as execution engine.  It features an integrated compiler
+ for its high-level tracing language and native support for interacting
+ with the BPF engine, significantly reducing runtime dependencies
+ .
+ This package contains the testsuite.
diff --git a/dists/debian/copyright b/dists/debian/copyright
new file mode 100644
index 00000000..1a5c8f64
--- /dev/null
+++ b/dists/debian/copyright
@@ -0,0 +1,103 @@
+Format: https://www.debian.org/doc/packaging-manuals/copyright-format/1.0/
+Upstream-Name: dtrace
+Upstream-Contact: Kris Van Hees <kris.van.hees@oracle.com>
+Source: https://github.com/oracle/dtrace-utils/
+
+Files: *
+Copyright: Copyright (c) 2003, 2026, Oracle and/or its affiliates. All rights reserved.
+License: UPL-1.0
+
+Files: include/linux/bpf.h
+Copyright: Copyright (c) 2011-2014 PLUMgrid, http://plumgrid.com
+License: GPL-2 with Linux-syscall-note exception
+
+Files: include/linux/btf.h
+Copyright: Copyright (c) 2018 Facebook
+License: GPL-2 with Linux-syscall-note exception
+
+Files: include/sys/auxv.h include/sys/bitmap.h
+Copyright: copyright (c) 1984, 1986, 1987, 1988, 1989 at&t
+License: UPL-1.0
+
+Files: include/sys/glibc_internal_link.h
+Copyright: Copyright disclaimed (all content required for interoperability)
+License: LGPL-2.1+
+
+Files: libproc/libproc.h libproc/Pcontrol.c
+Copyright: Copyright (c) 2003, 2025, Oracle and/or its affiliates. All rights reserved.
+License: UPL-1.0
+
+License: UPL-1.0
+ The Universal Permissive License (UPL), Version 1.0
+ .
+ Subject to the condition set forth below, permission is hereby granted
+ to any person obtaining a copy of this software, associated
+ documentation and/or data (collectively the "Software"), free of charge
+ and under any and all copyright rights in the Software, and any and all
+ patent rights owned or freely licensable by each licensor hereunder
+ covering either (i) the unmodified Software as contributed to or
+ provided by such licensor, or (ii) the Larger Works (as defined below),
+ to deal in both
+ .
+ (a) the Software, and
+ (b) any piece of software and/or hardware listed in the lrgrwrks.txt
+ file if one is included with the Software (each a “Larger Work” to which
+ the Software is contributed by such licensors),
+ .
+ without restriction, including without limitation the rights to copy,
+ create derivative works of, display, perform, and distribute the
+ Software and make, use, sell, offer for sale, import, export, have made,
+ and have sold the Software and the Larger Work(s), and to sublicense the
+ foregoing rights on either these or other terms.
+ .
+ This license is subject to the following condition:
+ The above copyright notice and either this complete permission notice or
+ at a minimum a reference to the UPL must be included in all copies or
+ substantial portions of the Software.
+ .
+ THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
+ OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
+ MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
+ NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
+ LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
+ OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
+ WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
+ Licensed under the Universal Permissive License v 1.0 as shown at
+ http://oss.oracle.com/licenses/upl.
+
+License: GPL-2 with Linux-syscall-note exception
+ This program is free software; you can redistribute it
+ and/or modify it under the terms of the GNU General Public
+ License version 2 as published by the Free Software Foundation.
+ .
+ On Debian systems, the full text of the GNU General Public
+ License version 2 can be found in the file
+ `/usr/share/common-licenses/GPL-2'.
+ .
+ NOTE! This copyright does *not* cover user programs that use kernel
+ services by normal system calls - this is merely considered normal use
+ of the kernel, and does *not* fall under the heading of "derived work".
+ Also note that the GPL below is copyrighted by the Free Software
+ Foundation, but the instance of code that it refers to (the Linux
+ kernel) is copyrighted by me and others who actually wrote it.
+ .
+ Also note that the only valid version of the GPL as far as the kernel
+ is concerned is _this_ particular version of the license (ie v2, not
+ v2.2 or v3.x or whatever), unless explicitly otherwise stated.
+
+License: LGPL-2.1+
+ This file is part of the GNU C Library.
+ .
+ The GNU C Library is free software; you can redistribute it and/or
+ modify it under the terms of the GNU Lesser General Public
+ License as published by the Free Software Foundation; either
+ version 2.1 of the License, or (at your option) any later version.
+ .
+ The GNU C Library is distributed in the hope that it will be useful,
+ but WITHOUT ANY WARRANTY; without even the implied warranty of
+ MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ Lesser General Public License for more details.
+ .
+ You should have received a copy of the GNU Lesser General Public
+ License along with the GNU C Library; if not, see
+ <https://www.gnu.org/licenses/>.
diff --git a/dists/debian/dtrace-tests.install b/dists/debian/dtrace-tests.install
new file mode 100644
index 00000000..a04ebfb9
--- /dev/null
+++ b/dists/debian/dtrace-tests.install
@@ -0,0 +1 @@
+usr//lib/${DEB_HOST_MULTIARCH}/dtrace/testsuite/
diff --git a/dists/debian/dtrace-tests.lintian-overrides b/dists/debian/dtrace-tests.lintian-overrides
new file mode 100644
index 00000000..22cbd6eb
--- /dev/null
+++ b/dists/debian/dtrace-tests.lintian-overrides
@@ -0,0 +1,8 @@
+dtrace-tests binary: unstripped-binary-or-object [*]
+dtrace-tests binary: unusual-interpreter dtrace [*.d]
+dtrace-tests binary: interpreter-not-absolute dtrace [*.d]
+dtrace-tests binary: executable-not-elf-or-script [*.d]
+dtrace-tests binary: relative-library-search-path RUNPATH test/triggers [*]
+dtrace-tests binary: statically-linked-binary [*]
+dtrace-tests binary: package-has-unnecessary-activation-of-ldconfig-trigger
+dtrace-tests binary: shared-library-lacks-prerequisites [*/dtrace/testsuite/test/triggers/libproc-dlmlib.so.0.0.0]
diff --git a/dists/debian/dtrace.docs b/dists/debian/dtrace.docs
new file mode 100644
index 00000000..7696583d
--- /dev/null
+++ b/dists/debian/dtrace.docs
@@ -0,0 +1 @@
+usr/share/doc/dtrace-${env:DEB_VERSION_UPSTREAM}/
diff --git a/dists/debian/dtrace.install b/dists/debian/dtrace.install
new file mode 100644
index 00000000..6be68ccb
--- /dev/null
+++ b/dists/debian/dtrace.install
@@ -0,0 +1 @@
+usr/sbin/dtrace
diff --git a/dists/debian/dtrace.lintian-overrides b/dists/debian/dtrace.lintian-overrides
new file mode 100644
index 00000000..11005f4a
--- /dev/null
+++ b/dists/debian/dtrace.lintian-overrides
@@ -0,0 +1 @@
+dtrace binary: unstripped-binary-or-object [*]
diff --git a/dists/debian/dtrace.manpages b/dists/debian/dtrace.manpages
new file mode 100644
index 00000000..e54b52b3
--- /dev/null
+++ b/dists/debian/dtrace.manpages
@@ -0,0 +1 @@
+usr/share/man/man8/dtrace.8
diff --git a/dists/debian/libdtrace2-dev.install b/dists/debian/libdtrace2-dev.install
new file mode 100644
index 00000000..b5e66db5
--- /dev/null
+++ b/dists/debian/libdtrace2-dev.install
@@ -0,0 +1,5 @@
+usr/lib/${DEB_HOST_MULTIARCH}/libdtrace.so
+usr/include/dtrace
+usr/include/dtrace.h
+usr/include/sys/dtrace.h
+usr/include/sys/dtrace_types.h
diff --git a/dists/debian/libdtrace2.install b/dists/debian/libdtrace2.install
new file mode 100644
index 00000000..36294de3
--- /dev/null
+++ b/dists/debian/libdtrace2.install
@@ -0,0 +1,12 @@
+usr/lib/${DEB_HOST_MULTIARCH}/dtrace/[0-9]*/
+usr/lib/${DEB_HOST_MULTIARCH}/dtrace/bpf_dlib.o
+usr/lib/${DEB_HOST_MULTIARCH}/dtrace/drti/
+usr/lib/${DEB_HOST_MULTIARCH}/dtrace/include/
+usr/lib/${DEB_HOST_MULTIARCH}/libdtrace.so.*
+usr/lib/${DEB_HOST_MULTIARCH}/pkgconfig/dtrace.pc
+usr/lib/${DEB_HOST_MULTIARCH}/pkgconfig/dtrace_sdt.pc
+usr/lib/systemd/system/dtprobed.service
+usr/lib/systemd/system/dtrace-usdt.target
+usr/lib/systemd/system-preset/50-dtprobed.preset
+usr/lib/udev/rules.d/60-dtprobed.rules
+usr/sbin/dtprobed
diff --git a/dists/debian/libdtrace2.lintian-overrides b/dists/debian/libdtrace2.lintian-overrides
new file mode 100644
index 00000000..34b4011d
--- /dev/null
+++ b/dists/debian/libdtrace2.lintian-overrides
@@ -0,0 +1,4 @@
+libdtrace2 binary: binary-from-other-architecture [*/dtrace/bpf_dlib.o]
+libdtrace2 binary: unstripped-binary-or-object [*]
+libdtrace2 binary: appstream-metadata-missing-modalias-provide usr/lib/udev/rules.d/60-dtprobed.rules
+libdtrace2 binary: systemd-service-file-refers-to-unusual-wantedby-target basic.target [usr/lib/systemd/system/dtprobed.service]
diff --git a/dists/debian/libdtrace2.manpages b/dists/debian/libdtrace2.manpages
new file mode 100644
index 00000000..fef53dc3
--- /dev/null
+++ b/dists/debian/libdtrace2.manpages
@@ -0,0 +1 @@
+usr/share/man/man8/dtprobed.8
diff --git a/dists/debian/mkChangelog b/dists/debian/mkChangelog
new file mode 100755
index 00000000..69958dca
--- /dev/null
+++ b/dists/debian/mkChangelog
@@ -0,0 +1,174 @@
+#!/usr/bin/awk -f
+
+#
+# This script can be used to convert the dtrace.spec into a Debian changelog
+# file.  It is intended to be invoked from the 'prep-debian' make target, but
+# it can be used manually as well:
+#	mkChangelog debian/control dtrace.spec > debian/changelog
+#
+
+function error(msg) {
+	print "E:"msg >"/dev/stderr";
+	err = 1;
+	exit(1);
+}
+
+BEGIN {
+	if (!dist)
+		dist = "UNRELEASED";
+	else if (dist != "unstable" && dist != "experimental")
+		error("Bad dist ("dist")");
+}
+
+/^Maintainer:/ {
+	sub(/^Maintainer: +/, "");
+	m_name = $0;
+	i = index(m_name, " <");
+	m_mail = substr(m_name, i + 1);
+	m_name = substr(m_name, 1, i - 1);
+
+	nextfile;
+}
+
+/^Name:/ {
+	pkg = $2;
+	next;
+}
+
+/^%changelog/ {
+	in_changelog = 1;
+	next;
+}
+
+!in_changelog {
+	next;
+}
+
+function lineWrap(p, s, line, len, l, n, m, i) {
+	n = length(p);
+	line = p;
+	len = n;
+
+	m = split(s, arr, / +/);
+	for (i = 1; i <= m; i++) {
+		l = length(arr[i]);
+		if (len + 1 + l >= 80) {
+			print line;
+			line = sprintf("%*s %s", n, "", arr[i]);
+			len = n + 1 + l;
+		} else {
+			line = line " " arr[i];
+			len += 1 + l;
+		}
+	}
+	delete arr;
+
+	print line;
+}
+
+function emitEntry(i, j, n) {
+	# Loop through the contributions, determining who each contribution
+	# should be credited to.  If there are multiple contributors, we pick
+	# the first one who is not the commit author (if any).
+	# If all contributions are from the commit author, we do not emit an
+	# explicit credit line.
+	for (i = 1; i <= lc; i++) {
+		gsub(/ \[Orabug[:;] [1-9][0-9]*(, [1-9][0-9]*)*\]/, "", lv[i]);
+		sub(/[ \t]+$/, "", lv[i]);
+		gsub(/  +/, " ", lv[i]);
+
+		cont = name;
+		if (match(lv[i], /\([^)]+\)$/) > 0) {
+			auth = substr(lv[i], RSTART + 1, RLENGTH - 2);
+			lv[i] = substr(lv[i], 1, RSTART - 1);
+			sub(/[ \t]+$/, "", lv[i]);
+			n = split(auth, arr, /, */);
+
+			# Find the first contributor not the commit author.
+			for (j = 1; j <= n; j++) {
+				if (arr[j] == name)
+					continue;
+				cont = arr[j];
+				break;
+			}
+			delete arr;
+		}
+
+		# Add to the list of contributions for this contributor.
+		if (cont in map)
+			map[cont] = map[cont] " " i;
+		else
+			map[cont] = i;
+	}
+
+	print pkg" ("vers") "dist"; urgency=medium";
+
+	# First emit contributions by people other than the commit author.
+	n = 0;
+	for (cont in map) {
+		if (cont == name)
+			continue;
+
+		n++;
+		print "\n  [ "cont" ]";
+		$0 = map[cont];
+		for (i = 1; i <= NF; i++)
+			lineWrap("  *", lv[int($i)]);
+	}
+	if (n > 0)
+		print "\n  [ "name" ]";
+	else
+		print "";
+
+	$0 = map[name];
+	for (i = 1; i <= NF; i++)
+		lineWrap("  *", lv[int($i)]);
+
+	delete map;
+
+	if (m_name) {
+		name = m_name;
+		mail = m_mail;
+		m_name = m_mail = 0;
+	}
+	print "\n -- "name" "mail"  "date" 00:00:00 +0000\n";
+}
+
+/^\* (Sun|Mon|Tue|Wed|Thu|Fri|Sat) [A-Z][a-z][a-z] [ 0-3][0-9] / {
+	date = $2", "$4" "$3" "$5;
+	i = index($0, " - ");
+	vers = substr($0, i + 3);
+	name = substr($0, 19, i - 19);
+	i = index(name, " <");
+	mail = substr(name, i + 1);
+	name = substr(name, 1, i - 1);
+	if (name == "")
+		error("No name in: "$0);
+
+	lc = 0;
+	delete lv;
+
+	next;
+}
+
+/^- / {
+	sub(/^- +/, "");
+	lv[++lc] = $0;
+	next;
+}
+
+NF == 0 {
+	emitEntry();
+	date = "";
+	next;
+}
+
+{
+	lv[lc] = lv[lc] $0;
+	next;
+}
+
+END {
+	if (date && !err)
+		emitEntry();
+}
diff --git a/dists/debian/patches/debian-configure.patch b/dists/debian/patches/debian-configure.patch
new file mode 100644
index 00000000..d4a89bb9
--- /dev/null
+++ b/dists/debian/patches/debian-configure.patch
@@ -0,0 +1,17 @@
+Description: issue a warning for unknown configure options
+ The Debian build system specifies configure options that are not known to
+ the DTrace configure script.  They should not cause the configure script
+ to abort.
+
+--- dtrace-2.0.4.orig/configure
++++ dtrace-2.0.4/configure
+@@ -172,8 +172,7 @@ for option in "$@"; do
+         HAVE_VALGRIND=*) write_config_var VALGRIND "$option";;
+         HAVE_BPFV3=*) write_config_var BPFV3 "$option";;
+         HAVE_BPFMASM=*) write_config_var BPFMASM "$option";;
+-        *) echo "Unknown option $option" >&2
+-           exit 1;;
++        *) echo "Unknown option $option" >&2;;
+     esac
+ done
+ 
diff --git a/dists/debian/patches/debian-interpreter-paths.patch b/dists/debian/patches/debian-interpreter-paths.patch
new file mode 100644
index 00000000..58bea538
--- /dev/null
+++ b/dists/debian/patches/debian-interpreter-paths.patch
@@ -0,0 +1,107 @@
+Description: fix interpreter paths in tests
+ Lintian prefers /bin/bash and /bin/sed over /usr/bin/bash and /usr/bin/sed.
+
+--- dtrace-2.0.4.orig/test/unittest/arrays/err.D_UNKNOWN.uregs_toobig.aarch64.x
++++ dtrace-2.0.4/test/unittest/arrays/err.D_UNKNOWN.uregs_toobig.aarch64.x
+@@ -1,4 +1,4 @@
+-#!/usr/bin/bash
++#!/bin/bash
+ 
+ [ `uname -m` = "aarch64" ] && exit 0
+ exit 2
+--- dtrace-2.0.4.orig/test/unittest/arrays/err.D_UNKNOWN.uregs_toobig.x86_64.x
++++ dtrace-2.0.4/test/unittest/arrays/err.D_UNKNOWN.uregs_toobig.x86_64.x
+@@ -1,4 +1,4 @@
+-#!/usr/bin/bash
++#!/bin/bash
+ 
+ [ `uname -m` = "x86_64" ] && exit 0
+ exit 2
+--- dtrace-2.0.4.orig/test/unittest/codegen/err.deref_0.r.p
++++ dtrace-2.0.4/test/unittest/codegen/err.deref_0.r.p
+@@ -1,4 +1,4 @@
+-#!/usr/bin/sed -f
++#!/bin/sed -f
+ 
+ # runtest.sh looks for "0x" to filter out pointer values.
+ # Strip the 0x so that the illegal address will not be filtered out;
+--- dtrace-2.0.4.orig/test/unittest/codegen/err.deref_1.r.p
++++ dtrace-2.0.4/test/unittest/codegen/err.deref_1.r.p
+@@ -1,4 +1,4 @@
+-#!/usr/bin/sed -f
++#!/bin/sed -f
+ 
+ # runtest.sh looks for "0x" to filter out pointer values.
+ # Strip the 0x so that the illegal address will not be filtered out;
+--- dtrace-2.0.4.orig/test/unittest/codegen/err.deref_i0.r.p
++++ dtrace-2.0.4/test/unittest/codegen/err.deref_i0.r.p
+@@ -1,4 +1,4 @@
+-#!/usr/bin/sed -f
++#!/bin/sed -f
+ 
+ # runtest.sh looks for "0x" to filter out pointer values.
+ # Strip the 0x so that the illegal address will not be filtered out;
+--- dtrace-2.0.4.orig/test/unittest/codegen/err.deref_i1.r.p
++++ dtrace-2.0.4/test/unittest/codegen/err.deref_i1.r.p
+@@ -1,4 +1,4 @@
+-#!/usr/bin/sed -f
++#!/bin/sed -f
+ 
+ # runtest.sh looks for "0x" to filter out pointer values.
+ # Strip the 0x so that the illegal address will not be filtered out;
+--- dtrace-2.0.4.orig/test/unittest/codegen/err.deref_string-assoc.r.p
++++ dtrace-2.0.4/test/unittest/codegen/err.deref_string-assoc.r.p
+@@ -1,4 +1,4 @@
+-#!/usr/bin/sed -f
++#!/bin/sed -f
+ 
+ # runtest.sh looks for "0x" to filter out pointer values.
+ # Strip the 0x so that the illegal address will not be filtered out;
+--- dtrace-2.0.4.orig/test/unittest/codegen/err.deref_string-gvar.r.p
++++ dtrace-2.0.4/test/unittest/codegen/err.deref_string-gvar.r.p
+@@ -1,4 +1,4 @@
+-#!/usr/bin/sed -f
++#!/bin/sed -f
+ 
+ # runtest.sh looks for "0x" to filter out pointer values.
+ # Strip the 0x so that the illegal address will not be filtered out;
+--- dtrace-2.0.4.orig/test/unittest/codegen/err.deref_string-lvar.r.p
++++ dtrace-2.0.4/test/unittest/codegen/err.deref_string-lvar.r.p
+@@ -1,4 +1,4 @@
+-#!/usr/bin/sed -f
++#!/bin/sed -f
+ 
+ # runtest.sh looks for "0x" to filter out pointer values.
+ # Strip the 0x so that the illegal address will not be filtered out;
+--- dtrace-2.0.4.orig/test/unittest/codegen/err.deref_string-tvar.r.p
++++ dtrace-2.0.4/test/unittest/codegen/err.deref_string-tvar.r.p
+@@ -1,4 +1,4 @@
+-#!/usr/bin/sed -f
++#!/bin/sed -f
+ 
+ # runtest.sh looks for "0x" to filter out pointer values.
+ # Strip the 0x so that the illegal address will not be filtered out;
+--- dtrace-2.0.4.orig/test/unittest/preprocessor/err.ifdefincomp.r.p
++++ dtrace-2.0.4/test/unittest/preprocessor/err.ifdefincomp.r.p
+@@ -1,4 +1,4 @@
+-#!/usr/bin/sed -f
++#!/bin/sed -f
+ # GCC 16 improved diagnostics formatting.  Until GCC 16 is the minimum
+ # supported, we have to sed it back again.
+ s,[‘’],",g
+--- dtrace-2.0.4.orig/test/unittest/preprocessor/err.incompelse.r.p
++++ dtrace-2.0.4/test/unittest/preprocessor/err.incompelse.r.p
+@@ -1,4 +1,4 @@
+-#!/usr/bin/sed -f
++#!/bin/sed -f
+ # GCC 16 improved diagnostics formatting.  Until GCC 16 is the minimum
+ # supported, we have to sed it back again.
+ s,[‘’],,g
+--- dtrace-2.0.4.orig/test/utils/clean_probes.sh
++++ dtrace-2.0.4/test/utils/clean_probes.sh
+@@ -1,4 +1,4 @@
+-#!/usr/bin/bash
++#!/bin/bash
+ 
+ TRACEFS=/sys/kernel/debug/tracing
+ EVENTS=${TRACEFS}/available_events
diff --git a/dists/debian/patches/series b/dists/debian/patches/series
new file mode 100644
index 00000000..6d3b5413
--- /dev/null
+++ b/dists/debian/patches/series
@@ -0,0 +1,3 @@
+# You must remove unused comment lines for the released package.
+debian-configure.patch
+debian-interpreter-paths.patch
diff --git a/dists/debian/rules b/dists/debian/rules
new file mode 100755
index 00000000..8646ac1a
--- /dev/null
+++ b/dists/debian/rules
@@ -0,0 +1,24 @@
+#!/usr/bin/make -f
+# You must remove unused comment lines for the released package.
+export DH_VERBOSE = 1
+export DEB_BUILD_MAINT_OPTIONS = hardening=+all
+export DEB_CFLAGS_MAINT_APPEND  = -Wall -pedantic
+export DEB_LDFLAGS_MAINT_APPEND = -Wl,--as-needed
+
+include /usr/share/dpkg/pkg-info.mk
+
+export DEB_VERSION_UPSTREAM
+
+%:
+	dh $@
+
+override_dh_auto_configure:
+	dh_auto_configure -- --pkg-config-dir=\$${LIBDIR}/pkgconfig BPFC=bpf-gcc BPFLD=bpf-ld
+
+override_dh_strip:
+	dh_strip -Xdtrace
+
+override_dh_auto_test:
+
+override_dh_auto_install:
+	dh_auto_install -- install-test
diff --git a/dists/debian/source/format b/dists/debian/source/format
new file mode 100644
index 00000000..163aaf8d
--- /dev/null
+++ b/dists/debian/source/format
@@ -0,0 +1 @@
+3.0 (quilt)
-- 
2.51.0

