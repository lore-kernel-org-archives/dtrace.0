Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3773921D3CD
	for <dtrace@lists.linux.dev>; Thu, 11 Sep 2025 18:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757614315; cv=fail; b=FUdKMU2fIZMDnvY1Vad4lyLIDnzY5zo3ScQmTTOlBWG91OlwgY3RbKmXyFbDUOoaIouu18Q/HtnxdNZoYmbOabdFpLTxkEsRd/4+a1vWiyIbS5hS6Dd1N4ysyDjWNNJJqCNkVLoOcgMMb/nOQpujr2Ot5MRPoNqk2/BNqWHj5d4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757614315; c=relaxed/simple;
	bh=+UnPVDc7dC/SDFKKbpfLo9csRVulOqyXGelSpzAvIxs=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=a8c8s7vT+TOauKuzGKW2PNcdXidN7Luq6A4k9cPLyChb4YYTAa70KTsbiZP40lTZRpKMpRS9f60Qu3JQyaXbKDJo+3AMhJq3myebt1AxDPb98tZZ9wQKCPvQXEX1tnYGSlIclZOlcv/mNNsGzKvxJ7qkdc8vQZWDIM/jNfI8Umo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=E4T/FqdB; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=S7TYqAtl; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="E4T/FqdB";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="S7TYqAtl"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58BHBgtD007366
	for <dtrace@lists.linux.dev>; Thu, 11 Sep 2025 18:11:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=K4CM5AqJMz81uETriDBhaTO1U/DlKmXOdOrR/Q6W+aM=; b=
	E4T/FqdBmpoQuKNXAjYuubPO4MKlWSgqZ9hyoC62u8k1StTYb7oKQBsO2/nXIah9
	whzbTnH4TWfsyOiZKjQvR2XVtkQLqonnsYWnx2c7euEENROR2+OTGxpMFaqbSbKp
	ndny8389YDErrqTONbwLL52GY7V0gNyh6ketlA6wbw+RpF77PAbkv5IVq57llhb3
	fGE1SHhE0L9NPyAkNMq4XsZmZYtHTUhlBc8dI6or64eWBVlq2qvnurdeXhZwkQAN
	qGeGtJpJT4ZpaE+jHrJ4n/8E1XWqy3oGat5KlPWdVzhP6mCxrqAC6AAnBMr92ciZ
	vuTm3DH+VJ4d1XlWLNyWgQ==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4922x96snp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 11 Sep 2025 18:11:53 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 58BH4ZkO003074
	for <dtrace@lists.linux.dev>; Thu, 11 Sep 2025 18:11:51 GMT
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011012.outbound.protection.outlook.com [40.107.208.12])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 490bdkatp5-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 11 Sep 2025 18:11:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kR+dnZJ0U2+FDwDECSj9QWKOhfR4FfewpQ2qqHM1Ipx07ziYV2If9ISBb31AmfvnEKcxbHlxy04uYLhreQQdM7OPFfxT+zC5nOJZL1G4uZeOjyLdn8f/AhJ6O8HkSzLVwRC4a2fHqYZXBTNmPnkckTplvZbRS1IhG/zSISBAE8+HT4m9Fuopqs0u9zjRv+1J9Ji0E9qO+62VfCPLIY/NyfXB2n+RPa4OnpXaF+EGzA79DRgj5qnNIkcpuzjyzuTek61HUaJSpHjXJ64ez9xc84g6VHuFJsLWA2CfWINgt1JOoYvaxIv+iZKjGdFXnKXSIWYIOzopUwB3FCn+s+rwNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K4CM5AqJMz81uETriDBhaTO1U/DlKmXOdOrR/Q6W+aM=;
 b=neB5csfjXRyss5DRPVRFxj/rXj4DAcr0VU6KAPDX+mJ0gTuTDS1A6K6P1l1ScG5FxgA73xQFkAVcZcbwXp1ARbBac0dZVTgdmteRl8GbX/jZH7jpJFlxSAT8Z4BOsLAohL/BSO9fNStZO1JxgXkjyJsNeJxrrzHCdeQsa1SoacvQ1WRcE0n61/DOngbzFHUgTMsDrABBb25berwaWOfzPytnhOCUN7VVXEmL3GZQba8rZXIJe5tC32W2paocd8VGwkYSfQZ+XPwSppLHgvZBD4DGUizHVxit+2JfCelf1Nb36A2kuLqCENMyB8yfHeK5hgMpPhnNjbxmfzZ1y3kJ+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K4CM5AqJMz81uETriDBhaTO1U/DlKmXOdOrR/Q6W+aM=;
 b=S7TYqAtle7BB2rPYPqGZuLEojBhsstUEBfYah1u4jevlP8Jh+Cedh4qk23Bi+XXRKA5ZnMOt7az1KIucPPPO1XBozPfFbulgzOag4jSYw/CmKXGzvq2Ev5ESCTg4wXsMRnGRbnUaBWe9BSA2vyUzOHGWL7HJaJZkj39fv7RBwaw=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by DS0PR10MB7202.namprd10.prod.outlook.com (2603:10b6:8:de::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Thu, 11 Sep
 2025 18:11:43 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%6]) with mapi id 15.20.9094.021; Thu, 11 Sep 2025
 18:11:43 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH] Add more robust mechanism to skip tracepoint common fields
