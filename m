Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64C511E048B
	for <dtrace@lists.linux.dev>; Tue,  3 Dec 2024 11:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733225790; cv=fail; b=kXkGJ1ngbS2p5eQjI51TnvxJLMvyQl7735xFBcHT34pODLXBKrLr8XxOx5aiLRKEJFHJi+LrAOko4/gP+9fysJJ+ZLOBrg46/leKT9A+wgN2epNUhEorwBsgeAkms1RdKtYE9U6Q70EiUflVFWTY/yYjUyHfigegpuF2KmiIwsw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733225790; c=relaxed/simple;
	bh=AOjDXk/mQpZbimLD4fWZIk0j7KoNhLCoVeV910xnHWs=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=G4ehhlevRyG0tbsvgaKtGEjjbajmqW2hbcnhSOFDLXdTu6c719laO5keF36ymxYLyr5r5vWiKOijIE+jZSYMcNYrMKaewckTVWnaCFc/+mdkUjXBB60NByBFoIr2OyfYNGhBOgcBBnqWbNmdHQw2OtFzA+nH/8a/5MzGaFHxMhI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=ViYKRIXS; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=CHxzqmzy; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ViYKRIXS";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="CHxzqmzy"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B37XaoQ018698
	for <dtrace@lists.linux.dev>; Tue, 3 Dec 2024 11:36:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=corp-2023-11-20; bh=6vLmFTrgGZJcdWjJ
	TzY6FqHAKFsAVuLbY3UEIpVL8e8=; b=ViYKRIXSvwzfrpg+eRjYtAfK9fW0E6d1
	cl83T62ZFaV+RwsqxDbvp3gvlLieKM3GrokyOEXnoT03qjARrITJsvtNV3YLN1u/
	XLcCoZ5stJWF7j3aAJpOWUHm7sT5eRfnosfvkjV+DAGL9f1r0fET4DS4muLCVzLR
	7Spgn+ZduqlAlfT7ZwWS+WW91iUDtvIU6BFSEozNVFBgSdfZKg5DY0phuXvrYdnf
	JjzOHTK7gPy14DoRu8O90aeEPlDJT4oDztiZUgG7+J16qGUWUyW0p++99oe5A8YK
	T2p/Cz8JmsSVdDYhJpy0ynnDJYKG64C/qDm+ZeC6V5rpGtQPLdhXkQ==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 437s4c5twr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 03 Dec 2024 11:36:26 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4B3A3fMi032818
	for <dtrace@lists.linux.dev>; Tue, 3 Dec 2024 11:36:17 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2042.outbound.protection.outlook.com [104.47.55.42])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 437s57wf8m-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 03 Dec 2024 11:36:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E8en2OkFjethU17dGDJCFptaIW03j9agnOvlUkXw33W7Wuje8HC8Bze1JVnjYDmJoZoEfO1cUJyTCenojK2ABaaN4zhDF7FJORyWgSi0Lilsq7Xe5OxTEGC1OL3S6z8CK3YvQvqxuZ11/cjEST6h//s08P8jOcy7TaROvs1Mbf9ThOyUh9LdqTF0OFAiH5Dq3guKUJZWJIgaP4fEkPOIb4voLA5JsaXk7PvC5FIe6KBNjy2Ck3+g4JTK121UcXY1Z8Mro/RDtrf7g8lDAaJArLs3B1FV98av+TPunxdMk1phMm/ENr+/S3CnoGTZMOMCnCnAFKvJMVgUwzrtfQuzKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6vLmFTrgGZJcdWjJTzY6FqHAKFsAVuLbY3UEIpVL8e8=;
 b=yN2FbcZ40ckZTiWgGu6X/rnIQIyzU8eWaEdclPuIiNPcjhW7va465vLTVUL1ibTY6SFxJf/pltvXQr7y/FAGtXG3C2y9mFzpsME36IpsPvP5O6UP18SZ0cUvqz221DezxrMheFO8TPeIpoAlWNevLPZ/Fjfv3y01v+nam8wbY0zE9b3yqmFvkOcjyjDyfgicxxhiBJu2LswB/6ZvJXrooe4u59EE6xwju9JS+VyN3KgzR6GXL1+eGZ4gAs8/Pmf/eJSAbhg4grC7Q+YWhtIwhZukiAmqWlE3KfWNR62LebgQFADTq4AUzWzDfNvMRak2jCnnm8xQs9zylsGPLLNl1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6vLmFTrgGZJcdWjJTzY6FqHAKFsAVuLbY3UEIpVL8e8=;
 b=CHxzqmzynBRSUd1wFNWnqT529XQKaEYWxqEtlOu1aDuJIfFNkvWN7C5D3PG+2PpukfWc7VLBEI8eSMSb+rq8tT3ahWu2hc3mXAiymK+BKicIb5uDoF08kvazQpYb1ngRkreO0q9y0NspDs+T9vR5V0j50m77l2tHTZpVqaMEiqY=