Date: Thu, 11 Sep 2025 14:11:39 -0400
Message-Id: <20250911181139.27783-1-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
Content-Type: text/plain
X-ClientProxiedBy: MN2PR06CA0026.namprd06.prod.outlook.com
 (2603:10b6:208:23d::31) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|DS0PR10MB7202:EE_
X-MS-Office365-Filtering-Correlation-Id: daefdc62-3bc9-4f04-26be-08ddf15ea99c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?njUml//t1XYY4yPAOfpaAgwiQfCE+eDnDVj+FNTvlxhbzGenXH97nPjhB1x2?=
 =?us-ascii?Q?6g5yLS4D1EHfLxK/pZF0fMhDCGPFJF0Z1vQWPqjwzk0xEYV4w+OmMgCHmhNY?=
 =?us-ascii?Q?LBftowFypnpKNL3YnXZmEoXtx/vhx45TkXx3B299LsiJ734tB6QONOYxJluI?=
 =?us-ascii?Q?VoI7ZvIoiO7uUAJYBoTnp3HJ8ldoa5L8GdBLWdYdqbsspb1d4OlYbujuQuhp?=
 =?us-ascii?Q?X3PJOalpHcGC2sZP0HiALC/skIaLPOXiuEy2ffqwsf/bbjevRGHY0sVFdHKt?=
 =?us-ascii?Q?nx/od4fjL8YzNLNxtLjEySCKtNiCV0/Xl7FEkcBIBgn4H1PvuzTO1Z8XT3VK?=
 =?us-ascii?Q?vtoXruMiM1LYORrpyXTIKTvlAcv1kHFqZAlI+VHgiysCgv6poVtDe8G3Snmh?=
 =?us-ascii?Q?pm74CErmReA/vf0nAw2SodlF9ehFyrJ3MCbIEWzbL1D/tALgl3W6a0CpVCeY?=
 =?us-ascii?Q?gUticlWC/ifSXaA6AXlv5OYYGmwEWf0TzPexIV7Ei5GdIBXA/0dxYIYjZIln?=
 =?us-ascii?Q?53gz2OePXjHePcV+sk/jejdXjHjwAVzuk6NuJ+vavLS+gS56vKuLjZwfwETG?=
 =?us-ascii?Q?XgCsd23b5G0NBl+5FiJe2YDnHmwWdvnJjt9G1MmZlD8lbZPgaz3Cz0qZkJIp?=
 =?us-ascii?Q?hyi86DzXFjrm+e4QfohkPptKi2uZyvcLaxnCGEzbfN0pfsDA2B2kW0r+hGQ8?=
 =?us-ascii?Q?leQjVGCfK8z0zIbHxF7stwLJnCuUfeBFF4BfP79c8CVm5KTFP+FrY4Xbl2EL?=
 =?us-ascii?Q?l7c1yHGiFrjRUcmXyWvxictwx7pTEcWF1tELGVbXhnjerknRMk8+fP4TPRrw?=
 =?us-ascii?Q?SJ56BBT+wQG50x7FdMm0QiQUnISVkfBJDt+MNfsa1mj/D3BSocST4VybSVgc?=
 =?us-ascii?Q?fpd9G99LRczhJjXqikxJ5h2JGtH2+zkfceNPAcxVxpdP+zbr7+Z1A3QtCNB8?=
 =?us-ascii?Q?iCNP0Eq0fFfeLf51w97+BrBiqQhJAl4YOv/oIElG8VN0p9Zf8u2dOmVhl4KG?=
 =?us-ascii?Q?81PcBk7C5fGX7sJEyGufAZiVBhDEWxQ8Oz5EfuAM0vY9Ycm48WHzzCt2t9kx?=
 =?us-ascii?Q?nUE+dv0my0j6qjoYMlF9SeC5zdrSMESGycy1fH1dTUaqH2XY8wgfw0juZU2L?=
 =?us-ascii?Q?3k+CjrSvVhF/MihVS0BVDraWNPNbQpTjzhWXexc78OyXvokKCpRRa8KqsyOk?=
 =?us-ascii?Q?BiRFiOmbESj3zyFs9slOS8iP05Vc0q5iuSBFAAdat2txRf9rIyLyzl1R/cfz?=
 =?us-ascii?Q?Lv1BfzVhq8sNwfv+LM/PUnSAx047HPs14Ier9sSUNaApcIiY/ed4dGSSYRAm?=
 =?us-ascii?Q?SNI5jwzbo1RMOlBRhmmvl9Q19nlAhVfvLBJaUeCgwdCIg53TJj0rvhipfo+x?=
 =?us-ascii?Q?k7Mvd7Y=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?PSdMkfZ6fLidABcFi7nzHOVHjVzFZ+Qs0fpHTEOmHqimXAtMjpow96+kZPRd?=
 =?us-ascii?Q?k4VkQadFx/0oUAFh7au6gxBszJ0RO4P7q7v7dj4IjoMuZPpri5jey1Rg0+1X?=
 =?us-ascii?Q?20VP36F+P/kPXvEUeaS/UKC6r0Of9ATTBi1hBRTWydl1xHhQtwbKpqsPjXFg?=
 =?us-ascii?Q?DURezC1udj4wCmc1nSKQtAw9qO42HqHl3s29HYLwx0A0KTGyQWoaPsTlafVl?=
 =?us-ascii?Q?XzM3KYgbC/VsZ1H+pdFSo0I5sLWPo5CtBJGG65RPB/EGS4w6crdSuoVZW6ST?=
 =?us-ascii?Q?kVlHdPtlxFixqprrFBXK0v89XZPxFcV0ems8wVrACPfH+/+MpXxBMUWaxek0?=
 =?us-ascii?Q?NUQhfBsk5a3LqyIvnbLoFHKDvUzQ/BFsarIWZf3/YoiohLTDuynOxfNTv8Bq?=
 =?us-ascii?Q?y/SFhopm+DdccI6isUR23V7hMoRwJmUkw+twjECzqYd2lfkMt1B7zeo23ffs?=
 =?us-ascii?Q?+hrs//QHUYPH05lf6DIU2FKjOIop23cw24STq5U4DvTa3WCaaqJTnj+VKpED?=
 =?us-ascii?Q?FYqt6ViH0SCm0HxyR9sd1kjaenTVf3niYJsvJvUn4kUZxiVo1Kw/x+WjEq4/?=
 =?us-ascii?Q?yxs2LK+s4rTWIPARe1m7N3nwxKTujtMJsi6ZOw7SU9JfG8976BSZ+Cr3CYGn?=
 =?us-ascii?Q?17tFXDaRehC3nlMliHxykkrgGLiflS2tkBzhBl1qPJMLrnpNCOtLOtLQVM43?=
 =?us-ascii?Q?JFkhf96nMzklUanPJiXUdo407ezh1b8hIfOo5TdE4gn9WsM6BssehHdgqAnA?=
 =?us-ascii?Q?/k3MK28eDEmY58pMiUIwpOV8SbAHNBFWHnaabLyqxJx5OfyhoeRpMFbNNct5?=
 =?us-ascii?Q?dMYUnozVpRHi1rfeVEjh/CZthXw+n8jW6ZYhzKRKEkzx2ROEfsy2O47kcfyL?=
 =?us-ascii?Q?TXA2HmdWG31XQRjNM185pcKLw2kA3PHz6NQe4hCRvG/lbFGtn93+nAKSAUx3?=
 =?us-ascii?Q?ZGSVfXME3RX+tayTv6O2w/1YziP4+RAWkHtCIb7r3Xc6mG5OePzvGnlMxSHD?=
 =?us-ascii?Q?YrCEqnepHZqy6LFW/SN/hHD1cfWOKP1xuGbExFaPaX1rW427VzV2cUs0yDot?=
 =?us-ascii?Q?j/WFK0HHaQQuPyAovctvAYTgin7pREbRT/LlF4UeWCV9OtsGOaZxhS1vquC/?=
 =?us-ascii?Q?4aJ3zvTAYuKLW3MKHjMMF5p5ZkfFC1Vupoate/QlTPgGjWyRGzaIBblxlDnW?=
 =?us-ascii?Q?GQYN5vhdibSGtJ+h5r1wrPyUt6jNHdQ/1GenuY3KhBTG2pj1FtcRTkPg/22f?=
 =?us-ascii?Q?96l0jjnTKukZkr55Arr1y6sHgtXBuEbPz7MKBCmzf4q2DDxfpA9kMOMK6OB5?=
 =?us-ascii?Q?8uqWMbjbspg252gP0E58uQ2CWLDI/Nkecm17qYsEx8cLNNpZ6txKsNEKrXGA?=
 =?us-ascii?Q?VEBl/VNuvL281g7nf7xkyMtatmWz7ASoPa0EZtNF1orkXFXt/TTjfzJGJTbU?=
 =?us-ascii?Q?/e8GbQQftt+2vzKFppI/bBampzVK6ve3c2e3YDzWY+GP5nP0KSk68QxT9WIF?=
 =?us-ascii?Q?uKm0Y/kwcetu5Ql2XOC6E47k3qeOkpvXCoVHcSR95Gc0v9APilajSTEXsptN?=
 =?us-ascii?Q?C7s1Bn1GfsY3WVvhoHKG15K4/Wdew/wul3n7UOvq?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	J/W6QoZQMEvemWzWjgNGYN41ESUv5KSNGUpOhwU5Oomd4oRoFzZX0RFozRkyAZAAP3QLZDLdEEzDIfENVAXa9YmrUuLtCEFIakG6r8HtrW/9rD6Mf+ZM81tizA3WdLqYb/HZebko1Tjz2Sewb85KuNqgtNiFKdeULs5XbbTxYg9NhXV9OV+48/hML/9T2eCdJnp5wt7y8Jhiv2+GiXOt6ldrK7zKnsoORM2+28wSimf2ubd6A/AWjlMJbOielbEQitlUfAAOv3vLUvFff9J032MKrXEqkYpjPLUSBF1BM85E//I2nm1i2S/yIb6cjay2AvaPDB7TlQK+Vz77aj49EfXMN7+Bq6mwjBi8fCipzY6Lz42yNNGEfODmJSODiiO9uNNli1aOXXiuc++dYF3oo6DKpp3o4665csZ84A4FehbR8yHf+Df4kZLgZUCP2XS2rJ4fJfzKwLCuB+TCSOdNLhv8GJoRc5Q0RbUVuB1OrDbqqSBg0ATzRSJWU56plI1X8ADT+D04Ifpt5KT+K9zCqQ+5MBoBli8gCTbh9ADeBXqe2hFPnE3iJ9T3Asew3dlfT8j5l6L/aPq63bu5T09mx2OcJ/KEHD6yumXuUHG+nOw=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: daefdc62-3bc9-4f04-26be-08ddf15ea99c
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2025 18:11:43.5862
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bMYLjeFREbBPbYoQ0ya+DPhNGrrKeIdL3mUV2FjuLLmuTRm00VC0eJm3erTNuE6RFG3bEPFmYj4sVOlivvM8qA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7202
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-11_03,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 adultscore=0 suspectscore=0
 bulkscore=0 mlxscore=0 mlxlogscore=999 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2508110000
 definitions=main-2509110162
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA4MDE2NiBTYWx0ZWRfX6NUK0v8vhjnR
 uBwviNumrviZ92uDcTzQd77mqU3XSGTNGqD0dV+fHHwX/f372fNj2olpkEXVXEVQOlY8s81NFKw
 Gqbs0HufeM2B37jp/fSso6kTqWxi63gOeAIJka3FygiXY1GsSQOwV/7xk5d8fSxjLPFJOAt8AEi
 zHyvvqtmybe7ID0CCxNwO6Bq9nlDDG1lSlNk5bI/i/OMuP8muz1n3o4opmCAQ+AgfQlVrmUTF10
 b/jhQ8oG8dXvx+x+IBqVgeBXbC6dr/g0jg6Lt7HgXv5ETDzOoYaTilDdpEiG2VydCEuJTR/tRPn
 z9cwykrCXDl5cZvyYNzxQ8uxKf/JXOtFujkk6NnoqMWKhMpAl2Y3SWkaEydAcRwv3JzQvr81dKX
 z8vz/ANN8TuMmokA8Fhiv1CT/t1FJg==
X-Proofpoint-GUID: jeLFJySy4k1QFUeYB3w92Wtj47H11eJR
X-Proofpoint-ORIG-GUID: jeLFJySy4k1QFUeYB3w92Wtj47H11eJR
X-Authority-Analysis: v=2.4 cv=LYY86ifi c=1 sm=1 tr=0 ts=68c310e9 b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10
 a=GoEa3M9JfhUA:10 a=Oh2cFVv5AAAA:8 a=yPCof4ZbAAAA:8 a=6DfsbHDuvEzDLnGU7yEA:9
 a=7KeoIwV6GZqOttXkcoxL:22 cc=ntf awl=host:12084

From: Eugene Loh <eugene.loh@oracle.com>

In dt_tp_event_info(), we parse tracepoint format files -- e.g.,
/sys/kernel/debug/tracing/events/*/*/format.  Specifically, we
are interested in the argument descriptions found in the file,
but we are interested in skipping over "common fields."

The mechanism we used for this purpose was, in dt_provider_tp.c,
to hardwire the number of fields to skip to SKIP_FIELDS_COUNT=4,
assuming the common fields would always be type, flags, pid, and
preempt_count.

This is hardly a robust mechanism.  For example, consider
    https://kernel.googlesource.com/pub/scm/linux/kernel/git/rt/
        linux-rt-devel/+/refs/tags/v5.9.1-rt20-patches/patches/
        preempt-lazy-support.patch