Received: from DS7PR10MB5037.namprd10.prod.outlook.com (2603:10b6:5:3a9::23)
 by LV3PR10MB8177.namprd10.prod.outlook.com (2603:10b6:408:289::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.19; Tue, 3 Dec
 2024 11:36:14 +0000
Received: from DS7PR10MB5037.namprd10.prod.outlook.com
 ([fe80::824a:572e:d9d7:e9f1]) by DS7PR10MB5037.namprd10.prod.outlook.com
 ([fe80::824a:572e:d9d7:e9f1%3]) with mapi id 15.20.8207.017; Tue, 3 Dec 2024
 11:36:14 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Cc: eugene.loh@oracle.com
Subject: [PATCH 0/5] fix test/unittest/usdt/tst.multitrace.sh
Date: Tue,  3 Dec 2024 11:36:05 +0000
Message-ID: <20241203113610.75104-1-nick.alcock@oracle.com>
X-Mailer: git-send-email 2.47.1.279.g84c5f4e78e
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO2P123CA0056.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1::20) To DS7PR10MB5037.namprd10.prod.outlook.com
 (2603:10b6:5:3a9::23)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR10MB5037:EE_|LV3PR10MB8177:EE_
X-MS-Office365-Filtering-Correlation-Id: ae302f12-6f8e-47cd-d5ff-08dd138eb1a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|10070799003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?8fLIUSrF5m9Mj4IRdixC/YPzIytc3cFhJhc1ZoMneJWNXP/YH/grpTHeUhwJ?=
 =?us-ascii?Q?sky3rRbCFbp6YmPXJXeaguyV72yeXJebmCmCRywSLOR/CXvpTjKZxL0HyBHm?=
 =?us-ascii?Q?htHUI6osH2wmU6OxuhbK4aG5/Qbg3K1Nes1zgWjKYFTFhdwgDgHfY/vBJXGU?=
 =?us-ascii?Q?atBqMm7Bkg+yVbNOjhgtWCYrXOLGQ1rXueU0fbsw8SvxoefLuMkINgXXzTzR?=
 =?us-ascii?Q?4+gBqUJiMazzGCEDZk/zM3FpK6BoUBuds8LdriK4IopiCSpFPqoMiWi9/9mm?=
 =?us-ascii?Q?mBe+5cA6xEbUnRyJ+VYsbfdWu/JQYkeQB+6cl2RPJkDt/uGCvfcYOZfTgnLf?=
 =?us-ascii?Q?60/Ffehd+BmOibjWjfSpYjnNVSVWD4bre9EFS/YDJriUxjbht+jQDft8ttqL?=
 =?us-ascii?Q?F24NcUNSvE7L2V6mNU2FGMXL/HrmZkNstYr8/xEmImn1ZaCfJ8DhdptxOawe?=
 =?us-ascii?Q?hyTtG6OGwmr1Mx2wwp2yGPS9WbgNXi9cxx6uoZEEjX5w5VJ9g1USBqNC/lW+?=
 =?us-ascii?Q?DM7BNEUvLI3pPnsC7lisvSa7h+jlDEAb2bKPgxYPldDjJlAsAowTlDOLdZY0?=
 =?us-ascii?Q?07E2iR2QzfZcARiRMwY2Rnd7c5k33SBkrLDyOh3GV5qsEiS/SPeYfWOybic1?=
 =?us-ascii?Q?xRBi4iwQSgil7Gqn+yxGMffWKS8p3pfpsxn4v9JM0MGXyZIr3vlnZiPJB+z0?=
 =?us-ascii?Q?Fl52rTtrUQ+m46Q7Rm44XsUuAGC4EAjhch8ldyiWqVLjo3YfzWyggh2tNOot?=
 =?us-ascii?Q?FiCLUDgxBBsBkTKsj9Z54ycPs9dMbzkVCpPj64JFICnGBdOm83JiSE7zCugD?=
 =?us-ascii?Q?HkxSpeNnwxdYriwiubRq9N5JN/6C2HLHPhf5S7xiJslAeUE4dF6L2JmbiAk1?=
 =?us-ascii?Q?vmDxsTXVp9f2f7k03cGlRUPEimPgxVgW7qcuOfZLIcfqg/hpn+1AH3pLKCQR?=
 =?us-ascii?Q?+yNYeAwIuv/f50VIKhsTpq5+Ee5GeSH+tivT3FPf4LmfjLwqiJssgDPvKaQC?=
 =?us-ascii?Q?0ZAp+3CUboWAT6Dvvc87yhq2lHJriwQzvAIfIK6D1HBu+kUKk9cBuvUoMMfi?=
 =?us-ascii?Q?h0a8itXCGyCZGnPXFaYTMCpaZRnhtH4Ota8PG7gwb8z/vJdC7U0n0P6J2eHI?=
 =?us-ascii?Q?Ies7Y+rmvzI50LObot7GiOBuQAmsZtQ/RDSoPQRusB78Ck/eWPXoyUGsFuqC?=
 =?us-ascii?Q?obIEj2cS89awhi6E9dn+i2KhsGh+jnkBYwpPmtfnw2KWdfdB+mBS5T6rGE7X?=
 =?us-ascii?Q?GX28Lw+jPave5iq9qp712Ti/5jTFe/9sMBRaYbQIXEHepj2I9ngn+ve0EoeA?=
 =?us-ascii?Q?XhDN78X4db2uZKl5gDhyqPHG84EkXu9wWf1mmihN7TOGQw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR10MB5037.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?pAUIAbnepLDidyPle49MjOO5WzLD+K/kxr6VOkfofn+B+GDNDitYwQFHGoah?=
 =?us-ascii?Q?xnWO53roAegbFZLRdOd/TvJ0HfYGHvmr4iJtpWuwESEvj4C52eCQbwqWdbEl?=
 =?us-ascii?Q?VSOy7BbsKp2DojgBE0krJl5o6HWMAfxyJpJ9hM83cAN/+L08zXsYWQS5MkPN?=
 =?us-ascii?Q?deZoRzeYEOD4NC0np+VxmjjoYdjCxJQ2VRx9sCbTvPel8xmAS1u+ABUHbcSr?=
 =?us-ascii?Q?aGjlAzoX80uiMz7AJoZnUdIGfuTT8Mb6DcnpuAoVvip07QeXUN1q9inje3oI?=
 =?us-ascii?Q?t2biy7guB5hmyYOHUsNmZqlCm29+/MrzEBgWYtcBxK1W45I7UeNCmTWCN7nC?=
 =?us-ascii?Q?p17ATtN7HKTScWeYP2XrB2PONeryh3ogQV6mz37YeUs5i81li7tXkza7Ljlo?=
 =?us-ascii?Q?CGig0kf+rk1IWS53eka0FBlf1pudDvt83qpvHg+Nlh27PdGqCxaOnYmamYK6?=
 =?us-ascii?Q?pdmAkFfUKiWQBVzWMM8AX5rNr5jZHZawB/aMHWX0lDjV1kqHutonu0i+XfGh?=
 =?us-ascii?Q?mNCYsyIHW4/EogtxnwbhGNygrTBVQa6BIpHHSZIUvK5vJzgfuj0oiQFXXGq1?=
 =?us-ascii?Q?N3sVQ7t69vOgQHr793AqvPJY/SGse3OPuEWObiYcLrT7AU+KhmHeAmwI0u7j?=
 =?us-ascii?Q?6FUqZkUHMsHcMRM5Ph780W0xCzuQ3WCt4yyahXFfuhjVQZOGaXKBYaHeVweI?=
 =?us-ascii?Q?GSPrI0CqzYCHOcQqD3GiqgsNhw9VCeracsvEhcXRqmGlxxX1L6t7AG2rRgs2?=
 =?us-ascii?Q?O9+4Veg8BlirsW0CrrzA6S/PA6keOwX599KsoRvg05izKc9yOqN0hmYVnh61?=
 =?us-ascii?Q?rVxDTuoxn6I+MC/FgZ7oC3mTcsIrQtF5kh8snkkZIWp8vtm3OcZrO7e2uINu?=
 =?us-ascii?Q?D9bHNF8pCrOu5SONjfFjd6mFd+MbS6gmHA87wME19a6jwNuJ3p+q4SIZFwhH?=
 =?us-ascii?Q?dCCJ9dhziefBt2RYaXj1wWsQrdJ2eXTBP+dJA1cWSvkzO2hIC/5fv7GdhTe3?=
 =?us-ascii?Q?kUr82Mlu1WU6LCin/NaNNRPErD4mDsZfp+WAT0YK0RKebdW0SsOtKjlt252x?=
 =?us-ascii?Q?IPZesb109BfyTFDUyAWQftgr5ztqP+4zL1wGISCFFvyomGtWlsO2cbfnkIKQ?=
 =?us-ascii?Q?t+tnVOOmfoWTdDefuzdfRfWN3nPnQk+VdHK3h/+TzaQgxLFFctA3hb5Ly9w4?=
 =?us-ascii?Q?S5uU+Exn1PBru/kKfrCsa2/lZeZOGmM9LmQ6gsxbkaCSky/LTeBC/OjHT9bb?=
 =?us-ascii?Q?xUtXmEO8GSGCwUarbpz49547PFBuvwKXd9LpIozdIOh70JAPn7V74Rvl0uZ7?=
 =?us-ascii?Q?UGoQWmlGCurXAXYE70ggXqpFSmI+xFUYZvP0PMHznQXy1odRJ2GrZTlMGBMg?=
 =?us-ascii?Q?trHBhQBw72/4wRtksdE9mEnRpC0F8EBttu2VQIyLR4SEIMhW+IsRDKBhgeVA?=
 =?us-ascii?Q?DQRsJdh9HI/e+lqMZaYwRFTIJMhNclNa1t1qhD9NFNsoGp01vVOR0lm2p8iQ?=
 =?us-ascii?Q?vkc5jiAj7EhuLAOMhyXJkG09F+R1Q/jgiLzFV8zioIsrJwAuB4aKnaE8eMFY?=
 =?us-ascii?Q?cNHUli7gZVyk//ERKdK7PwSU1NDzLdtL4qPnD4tHnNh9B9DqikeogOiIzXen?=
 =?us-ascii?Q?Yw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	SErFXVgsCPTJndxL3d4i0SLAFgS3+DFaJEjCG9XqT9t7Uz46BaCL5mmmlKvpkNldIJd41xe9j/+/+64xWpPHzLxhBXWkeWDt3O3JBIgMTgLHvaAWuJE/Aee+M++VoQomOU+hxfXUYtc6qgBUtu7MB2bZmA+n0AFLXI50dZ6ce0zOBbJVX4jZBMhXKO2wE8bhiVpS18KsSgvUX+UQ3CX8YvEMg1AaFGSxB7tZWzJw4/cPQiDj1nkphgVrHmkMhCrEfdgf1OdA9q+bio/lVgTFnNEcZvXFYKa9R1ReeBLsxRHQ9ZxK9F2Z0GNW0is5usPrsNCSadl1h1ZojZmd6mWjQw7ocNOrll6Xo97VJH6zQoa89Uo5oxO+JljsvH2VGEaqPTvr+SKdQhNun9r4Wd3/WxcFpmAHGDw6A3MV2VCZ9ZfUtrmI+NnvKSAjmT8YqaLheOuykKF5v40NssYi064xBXUfqNFKE3gZiTvLDcEKL9YkKwvTD28q3mxJ0SMBUTrWtEknPVBJOVFe+z3bl/oy6n30+trcjUUJ8amN7SK8sHzg0DcQmWaFEPBLdQ7vUQCCDhpoWTdw6PrHIQgjP3YUj93jHiPCu+JaZFIlKeXdIlI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae302f12-6f8e-47cd-d5ff-08dd138eb1a4
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB5037.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2024 11:36:14.5460
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZqUr+c1uKJJyUEKnNj/uLQADQgY5D+WGib/+HXiIeSpguWBCXSelPz97QFO+vOvl/cGoov71FfQVM8VfAKNlUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR10MB8177
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-02_14,2024-12-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxlogscore=999
 spamscore=0 suspectscore=0 malwarescore=0 mlxscore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2411120000 definitions=main-2412030100
X-Proofpoint-ORIG-GUID: TR-9LTHUELui9xX3CVjydV22r1w9ktmn
X-Proofpoint-GUID: TR-9LTHUELui9xX3CVjydV22r1w9ktmn

So Eugene's fix for test/unittest/proc/tst.self-grab.sh caused this test to
pass, even though self-grabbing should have nothing whatsoever to do with
the "multiple dtraces tracing multiple processes" case that
tst.multitrace.sh is testing.  This caused me to look more closely at
Eugene's fix and write something better, but also caused me to finally
figure out what was really going on in tst.multitrace.sh and fix it.

Eugene's self-grabbing fix fixed tst.multitrace.sh by accident: it
accidentally disabled ptrace()-based (invasive) tracing for *everything*,
due to mistakenly assuming that things that were not being debugged were in
fact being debugged by a non-dtrace process.  So first we had to fix that
fix: the underlying problem with self-grabbing was that we had not
considered the case where a process was being traced by some other thread in
*this process*, which is actually commonplace because many libproc
operations are carried out by the main dtrace thread, but ptrace()ing is
done by a distinct, dedicated thread.

Fixing that didn't help tst.multitrace.sh, though, so further digging found
and fixed two other problems, one relating to the victim process terminating
at just the wrong instant (while DTrace was carrying out libproc operations
on it), triggering a coredump, and the other relating to obsolete special-
casing in Ptrace() causing grabbing of processes being debugged by other
processes to be overlooked, with the system thinking we had grabbed it
ourselves when we hadn't (and trying to do ptrace() ops on things we haven't
actually grabbed had painful results).

Most of these bugs date back to 2013, but were very hard to spot before
noninvasive tracing was added, could in any case not be seen unless you had
multiple dtraces tracing the same process, and were hard to spot until the
new USDT dynamic discovery code started calling libproc operations much more
often.

Nick Alcock (5):
  Revert "Tweak self-armouring"
  proc: more self-grab improvements
  libproc: debugging improvements
  libproc: guard against Puntrace() of terminated processes
  libproc: drop Pgrab() special cases in Ptrace()

 libdtrace/dt_proc.c                  | 51 ++++++++++++++---
 libproc/Pcontrol.c                   | 86 +++++++++++++++++++++-------
 libproc/rtld_db.c                    |  2 +-
 test/unittest/usdt/tst.multitrace.sh | 17 +++++-
 4 files changed, 125 insertions(+), 31 deletions(-)

-- 
2.47.1.279.g84c5f4e78e