which introduces a preempt_lazy_count common field (on top of
others).  Recent dtrace testing on RHCK 5.14 indicates widespread
test failures due to this problem.

Implement a more robust mechanism.

Specifically, instead of skipping a hardwired (SKIP_FIELDS_COUNT=4)
number of common fields, look for "common_" names.  E.g., in
kernel/trace/trace_events.c in trace_define_common_fields(), we
see the macro __common_field() is used to define common fields,
and the names are prepended with "common_".

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 libdtrace/dt_provider_tp.c | 25 ++++++++-----------------
 1 file changed, 8 insertions(+), 17 deletions(-)

diff --git a/libdtrace/dt_provider_tp.c b/libdtrace/dt_provider_tp.c
index 4531a88a8..d0e980234 100644
--- a/libdtrace/dt_provider_tp.c
+++ b/libdtrace/dt_provider_tp.c
@@ -17,13 +17,6 @@
 #include "dt_probe.h"
 #include "dt_impl.h"
 
-/*
- * All tracing events (tracepoints) include a number of fields that we need to
- * skip in the tracepoint format description.  These fields are: common_type,
- * common_flags, common_preempt_coint, and common_pid.
- */
-#define SKIP_FIELDS_COUNT	4
-
 /*
  * Tracepoint-specific probe data.  This is allocated for every tracepoint
  * based probe.  Since 0 is not a valid tracepoint event id, and given that BTF
@@ -129,10 +122,10 @@ dt_tp_attach_raw(dtrace_hdl_t *dtp, tp_probe_t *tpp, const char *name,
  * the identifier isn't as easy because it may be suffixed by one or more
  * array dimension specifiers (and those are part of the type).
  *
- * All events include a number of fields that we are not interested in and that
- * need to be skipped (SKIP_FIELDS_COUNT).  Callers of this function can
- * specify an additional number of fields to skip (using the 'skip' parameter)
- * before we get to the actual arguments.
+ * All events include a number of common fields that we are not interested
+ * in and that need to be skipped.  Callers of this function can specify an
+ * additional number of fields to skip (using the 'skip' parameter) before
+ * we get to the actual arguments.
  */
 int
 dt_tp_event_info(dtrace_hdl_t *dtp, FILE *f, int skip, tp_probe_t *tpp,
@@ -146,11 +139,6 @@ dt_tp_event_info(dtrace_hdl_t *dtp, FILE *f, int skip, tp_probe_t *tpp,
 
 	tpp->id = 0;
 
-	/*
-	 * Let skip be the total number of fields to skip.
-	 */
-	skip += SKIP_FIELDS_COUNT;
-
 	/*
 	 * Pass 1:
 	 * Determine the event id and the number of arguments (along with the
@@ -162,9 +150,10 @@ dt_tp_event_info(dtrace_hdl_t *dtp, FILE *f, int skip, tp_probe_t *tpp,
 
 		if (sscanf(buf, "ID: %u\n", &tpp->id) == 1)
 			continue;
-
 		if (sscanf(buf, " field:%[^;]", p) <= 0)
 			continue;
+		if (strstr(buf, " common_"))
+			continue;
 		sscanf(p, "__data_loc %[^;]", p);
 
 		/* We found a field: description - see if we should skip it. */
@@ -216,6 +205,8 @@ dt_tp_event_info(dtrace_hdl_t *dtp, FILE *f, int skip, tp_probe_t *tpp,
 		p = buf;
 		if (sscanf(buf, " field:%[^;]", p) <= 0)
 			continue;
+		if (strstr(buf, " common_"))
+			continue;
 		sscanf(p, "__data_loc %[^;]", p);
 
 		/* We found a field: description - see if we should skip it. */
-- 
2.47.3

