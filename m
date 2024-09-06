Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D19518B04
	for <dtrace@lists.linux.dev>; Fri,  6 Sep 2024 03:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725593526; cv=fail; b=C3qSGqy8nL10cfG0Nc9yjzArYW5Q6IfPK0kGggM8igGec3uq9h2WuaLTWYZswJwFX9rG8E0KJh5HHLlSf6J3I+SFCeg5rE0uJ0i2vEtAUue9XEXRgTeKkXNVT8SqcNeSfzc+hBSbX/9K0/LpA+tX3QilhyPZKmWOqIzXfi/+QZ8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725593526; c=relaxed/simple;
	bh=nVLYCewJoUlx+94fiL/EwyE1uNRtFoE139cwYluTLeM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=iqAdQcHSuxI65U+3dh72SBdk2cr8m0p4TGnotbIrCmPAU3+jmuOdktTezO/qLE7HkLPy37nf6j930ZMbUtwvJDBtTrmHmiOK1zR4j4Gqv8/oAj2iu/uvrrMeLQ+lXV6b8WAd40xsNQWFYmyLkWrh4FD358stk/xuzO+MnL12jow=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=KWw88XNv; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=zeJ1yYde; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="KWw88XNv";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="zeJ1yYde"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 485LUo5M025393
	for <dtrace@lists.linux.dev>; Fri, 6 Sep 2024 03:31:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:cc:subject:message-id:references:content-type
	:in-reply-to:mime-version; s=corp-2023-11-20; bh=04/JODdzNc2AaQh
	7y8SD30yHPsYX7S9RnQ4MzOPhrK8=; b=KWw88XNvkioot0BDGnWaIU5IYbfYNa0
	APKycZZ2OMg0SP33c4KTFOD6kBM8WCPm8q++heX+RN90J6uNSZsAiKmDcnxEtobU
	Z9sQPRNknnFStaWxx7SN5jWEs+J/fJtc/Ue/O0LeamJ6cDE8oFeM5ugGlQmFxz79
	gOexovqvQzTAqlnbCu/DjwkBI0rKgCMaCpN7ZAdpRjHrcCKmTAuUinrijFAdRTej
	3sOkCSC5sfPu7oV2SSbax4xnV6cBsc2OaWIXmkmf5cWjrbR5EUKLKRnFhs121n8j
	0PKcGfEphz1YT2tP7dlg4A0QUJJ7FtHy0+gLNJXUCOR43E5+4ezFPxQ==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 41fhwnrp0n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 06 Sep 2024 03:31:58 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4861bOPr003353
	for <dtrace@lists.linux.dev>; Fri, 6 Sep 2024 03:31:57 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2176.outbound.protection.outlook.com [104.47.59.176])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 41fhyapqe9-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 06 Sep 2024 03:31:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wlJN47tEmcgI2DWbW+F+B+ACFhHbfDswEmel3o0KEjNnfRKWvUjLG2v75lsO3nfNs0bOKt0MHMzQrWGBmGx8dQIl6IfBQa4Gs/mNdQ3Y6h5URpOf6X/1u+44IP5KXaABHDTlM8i18pge4QYKtfVmLqGyCKmgaV7yKON+tWomGIsSVV+fjZGkZhaP5W4H6Sn/58m1dNo7IBP7eHjRr6PCCL12s9hufpCngoQtEryCNA107ggszV4IM0xYVl7Lwmd2a9I04zcKhm5aX7D+2UwCvrT+gHTtkfyw/D8ny17vUeUs+1kkXi/KceJdKoIePZg6e30fZdggfDk9USB4eohABA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=04/JODdzNc2AaQh7y8SD30yHPsYX7S9RnQ4MzOPhrK8=;
 b=dTJKgVdjSld6Q4n3rpkio/34SiFuFyk9gOkyS3ZCOTHLRHqIZpoP0l3Rpm8s8OB5cd78FWRXZY8lfk1qKNu7ax/2gf4dBW2PJR9zU7sQMa68rVurBtFD/sDqnW7fNGQzMkfTNF1tn5HbEDUs2OzKLvG0BgrryfaQ+DMfpFE0XKWH4g34H6FfUkKvtgf4I/DPTkhyDXHlBP9a+7MH74NplKzrjo1pZbC7XnYC0OagCRwOMX+hmD071ndLOWp0TYYgXY3XWCdTV0g6M/zxPu7pb0BziN9UCPzb77czCpDVcv9/pLMgc9h7TQ2uBDdAbPph8ILGVCIgGK7l2xBOIRxoQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=04/JODdzNc2AaQh7y8SD30yHPsYX7S9RnQ4MzOPhrK8=;
 b=zeJ1yYdelG4VyiMbnlZK3PZv8lTt0vZsjLTCBYpBc5GDj7hzP3dhljPpk2SkexF6K22TZ8++zbcNOFdCDLuBb8aVyEjx9GcR5TLSXPBIWviP4iZNLMqz+F0jCIwQVRru8qSqJRyZIpwYncjK0QmekEkmfl1fmoN1W+6qX7JZN5Y=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by IA3PR10MB8138.namprd10.prod.outlook.com (2603:10b6:208:515::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.25; Fri, 6 Sep
 2024 03:31:53 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%6]) with mapi id 15.20.7939.010; Fri, 6 Sep 2024
 03:31:52 +0000
Date: Thu, 5 Sep 2024 23:31:49 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH v2 03/19] Deprecate enabled probe ID (epid)
Message-ID: <Ztp3paXrmBIuigSb@oracle.com>
References: <20240903051643.17203-1-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240903051643.17203-1-eugene.loh@oracle.com>
X-ClientProxiedBy: BY1P220CA0024.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:5c3::9) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|IA3PR10MB8138:EE_
X-MS-Office365-Filtering-Correlation-Id: b48121f9-b2b8-4a6c-a9f5-08dcce247318
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?LhfEO/EsxFbo4cU12++xBioCEb/29J26FFdz7f5nHKwh5R7SRJPHU75nY6kF?=
 =?us-ascii?Q?cv2NVgMGmw2iFTNdo2X58w8K5+czBpRNeULZkK/xpYQNsxYF3NnHq7eLCeRv?=
 =?us-ascii?Q?NGbRcMJvxMipQl/y1kDEXDsYW8nWN/A7KyafVmC9C0qU2tlpJJV1ys3gImDy?=
 =?us-ascii?Q?LomlGdIWtCxqeyYjNKG7uw87rnkajOvKJFV93AN6jjzI5pPkyU0DyZM10b1D?=
 =?us-ascii?Q?N8Y1paLFChV6dT0dlVN+BL+Io8+r4Ghgsi6TJ6vS57laKnRaOqYCugq8kOD4?=
 =?us-ascii?Q?WG4t4Rbq1fEWXwsjC7Pr2obnP5N5DEkNExyFRrz5KY3aFA/I55XUVTndl775?=
 =?us-ascii?Q?KUOc4mu68qLD9FtGbRvG1ZUnGTT2yh/dcAjgaufSygRP7Iz4SnYxNxO//Smz?=
 =?us-ascii?Q?w2LhyFcq1PCYwSR1RR9Wqmd/qdzWIc06LjfJbZq4S/ppfLmmatTyTBhClZlJ?=
 =?us-ascii?Q?Xxjy0sPWa+u7mrUrAECI3BhEWKHwSvqkr3Lu5LDN9/PgNwZAOcUQK2ZpvLWD?=
 =?us-ascii?Q?y1PDfWXXQOmVG25gXUhPPZLaPJ58S2RgXvTiyx+VeKz3pCpm74Cv8P1KHxJb?=
 =?us-ascii?Q?EhZyz9S06PRRE8KEvN2UldHuW3GWYwx9aJokJEa48Owo1zUdCqQw99gC2zL0?=
 =?us-ascii?Q?5L9xXX06bklvCYMQ9fN4xf0d/NnWjOY10r9iy2n5gmwA8EnehKnV5Vo6SAO2?=
 =?us-ascii?Q?zpz8NHe8MQoZOkshzpl0T9b36YSXF0edp2O3P2haewMmzW3imjjdITHO8bTI?=
 =?us-ascii?Q?uZnRW95ly4NXLaVWmOEzLLfOxSGSbzKu9C0l9ZaP0CG/2i/FR/QJj93Qhupf?=
 =?us-ascii?Q?lH4B0dZUhROOy+I3x8IfFkl0AEKWSaYRO8wt8/07ZBNxbH0EjCh7O5EJBlNv?=
 =?us-ascii?Q?GWh3syk3f4rUP43uz3rVDS56m6SivODNmv62J9qdW+f0HfRYfhzUNfhkEOZS?=
 =?us-ascii?Q?N5uH9QP4ntYyMcCQT7/dqzEsUBZtjgwcexp/KjzUgLuVafe8LGZNksny4Pfr?=
 =?us-ascii?Q?faeLNsPsGpWupeXyQMNG9WikyulFzCHxePgRMzz+pwiMLrkutOpUw+DNzrav?=
 =?us-ascii?Q?gNAEzm0JOguRxpAb+bXh4a2hfs2kNP9FfbA3XyXthkrOaJRrc67NO9wq/7Bt?=
 =?us-ascii?Q?q7cbATRck97PsPLJ/HmDrFd3GHJyOrtRPPAFNzoJFUs3eIXQ+dMH/fhzMNy0?=
 =?us-ascii?Q?F89ayU84cGdTh67+L2iALiUYfJi2G8QW4zt5HjKFCoNb2VLKqMj/K0JKDJCF?=
 =?us-ascii?Q?eNHU8uK+RBmVeFt1p3kms6kqVk6IoDdxRAGhbiZrgnQSMj15/1Z2yz9qXxOH?=
 =?us-ascii?Q?NfPDpgeoIySu2srEohsNbqeD1uWhGaV/OmU8/zcvMk3yGPFRQF8KG3B3NdI2?=
 =?us-ascii?Q?WWKyIZo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1D8p5tbCikexPEFGQDq/FHGH5FlnmASy8klFR0BYEJSvwK4jo4x0FIdeCQ4T?=
 =?us-ascii?Q?wj6EQFFMMZKEC9Z2JZRpe/PRJW89sn72px0OCFyJ5OWhvb7XDUnrSfMnbLO/?=
 =?us-ascii?Q?KqJ+bItmBrV38+2v+0hsCbFFX/nRLPGFA9KaOVDo0jymuhAapq5xg3kXADzF?=
 =?us-ascii?Q?0oX+9dWZ3YH4qyArfLXkTEJ/djIwa9gLx0PVCpWxxjxtNjAzVR7iUHh92+6g?=
 =?us-ascii?Q?Bmk/6aOU8c38uu8BM1QnDBhq8p8iHCEJyMFSYqhrBxVVn14iwlJEsfscRxOR?=
 =?us-ascii?Q?uf22IEK/itq7vWrCuG/eNLSUz3YwO2NlzQKc6784m5tfonzBZGE6zadz9/ro?=
 =?us-ascii?Q?ZCrJDrA8UcyHyh3daOzjDVt6BYZW/i4iUpWrVikjp0svINYakjtayNgNfC7I?=
 =?us-ascii?Q?JucXNEVfnCf1BtpwyFDX5xz0nj0EUAvUOMwXyIUBRtvUpnXuEkWdLd6DTkUm?=
 =?us-ascii?Q?PFZvJa9bG8yKICR842xvaCiivUBi/S7h/Vg5RdfSbfxzTkyvRfpngF2U0yoY?=
 =?us-ascii?Q?B86Vzy0BTTR/ZGNJEGVw+/xBTc+orl3Cgkowy0vOSG7xrRlBmtTYQG4hMAjW?=
 =?us-ascii?Q?mq5eFBl2+ifaTyK3y2t9NFZc0l8EU779jeZPYBJgkspQtam4KvP3k8kBLPuR?=
 =?us-ascii?Q?N+19qF4NlubFwA+WoTCJCsddHYiAFgj3JC2uV4AZSkVSemGH7lVDh0WXRDS2?=
 =?us-ascii?Q?GHatAm3EkxCLrsowo/gPyaSOlWDwRDSMhAawcCRZsxfnsqrMhPZXrw1uPOk2?=
 =?us-ascii?Q?17g1+n7wj21fthyw1H+l3jLGkffnvVfV+gPOr+lAvUy8xEBH+yo9tK4ynctc?=
 =?us-ascii?Q?5/73mrm4B/lmVLIljrbi3JbcDMvgRxDPQ1NuaZuf4m0MyKStCe6w1NrP+NUe?=
 =?us-ascii?Q?Fgo7W298s7coh33agMvD1ns7JAOEJj5e5Se/e0wXjHgaAQvpBFoFFF2PNHoR?=
 =?us-ascii?Q?zQZ3YnnD70hj7ifouvasbWpLm0U3oU13+Afo9stK0jKKFpQpl2g/tG1IrZvK?=
 =?us-ascii?Q?+v43dCuDPHdQNPKYyAFtOah0EmG4iONl0u+Xtd51CDBw+W0khZS3ILiRYA2r?=
 =?us-ascii?Q?T+1YBNSqXAp0vsb/SAC5wjjNcChpSCEmtrl/aOoqyo10NvekRd6ETKepFgtM?=
 =?us-ascii?Q?/K6z5XG7UA2oq+iVSSflYvAbQ9yBXGkgPcygMxmM2WMn/aKQO5g9RHx1WTOM?=
 =?us-ascii?Q?kvqxfJpF9Y3zt7CZO2M2YwrACjsvXzRZktjSs+gRGREOFDIjZ+i9pTunQeSn?=
 =?us-ascii?Q?whfN+gCV8ZDbOSlPUdOKy6EuHmdu07csby39AxezcuXjoWXTAWkCz3ZbNt7P?=
 =?us-ascii?Q?6uQG008u4odrS2EfLSOf7j2dF+BOp56tXlt9sGoIP2G13HdMmyimEcnuLWvo?=
 =?us-ascii?Q?OzHzyX7sdbbxNsldMRstbRtF8z4IrD9FLxN01yU7o3I5C0FXpNITSJvRwxjC?=
 =?us-ascii?Q?BgPQ1uMXgGh0wgzvDao5Gm3TRwfhNIpx7rYheJnJwSNbAvmtibSZgxgsRD01?=
 =?us-ascii?Q?lCpOCOHBms4+vcsq85L5Nykf/awnm/HJ6f3nBn0DPYEfVZg7KfWYL7qxgBl/?=
 =?us-ascii?Q?yxefYQhjP3kfhvmMGrGtRK2a7iysvjxBwWyyynF1S4QyE4HUBU6W4q9Bs9LA?=
 =?us-ascii?Q?Wg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Kh7LxmEcgjJmCVmzwu38aLeDQoPhaGH+5g4h94QZrDI4vUSawvzVj6QNzZl1o3Jvzjm5Rtlf5bWB7o63qPfWb1bXjTHER9BGYmkbiYP4BBXYEaJGQYy0EFIzWCwWNRAtvzQrflhvU7duTkDwVeeM/GCsa+xXSGOecAAg9ot7EGEvYvW0y0I5+S4W/g5hqZFXk0aM+nX2jTFGN86UAywYzrPhCQtcekg3bu7g2ZwslayGQT0BhafCffZcINqxtfbWrIovXDJvHBrdY7+aL0oPBBkg4tBwj0eMmSEQeKnexCj234Mtls9Mp4QXov3fhy9HqSQuvC9vpj/CDqeCUC/mThOyyGlo4PUjjPq5UziRwfZTSgZa+ZqyHrZV2nI4uGBqFeJS6BnTNIvDy6Weab86LPny7h36rhJn+u1/kzoBxF7IM0P0/31mb0YtTfGJw3q05Em0Cwkuu7vZ54EKS9D4b+qXD+isuS2DT6vbYMX1z3qrf5xa8A5yrodiAV/2nvssIj3cu1NjZ3AcxKFm37SKE/IdvkWjBK8W3EMwC9lFmVZvFQ2ibNFGm2T/Ng09XqpFVEIckUuUurAttZwVReQSV4tLTjy8sYiiJ7hUM5rF2Qo=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b48121f9-b2b8-4a6c-a9f5-08dcce247318
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2024 03:31:52.8206
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ssbx6UKXa/t1vOFE5J6HRLszM9FHw1+rF/7YRNTgjxpLJzJ8A4aN+VG8czqW9EHtmoCrIVpW9jTjqz4+agwPKxzxZq2m/5vkwDdO1D+zyR4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB8138
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-05_17,2024-09-05_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 mlxlogscore=999
 suspectscore=0 spamscore=0 malwarescore=0 bulkscore=0 adultscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2408220000 definitions=main-2409060024
X-Proofpoint-GUID: J1cN2HYWBqM5NjgFQVO4XNzdGmqkP0HN
X-Proofpoint-ORIG-GUID: J1cN2HYWBqM5NjgFQVO4XNzdGmqkP0HN

Great work!  Some comments below...

Note that with this work, we are breaking the libdtrace API - but that might
be a small price to pay for cleaning up some needed things.  However, that
also means that we could just break it a tiny bit more and make things easier,
perhaps.  (Yes, that goes a bit against my earlier advice but it really makes
no sense (in retrospect) to keep supporting something that we are breaking in
others ways anyway.)

See below for details...

On Tue, Sep 03, 2024 at 01:16:43AM -0400, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> Historically, the enabled probe id (epid) was an integer, passed from
> producer to consumer, that uniquely identified probe ID and statement
> (data description).  It was presumably the sole value written in a
> default action.  It was used in error reporting and was available to
> D users via a built-in variable "epid".

I would take out the mention of the default action.  Not really relevant here
and in all, the fact that it was documented that way was rather odd anyway
because it exposed implementation details that are not really relevant to a
user anyway.

And looking at the implementation prior to this patch, it certainly was not
the sole value written to the trace buffer anyway.

> However, its value was opaque and therefore difficult to use.

I would drop this sentence.  I think the preceding paragraph sufficiently
describes it.  And you risk confusing the reader concerning whether the epipd
was difficult to use in the dtrace internals or as a user (who won't read this
anyway).

> Deprecate the use of EPID:
> 
> *)  Have the producer pass to the consumer the probe ID and statement
>     ID explicitly, instead of passing an opaque integer that requires
>     additional lookup tables.
> 
> *)  Keep an array dt_stmts[] of statements, from which we can retrieve
>     probe descriptions and data descriptions.
> 
> *)  Remove data structures related to epid: dt_ddesc[], dt_pdesc[],
>     dt_nextepid, dt_maxprobe, etc.
> 
> Nevertheless, continue to provide a value for the built-in "epid" variable
> for back compatability.  Expand the epid from 4 bytes to 8 bytes:  the
> upper half is the probe ID and the lower half the statement ID.
> 
> The output buffer (written by the producer, read by the consumer) is
> rearranged slightly.  Note that:
> 
> *)  We need to start with a 4-byte size, which we treat as a pad.
> 
> *)  The beginning of the output buffer should have 8-byte alignment.
> 
> *)  The beginning of the trace data within the output buffer should
>     also have 8-byte alignment.
> 
> *)  So we rearrange as follows:
> 
>             old                        new
> 
>          0: pad (size)                 pad (size) <= buffer start
>          4: pad (additional)           specid
>          8: epid <= buffer start       prid
>         12: specid                     stid
>         16: data[n]                    data[n]
> 
>     So now, we say there is no longer an 8-byte pad before the
>     buffer start;  rather, the buffer starts with a 4-byte pad.

I am not sure whether this layout comparison is comprehensible to anyone not
familiar with this code.  It may need a bit more explanation concerning how
this is used.  E.g. the size that is referred to above is a 32-bit integer
emitted by the perf ring buffer code, giving the size of the data blob that
follows.  And this is the reason that we need to do this little shuffle with
the padding because (1) data needs to be written to the temporary buffer
storage with proper alignment, (2) data should be aligned in the ring buffer,
and (3) the perf event header + this size results in the data starting at
a multiple of 8 + 4, i.e. not a 8-byte boundary.

> For error reporting:
> 
> *)  Report errors in terms of the probe ID (and description) and the
>     clause function name, which is decipherable in terms of the
>     disassembly output.  Specifically, change ERROR-probe arguments:
> 
>     -)  arg1 changes from epid to the probe ID
> 
>     -)  arg2 changes from "clause index" (which is no longer needed)
>         to the statement ID that identifies the clause named in
>         disassembly output
> 
> *)  No longer report the "action number", which has lost much of its
>     meaning in the port to eBPF.
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
> ---
>  bpf/get_bvar.c                                |  6 +-
>  bpf/probe_error.c                             |  8 +-
>  include/dtrace/metadesc.h                     |  4 +-
>  include/dtrace/universal.h                    |  3 +-
>  libdtrace/dt_bpf.c                            |  2 -
>  libdtrace/dt_bpf.h                            | 46 +++++-----
>  libdtrace/dt_cc.c                             | 40 +++-----
>  libdtrace/dt_cg.c                             | 56 +++++------
>  libdtrace/dt_consume.c                        | 74 ++++++++-------
>  libdtrace/dt_dctx.h                           | 21 +++--
>  libdtrace/dt_dlibs.c                          |  2 -
>  libdtrace/dt_handle.c                         | 40 ++++----
>  libdtrace/dt_impl.h                           | 11 +--
>  libdtrace/dt_map.c                            | 92 +------------------
>  libdtrace/dt_open.c                           |  5 +-
>  libdtrace/dt_program.c                        |  9 +-
>  libdtrace/dtrace.h                            |  4 +-
>  test/demo/builtin/eipd.d                      |  4 -
>  test/demo/dtrace/error.r                      |  2 +-
>  test/demo/spec/specopen.d                     |  5 +-
>  test/stress/buffering/tst.resize3-manual.r    |  2 +-
>  test/stress/buffering/tst.resize3.r           |  2 +-
>  test/unittest/actions/setopt/tst.badopt.r     | 14 +--
>  .../arrays/tst.declared-bounds.runtime_out.r  |  2 +-
>  test/unittest/builtinvar/tst.id_ERROR.r.p     |  2 +-
>  test/unittest/codegen/err.deref_0.r           |  2 +-
>  test/unittest/codegen/err.deref_1.r           |  2 +-
>  test/unittest/codegen/err.deref_i0.r          |  2 +-
>  test/unittest/codegen/err.deref_i1.r          |  2 +-
>  .../unittest/codegen/err.deref_string-assoc.r |  2 +-
>  test/unittest/codegen/err.deref_string-gvar.r |  2 +-
>  test/unittest/codegen/err.deref_string-lvar.r |  2 +-
>  test/unittest/codegen/err.deref_string-tvar.r |  2 +-
>  .../codegen/err.str_NULL_plus_offset-assoc.r  |  2 +-
>  .../codegen/err.str_NULL_plus_offset-lvar.r   |  2 +-
>  .../codegen/err.str_NULL_plus_offset-tvar.r   |  2 +-
>  .../codegen/err.str_NULL_plus_offset.r        |  2 +-
>  test/unittest/disasm/tst.vartab-bvar.r        |  2 +-
>  test/unittest/drops/drp.DTRACEDROP_DBLERROR.r |  2 +-
>  .../tst.DTRACEFLT_BADADDR.null_ptr_field.d    |  6 +-
>  .../tst.DTRACEFLT_BADADDR.null_ptr_field.r    |  2 +-
>  test/unittest/error/tst.DTRACEFLT_BADADDR.r   |  4 +-
>  test/unittest/error/tst.DTRACEFLT_BADADDR2.r  |  4 +-
>  .../error/tst.DTRACEFLT_DIVZERO.div.d         | 11 ++-
>  .../error/tst.DTRACEFLT_DIVZERO.div.r         |  2 +-
>  .../error/tst.DTRACEFLT_DIVZERO.mod.d         | 11 ++-
>  .../error/tst.DTRACEFLT_DIVZERO.mod.r         |  2 +-
>  test/unittest/error/tst.DTRACEFLT_UNKNOWN.r   |  4 +-
>  .../error/tst.clause_scope-begin-ended.r      |  2 +-
>  test/unittest/error/tst.clause_scope-begin.r  |  2 +-
>  .../unittest/error/tst.clause_scope-regular.r |  2 +-
>  .../error/tst.clause_scope-regular.r.p        |  8 +-
>  test/unittest/error/tst.error.r               |  2 +-
>  test/unittest/error/tst.errorend.r            |  2 +-
>  .../alloca/err.alloca-bcopy-before-beyond.r   |  2 +-
>  .../alloca/err.alloca-bcopy-before-bottom.r   |  2 +-
>  .../alloca/err.alloca-bcopy-beyond-top.r      |  2 +-
>  .../alloca/err.alloca-bcopy-crossing-bottom.r |  2 +-
>  .../alloca/err.alloca-bcopy-crossing-top.r    |  2 +-
>  .../alloca/err.alloca-crossing-clauses.r      |  2 +-
>  .../alloca/err.alloca-load-before-bottom.r    |  2 +-
>  .../funcs/alloca/err.alloca-load-beyond-top.r |  2 +-
>  .../alloca/err.alloca-load-crossing-bottom.r  |  2 +-
>  .../alloca/err.alloca-null-deref-lvalue.r     |  2 +-
>  .../funcs/alloca/err.alloca-null-deref.r      |  2 +-
>  .../err.alloca-scratch-exceeding-bcopy.r      |  2 +-
>  .../alloca/err.alloca-store-before-bottom.r   |  2 +-
>  .../alloca/err.alloca-store-beyond-top.r      |  2 +-
>  .../alloca/err.alloca-store-crossing-bottom.r |  2 +-
>  test/unittest/funcs/bcopy/err.badbcopy1.r     |  2 +-
>  test/unittest/funcs/bcopy/err.badbcopy4.r     |  2 +-
>  test/unittest/funcs/bcopy/err.badbcopy5.r     |  2 +-
>  test/unittest/funcs/bcopy/err.badbcopy6.r     |  2 +-
>  test/unittest/funcs/bcopy/err.badbcopy7.r     |  2 +-
>  test/unittest/funcs/bcopy/err.badbcopy8.r     |  2 +-
>  test/unittest/funcs/copyin/err.badaddr.r      |  2 +-
>  test/unittest/funcs/copyin/err.null_arg1.r    |  2 +-
>  test/unittest/funcs/copyinstr/err.badaddr.r   |  2 +-
>  test/unittest/funcs/copyinstr/err.null_arg1.r |  2 +-
>  test/unittest/funcs/copyinto/err.badaddr.r    |  2 +-
>  test/unittest/funcs/copyinto/err.badsize.r    |  2 +-
>  test/unittest/funcs/copyinto/err.null_arg1.r  |  2 +-
>  test/unittest/funcs/err.badalloca.r           |  2 +-
>  test/unittest/funcs/err.badalloca.r.p         |  8 +-
>  test/unittest/funcs/err.link_ntopbadaddr.r    |  2 +-
>  test/unittest/funcs/err.link_ntopbadarg.r     |  2 +-
>  .../inet_ntoa6/err.inet_ntoa6.arg1_null.r     |  2 +-
>  .../err.inet_ntoa6.arg1_null_const.r          |  2 +-
>  test/unittest/funcs/strlen/tst.null.r         |  2 +-
>  test/unittest/funcs/strtok/tst.strtok_null.r  |  2 +-
>  .../funcs/strtok/tst.strtok_nulldel.r         |  2 +-
>  .../funcs/strtok/tst.strtok_nullstr.r         |  2 +-
>  .../funcs/strtok/tst.strtok_nullstr2.r        |  2 +-
>  .../funcs/substr/err.substr_null_arg1.r       |  2 +-
>  test/unittest/pointers/err.AllocaOverrun.r    |  2 +-
>  test/unittest/pointers/err.BadAlign.r         |  2 +-
>  test/unittest/pointers/err.InvalidAddress2.r  |  2 +-
>  test/unittest/pointers/err.InvalidAddress4.r  |  2 +-
>  .../speculation/err.CommitWithInvalid.r       |  2 +-
>  .../speculation/err.DiscardWithInvalid.r      |  2 +-
>  test/unittest/speculation/tst.negcommit.r     |  2 +-
>  .../unittest/variables/bvar/tst.arg3-ERROR.sh |  2 +-
>  102 files changed, 284 insertions(+), 366 deletions(-)
>  delete mode 100644 test/demo/builtin/eipd.d
> 
> diff --git a/bpf/get_bvar.c b/bpf/get_bvar.c
> index a0c04f3a..e9733bb1 100644
> --- a/bpf/get_bvar.c
> +++ b/bpf/get_bvar.c
> @@ -48,8 +48,10 @@ noinline uint64_t dt_get_bvar(const dt_dctx_t *dctx, uint32_t id, uint32_t idx)
>  			mst->tstamp = bpf_ktime_get_ns();
>  
>  		return mst->tstamp;
> -	case DIF_VAR_EPID:
> -		return mst->epid;
> +	case DIF_VAR_EPID: {
> +		uint64_t val = mst->prid;
> +		return (val << 32) | mst->stid;

Why not just:

		return ((uint64_t)mst->prid << 32) | mst->stid;

> +	}
>  	case DIF_VAR_ID:
>  		return mst->prid;
>  	case DIF_VAR_ARG0: case DIF_VAR_ARG1: case DIF_VAR_ARG2:
> diff --git a/bpf/probe_error.c b/bpf/probe_error.c
> index ee1a1793..bd40496f 100644
> --- a/bpf/probe_error.c
> +++ b/bpf/probe_error.c
> @@ -16,8 +16,8 @@ extern int64_t dt_error(const dt_dctx_t *dctx);
>  /*
>   * DTrace ERROR probes provide 6 arguments:
>   *	arg0 = always NULL (used to be kernel consumer state pointer)
> - *	arg1 = EPID of probe that triggered the fault
> - *	arg2 = clause index of code that triggered the fault
> + *	arg1 = ID of probe that triggered the fault

ID of probe -> probe ID

> + *	arg2 = statement index that triggered the fault

statement index -> statement ID

(This is a comment for the entire patch - we should be consistent whether it
 is a statement index or a statement ID.  For consistency, I would very much
 prefer statement ID.)

>   *	arg3 = BPF offset in the clause that triggered the fault (or -1)
>   *	arg4 = fault type
>   *	arg5 = fault-specific value (usually address being accessed or 0)
> @@ -29,8 +29,8 @@ noinline void dt_probe_error(const dt_dctx_t *dctx, uint64_t pc, uint64_t fault,
>  	int		oldprid = mst->prid;
>  
>  	mst->argv[0] = 0;
> -	mst->argv[1] = mst->epid;
> -	mst->argv[2] = mst->clid;
> +	mst->argv[1] = mst->prid;
> +	mst->argv[2] = mst->stid;
>  	mst->argv[3] = pc;
>  	mst->argv[4] = fault;
>  	mst->argv[5] = illval;
> diff --git a/include/dtrace/metadesc.h b/include/dtrace/metadesc.h
> index ab9061f7..41125ff1 100644
> --- a/include/dtrace/metadesc.h
> +++ b/include/dtrace/metadesc.h
> @@ -19,8 +19,8 @@
>  
>  /*
>   * DTrace separates the trace data stream from the metadata stream.  The only
> - * metadata tokens placed in the data stream are enabled probe identifiers
> - * (EPIDs) or (in the case of aggregations) aggregation identifiers.  In order
> + * metadata tokens placed in the data stream are probe and statement identifiers
> + * or (in the case of aggregations) aggregation identifiers.  In order
>   * to determine the structure of the data, DTrace uses the token to perform a
>   * lookup to retrieve the corresponding description of the enabled probe (via
>   * the dtrace_datadesc structure) or the aggregation (via the dtrace_aggdesc
> diff --git a/include/dtrace/universal.h b/include/dtrace/universal.h
> index d6562489..325586e5 100644
> --- a/include/dtrace/universal.h
> +++ b/include/dtrace/universal.h
> @@ -17,7 +17,6 @@
>  
>  #define	DTRACE_CPUALL		-1	/* all CPUs */
>  #define	DTRACE_IDNONE		0	/* invalid probe identifier */
> -#define	DTRACE_EPIDNONE		0	/* invalid enabled probe identifier */
>  #define	DTRACE_AGGIDNONE	0	/* invalid aggregation identifier */
>  #define	DTRACE_AGGVARIDNONE	0	/* invalid aggregation variable ID */
>  #define	DTRACE_CACHEIDNONE	0	/* invalid predicate cache */
> @@ -37,7 +36,7 @@ typedef uint16_t	dtrace_actkind_t;	/* action kind */
>  
>  typedef uint32_t	dtrace_aggid_t;		/* aggregation identifier */
>  typedef uint32_t	dtrace_cacheid_t;	/* predicate cache identifier */
> -typedef uint32_t	dtrace_epid_t;		/* enabled probe identifier */
> +typedef uint32_t	dtrace_stid_t;		/* statement identifier */
>  typedef uint32_t	dtrace_optid_t;		/* option identifier */
>  typedef uint32_t	dtrace_specid_t;	/* speculation identifier */
>  
> diff --git a/libdtrace/dt_bpf.c b/libdtrace/dt_bpf.c
> index 70597d65..3f9c42ea 100644
> --- a/libdtrace/dt_bpf.c
> +++ b/libdtrace/dt_bpf.c
> @@ -774,7 +774,6 @@ gmap_create_cpuinfo(dtrace_hdl_t *dtp)
>   * The size of the memory region is the sum of:
>   *	- size of the DTrace machine state, rounded up to the nearest
>   *	  multiple of 8
> - *	- 8 bytes padding for trace buffer alignment purposes
>   *	- maximum trace buffer record size, rounded up to the nearest
>   *	  multiple of 8
>   *	- size of dctx->mem (see dt_dctx.h)
> @@ -783,7 +782,6 @@ static int
>  gmap_create_mem(dtrace_hdl_t *dtp)
>  {
>  	size_t	sz = roundup(sizeof(dt_mstate_t), 8) +
> -		     8 +
>  		     roundup(dtp->dt_maxreclen, 8) +
>  		     DMEM_SIZE(dtp);
>  
> diff --git a/libdtrace/dt_bpf.h b/libdtrace/dt_bpf.h
> index 5b2df264..5716d232 100644
> --- a/libdtrace/dt_bpf.h
> +++ b/libdtrace/dt_bpf.h
> @@ -32,30 +32,28 @@ extern "C" {
>  					(dtp)->dt_bpffeatures |= (feat); \
>  				} while (0)
>  
> -#define DT_CONST_EPID			1
> -#define DT_CONST_PRID			2
> -#define DT_CONST_CLID			3
> -#define DT_CONST_ARGC			4
> -#define DT_CONST_STBSZ			5
> -#define DT_CONST_STRSZ			6
> -#define DT_CONST_STKSIZ			7
> -#define DT_CONST_BOOTTM			8
> -#define DT_CONST_NSPEC			9
> -#define DT_CONST_NCPUS			10
> -#define DT_CONST_PC			11
> -#define DT_CONST_TUPSZ			12
> -#define DT_CONST_TASK_PID		13
> -#define DT_CONST_TASK_TGID		14
> -#define DT_CONST_TASK_REAL_PARENT	15
> -#define DT_CONST_TASK_COMM		16
> -#define DT_CONST_MUTEX_OWNER		17
> -#define DT_CONST_RWLOCK_CNTS		18
> -#define DT_CONST_DCTX_RODATA		19
> -#define DT_CONST_RODATA_OFF		20
> -#define DT_CONST_RODATA_SIZE		21
> -#define DT_CONST_ZERO_OFF		22
> -#define DT_CONST_STACK_OFF		23
> -#define DT_CONST_STACK_SKIP		24
> +#define DT_CONST_PRID			1
> +#define DT_CONST_ARGC			2
> +#define DT_CONST_STBSZ			3
> +#define DT_CONST_STRSZ			4
> +#define DT_CONST_STKSIZ			5
> +#define DT_CONST_BOOTTM			6
> +#define DT_CONST_NSPEC			7
> +#define DT_CONST_NCPUS			8
> +#define DT_CONST_PC			9
> +#define DT_CONST_TUPSZ			10
> +#define DT_CONST_TASK_PID		11
> +#define DT_CONST_TASK_TGID		12
> +#define DT_CONST_TASK_REAL_PARENT	13
> +#define DT_CONST_TASK_COMM		14
> +#define DT_CONST_MUTEX_OWNER		15
> +#define DT_CONST_RWLOCK_CNTS		16
> +#define DT_CONST_DCTX_RODATA		17
> +#define DT_CONST_RODATA_OFF		18
> +#define DT_CONST_RODATA_SIZE		19
> +#define DT_CONST_ZERO_OFF		20
> +#define DT_CONST_STACK_OFF		21
> +#define DT_CONST_STACK_SKIP		22
>  
>  #define DT_BPF_LOG_SIZE_DEFAULT	(UINT32_MAX >> 8)
>  #define DT_BPF_LOG_SIZE_SMALL	4096
> diff --git a/libdtrace/dt_cc.c b/libdtrace/dt_cc.c
> index d1ee3843..0c9856af 100644
> --- a/libdtrace/dt_cc.c
> +++ b/libdtrace/dt_cc.c
> @@ -123,6 +123,7 @@ dt_stmt_create(dtrace_hdl_t *dtp, dtrace_ecbdesc_t *edp,
>  	if (sdp == NULL)
>  		longjmp(yypcb->pcb_jmpbuf, EDT_NOMEM);
>  
> +	sdp->dtsd_index = dtp->dt_clause_nextid++;

dtsd_index -> dtsd_id
dt_clause_nextid -> dt_stmt_nextid

The mixing of index and id is just confusing - let's stick with id.
Also, since you're working with statements now, referring to clause also adds
to the confusion.  There is a one-to-one relation between statements and
clauses so using dt_stmt_nextid for both makes total sense.

>  	assert(yypcb->pcb_stmt == NULL);
>  	yypcb->pcb_stmt = sdp;
>  	yypcb->pcb_maxrecs = 0;
> @@ -133,8 +134,8 @@ dt_stmt_create(dtrace_hdl_t *dtp, dtrace_ecbdesc_t *edp,
>  	return sdp;
>  }
>  
> -static dt_ident_t *
> -dt_clause_create(dtrace_hdl_t *dtp, dtrace_difo_t *dp)
> +static void
> +dt_clause_create(dtrace_hdl_t *dtp, dtrace_difo_t *dp, dtrace_stmtdesc_t *sdp)

Given the new functionality (not returning an identifier but rather operating
on the statement directly, this should be renamed.

I suggest dt_stmt_set_clause().

>  {
>  	char		*name;
>  	int		len;
> @@ -156,12 +157,12 @@ dt_clause_create(dtrace_hdl_t *dtp, dtrace_difo_t *dp)
>  	/*
>  	 * Generate a symbol name.
>  	 */
> -	len = snprintf(NULL, 0, "dt_clause_%d", dtp->dt_clause_nextid) + 1;
> +	len = snprintf(NULL, 0, "dt_clause_%d", sdp->dtsd_index) + 1;
>  	name = dt_alloc(dtp, len);
>  	if (name == NULL)
>  		longjmp(yypcb->pcb_jmpbuf, EDT_NOMEM);
>  
> -	snprintf(name, len, "dt_clause_%d", dtp->dt_clause_nextid++);
> +	snprintf(name, len, "dt_clause_%d", sdp->dtsd_index);

Here (and elsewhere) this should be replaced by:

	if (asprintf(&name, "dt_clause_%d", sdp->dtsd_id) == -1)
		longjmp(yypcb->pcb_jmpbuf, EDT_NOMEM);

>  	/*
>  	 * Add the symbol to the BPF identifier table and associate the DIFO
> @@ -174,7 +175,7 @@ dt_clause_create(dtrace_hdl_t *dtp, dtrace_difo_t *dp)
>  
>  	dt_ident_set_data(idp, dp);
>  
> -	return idp;
> +	sdp->dtsd_clause = idp;
>  }
>  
>  static void
> @@ -214,7 +215,7 @@ dt_compile_one_clause(dtrace_hdl_t *dtp, dt_node_t *cnp, dt_node_t *pnp)
>  	 * Compile the clause (predicate and action).
>  	 */
>  	dt_cg(yypcb, cnp);
> -	sdp->dtsd_clause = dt_clause_create(dtp, dt_as(yypcb));
> +	dt_clause_create(dtp, dt_as(yypcb), sdp);

	dt_stmt_set_clause(dtp, dt_as(yypcb), sdp);

>  	assert(yypcb->pcb_stmt == sdp);
>  	if (dtrace_stmt_add(yypcb->pcb_hdl, yypcb->pcb_prog, sdp) != 0)
> @@ -947,7 +948,7 @@ static int get_boottime() {
>  static int
>  dt_link_construct(dtrace_hdl_t *dtp, const dt_probe_t *prp, dtrace_difo_t *dp,
>  		  dt_ident_t *idp, const dtrace_difo_t *sdp, uint_t *pcp,
> -		  uint_t *rcp, uint_t *vcp, dtrace_epid_t epid, uint_t clid)
> +		  uint_t *rcp, uint_t *vcp)
>  {
>  	uint_t			pc = *pcp;
>  	uint_t			rc = *rcp;
> @@ -958,7 +959,6 @@ dt_link_construct(dtrace_hdl_t *dtp, const dt_probe_t *prp, dtrace_difo_t *dp,
>  	uint_t			len = sdp->dtdo_brelen;
>  	const dof_relodesc_t	*rp = sdp->dtdo_breltab;
>  	dof_relodesc_t		*nrp = &dp->dtdo_breltab[rc];
> -	dtrace_id_t		prid = prp->desc->id;
>  	int			no_deps = 0;
>  
>  	if (idp != NULL) {
> @@ -1029,7 +1029,6 @@ dt_link_construct(dtrace_hdl_t *dtp, const dt_probe_t *prp, dtrace_difo_t *dp,
>  	for (; len != 0; len--, rp++, nrp++) {
>  		const char	*name = dt_difo_getstr(sdp, rp->dofr_name);
>  		dtrace_difo_t	*rdp;
> -		dtrace_epid_t	nepid;
>  		int		ipc;
>  
>  		idp = dt_dlib_get_sym(dtp, name);
> @@ -1044,15 +1043,9 @@ dt_link_construct(dtrace_hdl_t *dtp, const dt_probe_t *prp, dtrace_difo_t *dp,
>  			}
>  
>  			switch (idp->di_id) {
> -			case DT_CONST_EPID:
> -				nrp->dofr_data = epid;
> -				continue;
>  			case DT_CONST_PRID:
>  				nrp->dofr_data = prp->desc->id;
>  				continue;
> -			case DT_CONST_CLID:
> -				nrp->dofr_data = clid;
> -				continue;
>  			case DT_CONST_ARGC:
>  				nrp->dofr_data = 0;	/* FIXME */
>  				continue;
> @@ -1196,11 +1189,6 @@ dt_link_construct(dtrace_hdl_t *dtp, const dt_probe_t *prp, dtrace_difo_t *dp,
>  			case DT_CONST_STACK_SKIP:
>  				nrp->dofr_data = prp->prov->impl->stack_skip;
>  				continue;
> -			default:
> -				/* probe name -> value is probe id */
> -				if (strchr(idp->di_name, ':') != NULL)
> -					prid = rp->dofr_data;
> -				continue;
>  			}
>  
>  			continue;
> @@ -1216,13 +1204,8 @@ dt_link_construct(dtrace_hdl_t *dtp, const dt_probe_t *prp, dtrace_difo_t *dp,
>  			rdp = dt_dlib_get_func_difo(dtp, idp);
>  			if (rdp == NULL)
>  				return -1;
> -			if (rdp->dtdo_ddesc != NULL) {
> -				nepid = dt_epid_add(dtp, rdp->dtdo_ddesc, prid);
> -				clid++;
> -			} else
> -				nepid = 0;
>  			ipc = dt_link_construct(dtp, prp, dp, idp, rdp, pcp,
> -						rcp, vcp, nepid, clid);
> +						rcp, vcp);
>  			if (ipc == -1)
>  				return -1;
>  
> @@ -1263,7 +1246,7 @@ dt_link_resolve(dtrace_hdl_t *dtp, dtrace_difo_t *dp)
>  			continue;
>  
>  		/*
> -		 * We are only relocating constants (EPID and ARGC) and call
> +		 * We are only relocating constants and call
>  		 * instructions to functions that have been linked in.

You might as well fix the comment block to be:

		 * We are only relocating constants and call instructions to
		 * functions that have been linked in.


>  		 */
>  		switch (idp->di_kind) {
> @@ -1336,8 +1319,7 @@ dt_link(dtrace_hdl_t *dtp, const dt_probe_t *prp, dtrace_difo_t *dp,
>  	 */
>  	insc = relc = varc = 0;
>  
> -	rc = dt_link_construct(dtp, prp, fdp, idp, dp, &insc, &relc, &varc, 0,
> -			       0);
> +	rc = dt_link_construct(dtp, prp, fdp, idp, dp, &insc, &relc, &varc);
>  	dt_dlib_reset(dtp, B_FALSE);
>  	if (rc == -1)
>  		goto fail;
> diff --git a/libdtrace/dt_cg.c b/libdtrace/dt_cg.c
> index a7861829..a849c936 100644
> --- a/libdtrace/dt_cg.c
> +++ b/libdtrace/dt_cg.c
> @@ -277,15 +277,9 @@ dt_cg_tramp_prologue_act(dt_pcb_t *pcb, dt_activity_t act)
>  	 *	buf = rc + roundup(sizeof(dt_mstate_t), 8);
>  	 *				// add %r0, roundup(
>  	 *						sizeof(dt_mstate_t), 8)
> -	 *	*((uint64_t *)&buf[0]) = 0;
> -	 *				// stdw [%r0 + 0], 0
> -	 *	buf += 8;		// add %r0, 8
> -	 *				//     (%r0 = pointer to buffer space)
>  	 *	dctx.buf = buf;		// stdw [%r9 + DCTX_BUF], %r0
>  	 */
>  	emit(dlp,  BPF_ALU64_IMM(BPF_ADD, BPF_REG_0, roundup(sizeof(dt_mstate_t), 8)));
> -	emit(dlp,  BPF_STORE_IMM(BPF_DW, BPF_REG_0, 0, 0));
> -	emit(dlp,  BPF_ALU64_IMM(BPF_ADD, BPF_REG_0, 8));
>  	emit(dlp,  BPF_STORE(BPF_DW, BPF_REG_9, DCTX_BUF, BPF_REG_0));
>  
>  	/*
> @@ -1047,7 +1041,8 @@ dt_cg_tramp_error(dt_pcb_t *pcb)
>   *
>   *	- Store the base pointer to the output data buffer in %r9.
>   *	- Initialize the machine state (dctx->mst).
> - *	- Store the epid at [%r9 + DBUF_EPID].
> + *	- Store the prid at [%r9 + DBUF_PRID].
> + *	- Store the stid at [%r9 + DBUF_STID].
>   *	- Store 0 to indicate no active speculation at [%r9 + DBUF_SPECID].

Since you changed the order of these values, perhaps change the order in which
they are stored as well.  That is less confusing.  (Yes, we use symbols to
represent the offsets but still...)

>   *	- Evaluate the predicate expression and return if false.
>   *
> @@ -1057,11 +1052,6 @@ static void
>  dt_cg_prologue(dt_pcb_t *pcb, dt_node_t *pred)
>  {
>  	dt_irlist_t	*dlp = &pcb->pcb_ir;
> -	dt_ident_t	*epid = dt_dlib_get_var(pcb->pcb_hdl, "EPID");
> -	dt_ident_t	*clid = dt_dlib_get_var(pcb->pcb_hdl, "CLID");
> -
> -	assert(epid != NULL);
> -	assert(clid != NULL);
>  
>  	/*
>  	 * void dt_program(dt_dctx_t *dctx)
> @@ -1093,18 +1083,20 @@ dt_cg_prologue(dt_pcb_t *pcb, dt_node_t *pred)
>  	 *				// stdw [%r0 + DMST_FAULT], 0
>  	 *	dctx->mst->tstamp = 0;	// stdw [%r0 + DMST_TSTAMP], 0
>  	 *	dctx->mst->specsize = 0;// stdw [%r0 + DMST_SPECSIZE], 0
> -	 *	dctx->mst->epid = EPID;	// stw [%r0 + DMST_EPID], EPID
> -	 *	dctx->mst->clid = CLID;	// stw [%r0 + DMST_CLID], CLID
> -	 *	*((uint32_t *)&buf[DBUF_EPID]) = EPID;
> -	 *				// stw [%r9 + DBUF_EPID], EPID
> +	 *	dctx->mst->stid = STID;	// stw [%r0 + DMST_STID], STID
>  	 */
>  	emit(dlp,  BPF_LOAD(BPF_DW, BPF_REG_0, BPF_REG_0, DCTX_MST));
>  	emit(dlp,  BPF_STORE_IMM(BPF_DW, BPF_REG_0, DMST_FAULT, 0));
>  	emit(dlp,  BPF_STORE_IMM(BPF_DW, BPF_REG_0, DMST_TSTAMP, 0));
>  	emit(dlp,  BPF_STORE_IMM(BPF_DW, BPF_REG_0, DMST_SPECSIZE, 0));
> -	emite(dlp, BPF_STORE_IMM(BPF_W, BPF_REG_0, DMST_EPID, -1), epid);
> -	emite(dlp, BPF_STORE_IMM(BPF_W, BPF_REG_0, DMST_CLID, -1), clid);
> -	emite(dlp, BPF_STORE_IMM(BPF_W, BPF_REG_9, DBUF_EPID, -1), epid);
> +	emit(dlp,  BPF_STORE_IMM(BPF_W, BPF_REG_0, DMST_STID, pcb->pcb_stmt->dtsd_index));
> +
> +	/*
> +	 *	Zero out the leading 4 bytes of the buffer.
> +	 *	*((uint32_t *)&buf[DBUF_PAD]) = 0;
> +	 *				// stw [%r9 + DBUF_PAD], 0
> +	 */
> +	emit(dlp,  BPF_STORE_IMM(BPF_W, BPF_REG_9, DBUF_PAD, 0));

This is harmless but also not needed as far as I can see.  Since we will never
access these bytes, it does not matter whether they are zero'd out.

>  	/*
>  	 *	Set the speculation ID field to zero to indicate no active
>
> @@ -1114,6 +1106,17 @@ dt_cg_prologue(dt_pcb_t *pcb, dt_node_t *pred)
>  	 */
>  	emit(dlp,  BPF_STORE_IMM(BPF_W, BPF_REG_9, DBUF_SPECID, 0));
>  
> +	/*
> +	 *	*((uint32_t *)&buf[DBUF_PRID]) = dctx->mst->prid;
> +	 *				// ld %r1, [%r0 + DMST_PRID]
> +	 *				// st [%r9 + DBUF_PRID], %r1
> +	 *	*((uint32_t *)&buf[DBUF_STID]) = stid;
> +	 *				// st [%r9 + DBUF_STID], stid
> +	 */
> +	emit (dlp, BPF_LOAD(BPF_W, BPF_REG_1, BPF_REG_0, DMST_PRID));
> +	emit (dlp, BPF_STORE(BPF_W, BPF_REG_9, DBUF_PRID, BPF_REG_1));
> +	emit (dlp, BPF_STORE_IMM(BPF_W, BPF_REG_9, DBUF_STID, pcb->pcb_stmt->dtsd_index));
> +
>  	/*
>  	 * If there is a predicate:
>  	 *
> @@ -1132,10 +1135,9 @@ dt_cg_prologue(dt_pcb_t *pcb, dt_node_t *pred)
>  	TRACE_REGSET("Prologue: End  ");
>  
>  	/*
> -	 * Account for 32-bit EPID (at offset 0) and 32-bit speculation ID (at
> -	 * offset 4).
> +	 * Set the offset for the beginning of trace data.
>  	 */
> -	pcb->pcb_bufoff += 2 * sizeof(uint32_t);
> +	pcb->pcb_bufoff = DBUF_DATA;
>  }
>  
>  /*
> @@ -1170,15 +1172,15 @@ dt_cg_epilogue(dt_pcb_t *pcb)
>  		/*
>  		 *	rc = bpf_perf_event_output(dctx->ctx, &buffers,
>  		 *				   BPF_F_CURRENT_CPU,
> -		 *				   buf - 4, bufoff + 4);
> +		 *				   buf + 4, bufoff - 4);
>  		 *				// lddw %r1, [%fp + DT_STK_DCTX]
>  		 *				// lddw %r1, [%r1 + DCTX_CTX]
>  		 *				// lddw %r2, &buffers
>  		 *				// lddw %r3, BPF_F_CURRENT_CPU
>  		 *				// mov %r4, %r9
> -		 *				// add %r4, -4
> +		 *				// add %r4, 4
>  		 *				// mov %r5, pcb->pcb_bufoff
> -		 *				// add %r5, 4
> +		 *				// add %r5, -4
>  		 *				// call bpf_perf_event_output
>  		 */
>  		emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_1, BPF_REG_FP, DT_STK_DCTX));
> @@ -1186,9 +1188,9 @@ dt_cg_epilogue(dt_pcb_t *pcb)
>  		dt_cg_xsetx(dlp, buffers, DT_LBL_NONE, BPF_REG_2, buffers->di_id);
>  		dt_cg_xsetx(dlp, NULL, DT_LBL_NONE, BPF_REG_3, BPF_F_CURRENT_CPU);
>  		emit(dlp, BPF_MOV_REG(BPF_REG_4, BPF_REG_9));
> -		emit(dlp, BPF_ALU64_IMM(BPF_ADD, BPF_REG_4, -4));
> +		emit(dlp, BPF_ALU64_IMM(BPF_ADD, BPF_REG_4, 4));
>  		emit(dlp, BPF_MOV_IMM(BPF_REG_5, pcb->pcb_bufoff));
> -		emit(dlp, BPF_ALU64_IMM(BPF_ADD, BPF_REG_5, 4));
> +		emit(dlp, BPF_ALU64_IMM(BPF_ADD, BPF_REG_5, -4));
>  		emit(dlp, BPF_CALL_HELPER(BPF_FUNC_perf_event_output));
>  
>  		/*
> diff --git a/libdtrace/dt_consume.c b/libdtrace/dt_consume.c
> index 51eb6c80..37e14e17 100644
> --- a/libdtrace/dt_consume.c
> +++ b/libdtrace/dt_consume.c
> @@ -15,9 +15,11 @@
>  #include <alloca.h>
>  #include <dt_impl.h>
>  #include <dt_aggregate.h>
> +#include <dt_dctx.h>
>  #include <dt_module.h>
>  #include <dt_pcap.h>
>  #include <dt_peb.h>
> +#include <dt_probe.h>
>  #include <dt_state.h>
>  #include <dt_string.h>
>  #include <libproc.h>
> @@ -433,7 +435,7 @@ static dt_htab_ops_t dt_spec_buf_htab_ops = {
>  };
>  
>  static int
> -dt_flowindent(dtrace_hdl_t *dtp, dtrace_probedata_t *data, dtrace_epid_t last)
> +dt_flowindent(dtrace_hdl_t *dtp, dtrace_probedata_t *data, dtrace_id_t lastprid, dtrace_stid_t laststid)
>  {
>  	dtrace_probedesc_t	*pd = data->dtpda_pdesc;
>  	dtrace_flowkind_t	flow = DTRACEFLOW_NONE;
> @@ -445,7 +447,7 @@ dt_flowindent(dtrace_hdl_t *dtp, dtrace_probedata_t *data, dtrace_epid_t last)
>  	static const char	*r_str[2] = { " <- ", " <= " };
>  	static const char	*ent = "entry", *ret = "return";
>  	static int		entlen = 0, retlen = 0;
> -	dtrace_epid_t		id = data->dtpda_epid;
> +	dtrace_stid_t		stid = data->dtpda_stid;
>  
>  	if (entlen == 0) {
>  		assert(retlen == 0);
> @@ -473,13 +475,12 @@ dt_flowindent(dtrace_hdl_t *dtp, dtrace_probedata_t *data, dtrace_epid_t last)
>  
>  	/*
>  	 * If we're going to indent this, we need to check the ID of our last
> -	 * call.  If we're looking at the same probe ID but a different EPID,
> +	 * call.  If we're looking at the same probe ID but a different STID,
>  	 * we _don't_ want to indent.  (Yes, there are some minor holes in
>  	 * this scheme -- it's a heuristic.)
>  	 */
>  	if (flow == DTRACEFLOW_ENTRY) {
> -		if (last != DTRACE_EPIDNONE && id != last &&
> -		    pd->id == dtp->dt_pdesc[last]->id)
> +		if (stid != laststid && pd->id == lastprid)
>  			flow = DTRACEFLOW_NONE;
>  	}
>  
> @@ -2145,7 +2146,7 @@ static dtrace_workstatus_t
>  dt_consume_one_probe(dtrace_hdl_t *dtp, FILE *fp, char *data, uint32_t size,
>  		     dtrace_probedata_t *pdat, dtrace_consume_probe_f *efunc,
>  		     dtrace_consume_rec_f *rfunc, int flow, int quiet,
> -		     int peekflags, dtrace_epid_t *last, int committing,
> +		     int peekflags, dtrace_id_t *lastprid, dtrace_stid_t *laststid, int committing,
>  		     void *arg);

We've been trying to keep the declarations within 80 columns, so
'int committing' should join arg on the last line.

>  
>  /*
> @@ -2155,7 +2156,7 @@ static dtrace_workstatus_t
>  dt_commit_one_spec(dtrace_hdl_t *dtp, FILE *fp, dt_spec_buf_t *dtsb,
>  		   dtrace_probedata_t *pdat, dtrace_consume_probe_f *efunc,
>  		   dtrace_consume_rec_f *rfunc, int flow, int quiet,
> -		   int peekflags, dtrace_epid_t *last, void *arg)
> +		   int peekflags, dtrace_id_t *lastprid, dtrace_stid_t *laststid, void *arg)

Last arg declaration should go on a new line, indented appropriately.

>  {
>  	dt_spec_buf_data_t 	*dsbd;
>  
> @@ -2169,7 +2170,7 @@ dt_commit_one_spec(dtrace_hdl_t *dtp, FILE *fp, dt_spec_buf_t *dtsb,
>  		ret = dt_consume_one_probe(dtp, fp, dsbd->dsbd_data,
>  					   dsbd->dsbd_size, &specpdat,
>  					   efunc, rfunc, flow, quiet,
> -					   peekflags, last, 1, arg);
> +					   peekflags, lastprid, laststid, 1, arg);
>  		if (ret != DTRACE_WORKSTATUS_OKAY)
>  			return ret;
>  	}
> @@ -2181,34 +2182,37 @@ static dtrace_workstatus_t
>  dt_consume_one_probe(dtrace_hdl_t *dtp, FILE *fp, char *data, uint32_t size,
>  		     dtrace_probedata_t *pdat, dtrace_consume_probe_f *efunc,
>  		     dtrace_consume_rec_f *rfunc, int flow, int quiet,
> -		     int peekflags, dtrace_epid_t *last, int committing,
> +		     int peekflags, dtrace_id_t *lastprid, dtrace_stid_t *laststid, int committing,
>  		     void *arg)

Last two args ought to be together on the last line.

>  {
> -	dtrace_epid_t		epid;
> +	int			specid;
> +	dtrace_stid_t		stid;
> +	uint32_t		prid;
>  	dtrace_datadesc_t	*epd;
>  	dt_spec_buf_t		tmpl;
>  	dt_spec_buf_t		*dtsb;
> -	int			specid;
>  	int			i;
>  	int			rval;
>  	dtrace_workstatus_t	ret;
>  	int			commit_discard_seen, only_commit_discards;
>  	int			data_recording = 1;
>  
> -	epid = ((uint32_t *)data)[0];
> -	specid = ((uint32_t *)data)[1];
> +	specid = *((uint32_t *)(data + DBUF_SPECID));
> +	prid = *((uint32_t *)(data + DBUF_PRID));
> +	stid = *((uint32_t *)(data + DBUF_STID));
> +	if (prid > dtp->dt_probe_id)
> +		return dt_set_errno(dtp, EDT_BADEPID);  /* even though there is no EPID */

Surely this ought to use EDT_BADID?

>  	/*
> -	 * Fill in the epid and address of the epid in the buffer.  We need to
> -	 * pass this to the efunc and possibly to create speculations.
> +	 * Fill in the stid and data address.
>  	 */
> -	pdat->dtpda_epid = epid;
> +	pdat->dtpda_stid = stid;
>  	pdat->dtpda_data = data;
>  
> -	rval = dt_epid_lookup(dtp, epid, &pdat->dtpda_ddesc,
> -					 &pdat->dtpda_pdesc);
> +	rval = dt_stid_lookup(dtp, stid, &pdat->dtpda_ddesc);
>  	if (rval != 0)
> -		return dt_set_errno(dtp, EDT_BADEPID);
> +		return dt_set_errno(dtp, EDT_BADEPID);  /* even though there is no EPID */

This should report a (new) EDT_BADSTID (replacing EDT_BADEPID).
I know the original code did not do it, but you might as well rewrite this as:

	if (dt_stid_lookup(dtp, stid, &pdat->dtpda_ddesc) != 0)
		return dt_set_errno(dtp, EDT_BADSTID);

I would also either move the test for prid to be right before this conditional,
or move this one to be right underneath the test for prid.  Keeping them
together just makes sense.

> +	pdat->dtpda_pdesc = (dtrace_probedesc_t *)dtp->dt_probes[prid]->desc;
>  
>  	epd = pdat->dtpda_ddesc;
>  	if (epd->dtdd_uarg != DT_ECB_DEFAULT) {
> @@ -2306,7 +2310,7 @@ dt_consume_one_probe(dtrace_hdl_t *dtp, FILE *fp, char *data, uint32_t size,
>  
>  	if (data_recording) {
>  		if (flow)
> -			dt_flowindent(dtp, pdat, *last);
> +			dt_flowindent(dtp, pdat, *lastprid, *laststid);
>  
>  		rval = (*efunc)(pdat, arg);
>  
> @@ -2570,13 +2574,14 @@ dt_consume_one_probe(dtrace_hdl_t *dtp, FILE *fp, char *data, uint32_t size,
>  
>  	/*
>  	 * Call the record callback with a NULL record to indicate
> -	 * that we're done processing this EPID.  The return value is ignored in
> +	 * that we're done processing this record.  The return value is ignored in
>  	 * this case. XXX should we respect at least DTRACE_CONSUME_ABORT?

Maybe fix the comment block to fill out the first line as close to the 80 char
limit as possible, since you are changing it anyway.

>  	 */
>  	if (data_recording) {
>  		(*rfunc)(pdat, NULL, arg);
>  
> -		*last = epid;
> +		*lastprid = prid;
> +		*laststid = stid;
>  	}
>  
>  	/*
> @@ -2597,7 +2602,7 @@ dt_consume_one_probe(dtrace_hdl_t *dtp, FILE *fp, char *data, uint32_t size,
>  				if ((ret = dt_commit_one_spec(dtp, fp, dtsb,
>  							      pdat, efunc, rfunc,
>  							      flow, quiet, peekflags,
> -							      last, arg)) !=
> +							      lastprid, laststid, arg)) !=
>  				    DTRACE_WORKSTATUS_OKAY) {
>  					dt_spec_buf_data_destroy(dtp, dtsb);
>  					return ret;
> @@ -2623,7 +2628,7 @@ static dtrace_workstatus_t
>  dt_consume_one(dtrace_hdl_t *dtp, FILE *fp, char *buf,
>  	       dtrace_probedata_t *pdat, dtrace_consume_probe_f *efunc,
>  	       dtrace_consume_rec_f *rfunc, int flow, int quiet, int peekflags,
> -	       dtrace_epid_t *last, void *arg)
> +	       dtrace_id_t *lastprid, dtrace_stid_t *laststid, void *arg)
>  {
>  	char				*data = buf;
>  	struct perf_event_header	*hdr;
> @@ -2639,9 +2644,9 @@ dt_consume_one(dtrace_hdl_t *dtp, FILE *fp, char *buf,
>  		 * struct {
>  		 *	struct perf_event_header	header;
>  		 *	uint32_t			size;
> -		 *	uint32_t			pad;
> -		 *	uint32_t			epid;
>  		 *	uint32_t			specid;
> +		 *	uint32_t			prid;
> +		 *	uint32_t			stid;
>  		 *	uint64_t			data[n];
>  		 * }
>  		 * and 'data' points to the 'size' member at this point.
> @@ -2651,17 +2656,21 @@ dt_consume_one(dtrace_hdl_t *dtp, FILE *fp, char *buf,
>  			return dt_set_errno(dtp, EDT_DSIZE);
>  
>  		size = *(uint32_t *)data;
> -		data += sizeof(size);
>  		ptr += sizeof(size) + size;
>  		if (ptr != buf + hdr->size)
>  			return dt_set_errno(dtp, EDT_DSIZE);
>  
> -		data += sizeof(uint32_t);		/* skip padding */
> -		size -= sizeof(uint32_t);
> +		/*
> +		 * The "size" measures from specid to the end.  But our buffer
> +		 * offsets are relative to &size itself, to preserve 8-byte
> +		 * alignment.  So, we leave data pointing at &size, and we
> +		 * increase size by 4 bytes.
> +		 */
> +		size += 4;

So, while not a major concern, this switch to passing the data *with* the
4 bytes of "padding" at the beginning means that we're changing what is
being passed to the consumer functions.  Arguably, that isn't a big deal
because the consumer really shouldn't even know the layout of the buffer data.

However, since the "padding" isn't really padding at all but rather a 32-bit
integer value that gives us the size of the following data blob, perhaps we
should just declare it to be that and not talk about padding at all (so yes,
this somewhat adds to my earlier comments).  It *is* a size field for the
trace data.

>  		return dt_consume_one_probe(dtp, fp, data, size, pdat, efunc,
>  					    rfunc, flow, quiet, peekflags,
> -					    last, 0, arg);
> +					    lastprid, laststid, 0, arg);
>  	} else if (hdr->type == PERF_RECORD_LOST) {
>  		return DTRACE_WORKSTATUS_OKAY;
>  	} else
> @@ -2692,7 +2701,8 @@ dt_consume_cpu(dtrace_hdl_t *dtp, FILE *fp, dt_peb_t *peb,
>  {
>  	struct perf_event_mmap_page	*rb_page = (void *)peb->base;
>  	struct perf_event_header	*hdr;
> -	dtrace_epid_t			last = DTRACE_EPIDNONE;
> +	dtrace_id_t			lastprid;
> +	dtrace_stid_t			laststid;
>  	char				*base;
>  	char				*event;
>  	uint32_t			len;
> @@ -2764,7 +2774,7 @@ dt_consume_cpu(dtrace_hdl_t *dtp, FILE *fp, dt_peb_t *peb,
>                  }
>  
>                  rval = dt_consume_one(dtp, fp, event, &pdat, efunc, rfunc, flow,
> -                                      quiet, peekflags, &last, arg);
> +                                      quiet, peekflags, &lastprid, &laststid, arg);
>                  if (rval == DTRACE_WORKSTATUS_DONE)
>                    return DTRACE_WORKSTATUS_OKAY;
>                  if (rval != DTRACE_WORKSTATUS_OKAY)
> diff --git a/libdtrace/dt_dctx.h b/libdtrace/dt_dctx.h
> index 1422ad24..79b2901c 100644
> --- a/libdtrace/dt_dctx.h
> +++ b/libdtrace/dt_dctx.h
> @@ -18,9 +18,8 @@
>   * The DTrace machine state.
>   */
>  typedef struct dt_mstate {
> -	uint32_t	epid;		/* Enabled probe ID */
>  	uint32_t	prid;		/* Probe ID */
> -	uint32_t	clid;		/* Clause ID (unique per probe) */
> +	uint32_t	stid;		/* Statement ID */
>  	uint32_t	tag;		/* Tag (for future use) */
>  	uint32_t	scratch_top;	/* Current top of scratch space */
>  	int32_t		syscall_errno;	/* syscall errno */
> @@ -33,9 +32,8 @@ typedef struct dt_mstate {
>  	uint64_t	saved_argv[10];	/* Saved probe arguments */
>  } dt_mstate_t;
>  
> -#define DMST_EPID		offsetof(dt_mstate_t, epid)
>  #define DMST_PRID		offsetof(dt_mstate_t, prid)
> -#define DMST_CLID		offsetof(dt_mstate_t, clid)
> +#define DMST_STID		offsetof(dt_mstate_t, stid)
>  #define DMST_TAG		offsetof(dt_mstate_t, tag)
>  #define DMST_SCRATCH_TOP	offsetof(dt_mstate_t, scratch_top)
>  #define DMST_ERRNO		offsetof(dt_mstate_t, syscall_errno)
> @@ -82,16 +80,23 @@ typedef struct dt_dctx {
>   * The dctx->buf pointer references a block of memory that contains:
>   *
>   *                       +----------------+
> - *                  0 -> | EPID           |
> + *                  0 -> | pad            |
>   *                       +----------------+
> - *		    4 -> | Speculation ID |
> + *                  4 -> | Speculation ID |
>   *                       +----------------+
> - *                       | Trace Data     |
> + *                  8 -> | PRID           |
> + *                       +----------------+
> + *                 12 -> | STID           |
> + *                       +----------------+
> + *                 16 -> | Trace Data     |
>   *                       |      ...       |
>   *                       +----------------+
>   */
> -#define DBUF_EPID	0
> +#define DBUF_PAD	0
>  #define DBUF_SPECID	4
> +#define DBUF_PRID	8
> +#define DBUF_STID	12
> +#define DBUF_DATA	16
>  
>  /*
>   * The dctx->mem pointer references a block of memory that contains:
> diff --git a/libdtrace/dt_dlibs.c b/libdtrace/dt_dlibs.c
> index bc883e11..ba4d4abe 100644
> --- a/libdtrace/dt_dlibs.c
> +++ b/libdtrace/dt_dlibs.c
> @@ -73,9 +73,7 @@ static const dt_ident_t		dt_bpf_symbols[] = {
>  	DT_BPF_SYMBOL(tuples, DT_IDENT_PTR),
>  
>  	/* BPF internal identifiers */
> -	DT_BPF_SYMBOL_ID(EPID, DT_IDENT_SCALAR, DT_CONST_EPID),
>  	DT_BPF_SYMBOL_ID(PRID, DT_IDENT_SCALAR, DT_CONST_PRID),
> -	DT_BPF_SYMBOL_ID(CLID, DT_IDENT_SCALAR, DT_CONST_CLID),
>  	DT_BPF_SYMBOL_ID(ARGC, DT_IDENT_SCALAR, DT_CONST_ARGC),
>  	DT_BPF_SYMBOL_ID(STBSZ, DT_IDENT_SCALAR, DT_CONST_STBSZ),
>  	DT_BPF_SYMBOL_ID(STRSZ, DT_IDENT_SCALAR, DT_CONST_STRSZ),
> diff --git a/libdtrace/dt_handle.c b/libdtrace/dt_handle.c
> index 4c9b9413..720a379d 100644
> --- a/libdtrace/dt_handle.c
> +++ b/libdtrace/dt_handle.c
> @@ -14,6 +14,7 @@
>  #include <alloca.h>
>  
>  #include <dt_impl.h>
> +#include <dt_probe.h>
>  #include <dt_program.h>
>  
>  static const char _dt_errprog[] =
> @@ -127,9 +128,9 @@ dt_handle_err(dtrace_hdl_t *dtp, dtrace_probedata_t *data)
>  	dtrace_datadesc_t *dd = data->dtpda_ddesc, *errdd;
>  	dtrace_probedesc_t *pd = data->dtpda_pdesc, *errpd;
>  	dtrace_errdata_t err;
> -	dtrace_epid_t epid;
> +	dtrace_id_t prid;
> +	dtrace_stid_t stid;
>  
> -	char where[30];
>  	char details[30];
>  	char offinfo[30];
>  	const int slop = 80;
> @@ -144,34 +145,29 @@ dt_handle_err(dtrace_hdl_t *dtp, dtrace_probedata_t *data)
>  		return dt_set_errno(dtp, EDT_BADERROR);
>  
>  	/*
> -	 * This is an error.  We have the following items here:  EPID,
> -	 * faulting action, BPF pc, fault code and faulting address.
> +	 * This is an error.  We have the following items here:  PRID,
> +	 * statement ID, BPF pc, fault code and faulting address.
>  	 */
> -	epid = (uint32_t)DT_REC(uint64_t, 0);
> +	prid = DT_REC(uint64_t, 0);
> +	stid = DT_REC(uint64_t, 1);
>  
> -	if (dt_epid_lookup(dtp, epid, &errdd, &errpd) != 0)
> +	if (dt_stid_lookup(dtp, stid, &errdd) != 0)
>  		return dt_set_errno(dtp, EDT_BADERROR);

No check to make sure prid is valid?  If it is bad, the following indexing
of dt_probes could cause SEGV.

> -
> +	errpd = (dtrace_probedesc_t *)dtp->dt_probes[prid]->desc;
>  	err.dteda_ddesc = errdd;
>  	err.dteda_pdesc = errpd;
>  	err.dteda_cpu = data->dtpda_cpu;
> -	err.dteda_action = (int)DT_REC(uint64_t, 1);

Let's leave this in for now, and assign stid to it.  In the near future, we
may want to define this API in a better way and then we might rename the
member or do something else, but being able to pass the statement id to the
consume handler is better than not passing anything.

>  	err.dteda_offset = (int)DT_REC(uint64_t, 2);
>  	err.dteda_fault = (int)DT_REC(uint64_t, 3);
>  	err.dteda_addr = DT_REC(uint64_t, 4);
>  
>  	faultstr = dtrace_faultstr(dtp, err.dteda_fault);
> -	len = sizeof(where) + sizeof(offinfo) + strlen(faultstr) +
> +	len = sizeof(offinfo) + strlen(faultstr) +
>  	      strlen(errpd->prv) + strlen(errpd->mod) + strlen(errpd->fun) +
>  	      strlen(errpd->prb) + slop;
>  
>  	str = (char *)alloca(len);
>  
> -	if (err.dteda_action == 0)
> -		sprintf(where, "predicate");
> -	else
> -		sprintf(where, "action #%d", err.dteda_action);

Something we need to think about for the future...  can we distinguish between
a failure in the clause body vs a failure in the predicate?  But not for this
patch...

> -
>  	if (err.dteda_offset != -1)
>  		sprintf(offinfo, " at BPF pc %d", err.dteda_offset);
>  	else
> @@ -195,11 +191,12 @@ no_addr:
>  		details[0] = 0;
>  	}
>  
> -	snprintf(str, len, "error on enabled probe ID %u (ID %u: %s:%s:%s:%s): "
> -			   "%s%s in %s%s",
> -		 epid, errpd->id, errpd->prv, errpd->mod, errpd->fun,
> +	snprintf(str, len, "error in %s for probe ID %u (%s:%s:%s:%s): "
> +			   "%s%s%s",
> +		 dtp->dt_stmts[stid]->dtsd_clause->di_name,
> +		 errpd->id, errpd->prv, errpd->mod, errpd->fun,
>  		 errpd->prb, dtrace_faultstr(dtp, err.dteda_fault), details,
> -		 where, offinfo);
> +		 offinfo);
>  
>  	err.dteda_msg = str;
>  
> @@ -220,7 +217,6 @@ dt_handle_rawerr(dtrace_hdl_t *dtp, const char *errmsg)
>  	err.dteda_ddesc = NULL;
>  	err.dteda_pdesc = NULL;
>  	err.dteda_cpu = -1;
> -	err.dteda_action = -1;

Keep it.

>  	err.dteda_offset = -1;
>  	err.dteda_fault = DTRACEFLT_LIBRARY;
>  	err.dteda_addr = 0;
> @@ -245,7 +241,6 @@ dt_handle_liberr(dtrace_hdl_t *dtp, const dtrace_probedata_t *data,
>  	err.dteda_ddesc = data->dtpda_ddesc;
>  	err.dteda_pdesc = errpd;
>  	err.dteda_cpu = data->dtpda_cpu;
> -	err.dteda_action = -1;

Keep it.

>  	err.dteda_offset = -1;
>  	err.dteda_fault = DTRACEFLT_LIBRARY;
>  	err.dteda_addr = 0; /* == NULL */
> @@ -256,8 +251,9 @@ dt_handle_liberr(dtrace_hdl_t *dtp, const dtrace_probedata_t *data,
>  	str = alloca(len);
>  
>  	snprintf(str, len,
> -		 "error on enabled probe ID %u (ID %u: %s:%s:%s:%s): %s",
> -		 data->dtpda_epid, errpd->id, errpd->prv, errpd->mod,
> +		 "error in %s for probe ID %u (%s:%s:%s:%s): %s",
> +		 dtp->dt_stmts[data->dtpda_stid]->dtsd_clause->di_name,
> +		 errpd->id, errpd->prv, errpd->mod,
>  		 errpd->fun, errpd->prb, faultstr);
>  
>  	err.dteda_msg = str;
> diff --git a/libdtrace/dt_impl.h b/libdtrace/dt_impl.h
> index 98fddc23..aedffeee 100644
> --- a/libdtrace/dt_impl.h
> +++ b/libdtrace/dt_impl.h
> @@ -275,6 +275,7 @@ struct dtrace_hdl {
>  	dt_list_t dt_programs;	/* linked list of dtrace_prog_t's */
>  	dt_list_t dt_xlators;	/* linked list of dt_xlator_t's */
>  	dt_list_t dt_enablings;	/* list of (to be) enabled probes */
> +	dtrace_stmtdesc_t **dt_stmts; /* array of stmts */
>  	struct dt_xlator **dt_xlatormap; /* dt_xlator_t's indexed by dx_id */
>  	id_t dt_xlatorid;	/* next dt_xlator_t id to assign */
>  	dt_ident_t *dt_externs;	/* linked list of external symbol identifiers */
> @@ -341,10 +342,6 @@ struct dtrace_hdl {
>  	ctf_id_t dt_type_symaddr; /* cached CTF identifier for _symaddr type */
>  	ctf_id_t dt_type_usymaddr; /* cached CTF ident. for _usymaddr type */
>  	ctf_id_t dt_type_void;	/* cached CTF identifier for void type */
> -	dtrace_epid_t dt_nextepid; /* next enabled probe ID to assign */
> -	size_t dt_maxprobe;	/* max enabled probe ID */
> -	dtrace_datadesc_t **dt_ddesc; /* probe data descriptions */
> -	dtrace_probedesc_t **dt_pdesc; /* probe descriptions for enabled prbs */
>  	size_t dt_maxagg;	/* max aggregation ID */
>  	dtrace_aggdesc_t **dt_adesc; /* aggregation descriptions */
>  	struct dt_aggregate *dt_aggregate; /* aggregate */
> @@ -773,11 +770,7 @@ extern dtrace_datadesc_t *dt_datadesc_hold(dtrace_datadesc_t *ddp);
>  extern void dt_datadesc_release(dtrace_hdl_t *, dtrace_datadesc_t *);
>  extern dtrace_datadesc_t *dt_datadesc_create(dtrace_hdl_t *);
>  extern int dt_datadesc_finalize(dtrace_hdl_t *, dtrace_datadesc_t *);
> -extern dtrace_epid_t dt_epid_add(dtrace_hdl_t *, dtrace_datadesc_t *,
> -				 dtrace_id_t);
> -extern int dt_epid_lookup(dtrace_hdl_t *, dtrace_epid_t, dtrace_datadesc_t **,
> -			  dtrace_probedesc_t **);
> -extern void dt_epid_destroy(dtrace_hdl_t *);
> +extern int dt_stid_lookup(dtrace_hdl_t *, dtrace_stid_t, dtrace_datadesc_t **);
>  typedef void (*dt_cg_gap_f)(dt_pcb_t *, int);
>  extern uint32_t dt_rec_add(dtrace_hdl_t *, dt_cg_gap_f, dtrace_actkind_t,
>  			   uint32_t, uint16_t, dt_pfargv_t *, uint64_t);
> diff --git a/libdtrace/dt_map.c b/libdtrace/dt_map.c
> index 60a2eca2..bdef19b0 100644
> --- a/libdtrace/dt_map.c
> +++ b/libdtrace/dt_map.c
> @@ -85,98 +85,16 @@ dt_datadesc_finalize(dtrace_hdl_t *dtp, dtrace_datadesc_t *ddp)
>  	return 0;
>  }
>  
> -/*
> - * Associate a probe data description and probe description with an enabled
> - * probe ID.  This means that the given ID refers to the program matching the
> - * probe data description being attached to the probe that matches the probe
> - * description.
> - */
> -dtrace_epid_t
> -dt_epid_add(dtrace_hdl_t *dtp, dtrace_datadesc_t *ddp, dtrace_id_t prid)
> -{
> -	dtrace_id_t	max = dtp->dt_maxprobe;
> -	dtrace_epid_t	epid;
> -
> -	epid = dtp->dt_nextepid++;
> -	if (epid >= max || dtp->dt_ddesc == NULL) {
> -		dtrace_id_t		nmax = max ? (max << 1) : 2;
> -		dtrace_datadesc_t	**nddesc;
> -		dtrace_probedesc_t	**npdesc;
> -
> -		nddesc = dt_calloc(dtp, nmax, sizeof(void *));
> -		npdesc = dt_calloc(dtp, nmax, sizeof(void *));
> -		if (nddesc == NULL || npdesc == NULL) {
> -			dt_free(dtp, nddesc);
> -			dt_free(dtp, npdesc);
> -			return dt_set_errno(dtp, EDT_NOMEM);
> -		}
> -
> -		if (dtp->dt_ddesc != NULL) {
> -			size_t	osize = max * sizeof(void *);
> -
> -			memcpy(nddesc, dtp->dt_ddesc, osize);
> -			dt_free(dtp, dtp->dt_ddesc);
> -			memcpy(npdesc, dtp->dt_pdesc, osize);
> -			dt_free(dtp, dtp->dt_pdesc);
> -		}
> -
> -		dtp->dt_ddesc = nddesc;
> -		dtp->dt_pdesc = npdesc;
> -		dtp->dt_maxprobe = nmax;
> -	}
> -
> -	if (dtp->dt_ddesc[epid] != NULL)
> -		return epid;
> -
> -	dtp->dt_ddesc[epid] = dt_datadesc_hold(ddp);
> -	dtp->dt_pdesc[epid] = (dtrace_probedesc_t *)dtp->dt_probes[prid]->desc;
> -
> -	return epid;
> -}
> -
>  int
> -dt_epid_lookup(dtrace_hdl_t *dtp, dtrace_epid_t epid, dtrace_datadesc_t **ddp,
> -	       dtrace_probedesc_t **pdp)
> +dt_stid_lookup(dtrace_hdl_t *dtp, dtrace_stid_t stid, dtrace_datadesc_t **ddp)
>  {
> -	if (epid >= dtp->dt_maxprobe ||
> -	    dtp->dt_ddesc[epid] == NULL || dtp->dt_pdesc[epid] == NULL)
> +	if (stid >= dtp->dt_clause_nextid)
>  		return -1;
>  
> -	*ddp = dtp->dt_ddesc[epid];
> -	*pdp = dtp->dt_pdesc[epid];
> -
> -	return 0;
> -}
> -
> -void
> -dt_epid_destroy(dtrace_hdl_t *dtp)
> -{
> -	size_t i;
> -
> -	assert((dtp->dt_pdesc != NULL && dtp->dt_ddesc != NULL &&
> -	    dtp->dt_maxprobe > 0) || (dtp->dt_pdesc == NULL &&
> -	    dtp->dt_ddesc == NULL && dtp->dt_maxprobe == 0));
> -
> -	if (dtp->dt_pdesc == NULL)
> -		return;
> -
> -	for (i = 0; i < dtp->dt_maxprobe; i++) {
> -		if (dtp->dt_ddesc[i] == NULL) {
> -			assert(dtp->dt_pdesc[i] == NULL);
> -			continue;
> -		}
> -
> -		dt_datadesc_release(dtp, dtp->dt_ddesc[i]);
> -		assert(dtp->dt_pdesc[i] != NULL);
> -	}
> -
> -	free(dtp->dt_pdesc);
> -	dtp->dt_pdesc = NULL;
> +	dtrace_difo_t *rdp = dt_dlib_get_func_difo(dtp, dtp->dt_stmts[stid]->dtsd_clause);
> +	*ddp = dt_datadesc_hold(rdp->dtdo_ddesc);             // FIXME what releases the hold?

Well, you are the one requesting the hold, so you decide when it is to be
released :-)

In all seriousness, I believe dtrace_stmt_destroy() is the place you are
looking for.

>  
> -	free(dtp->dt_ddesc);
> -	dtp->dt_ddesc = NULL;
> -	dtp->dt_nextepid = 0;
> -	dtp->dt_maxprobe = 0;
> +	return (*ddp == NULL) ? -1 : 0;
>  }
>  
>  uint32_t
> diff --git a/libdtrace/dt_open.c b/libdtrace/dt_open.c
> index 77ffb6d2..848141dd 100644
> --- a/libdtrace/dt_open.c
> +++ b/libdtrace/dt_open.c
> @@ -170,7 +170,7 @@ static const dt_ident_t _dtrace_globals[] = {
>  { "discard", DT_IDENT_ACTFUNC, 0, DT_ACT_DISCARD, DT_ATTR_STABCMN, DT_VERS_1_0,
>  	&dt_idops_func, "void(int)" },
>  { "epid", DT_IDENT_SCALAR, 0, DIF_VAR_EPID, DT_ATTR_STABCMN, DT_VERS_1_0,
> -	&dt_idops_type, "uint_t" },
> +	&dt_idops_type, "uint64_t" },
>  { "errno", DT_IDENT_SCALAR, 0, DIF_VAR_ERRNO, DT_ATTR_STABCMN, DT_VERS_1_0,
>  	&dt_idops_type, "int" },
>  { "execname", DT_IDENT_SCALAR, 0, DIF_VAR_EXECNAME,
> @@ -739,8 +739,6 @@ dt_vopen(int version, int flags, int *errp,
>  	dt_proc_hash_create(dtp);
>  	dt_proc_signal_init(dtp);
>  	dtp->dt_proc_fd = eventfd(0, EFD_CLOEXEC | EFD_NONBLOCK);
> -	dtp->dt_nextepid = 1;
> -	dtp->dt_maxprobe = 0;
>  	if (dt_aggregate_init(dtp) == -1)
>  		return set_open_errno(dtp, errp, dtrace_errno(dtp));
>  	dtp->dt_vmax = DT_VERS_LATEST;
> @@ -1303,7 +1301,6 @@ dtrace_close(dtrace_hdl_t *dtp)
>  	if (dtp->dt_poll_fd != -1)
>  		close(dtp->dt_poll_fd);
>  
> -	dt_epid_destroy(dtp);
>  	dt_aggid_destroy(dtp);
>  	dt_buffered_destroy(dtp);
>  	dt_aggregate_destroy(dtp);
> diff --git a/libdtrace/dt_program.c b/libdtrace/dt_program.c
> index afbf7265..52a07b6e 100644
> --- a/libdtrace/dt_program.c
> +++ b/libdtrace/dt_program.c
> @@ -100,7 +100,7 @@ dtrace_program_info(dtrace_hdl_t *dtp, dtrace_prog_t *pgp,
>  
>  		/*
>  		 * If there aren't any actions, account for the fact that
> -		 * recording the epid will generate a record.
> +		 * the default action will generate a record.
>  		 */
>  		dp = dt_dlib_get_func_difo(dtp, stp->ds_desc->dtsd_clause);
>  		if (dp != NULL)
> @@ -165,6 +165,13 @@ dt_prog_stmt(dtrace_hdl_t *dtp, dtrace_prog_t *pgp, dtrace_stmtdesc_t *sdp,
>  	dtrace_probedesc_t	*pdp = &sdp->dtsd_ecbdesc->dted_probe;
>  	int			rc;
>  
> +	if (dtp->dt_stmts == NULL) {
> +		dtp->dt_stmts = dt_calloc(dtp, dtp->dt_clause_nextid, sizeof(dtrace_stmtdesc_t *));

dt_clause_nextid -> dt_stmt_nextid

> +		if (dtp->dt_stmts == NULL)
> +			return dt_set_errno(dtp, EDT_NOMEM);
> +	}
> +	dtp->dt_stmts[sdp->dtsd_index] = sdp;
> +
>  	st.cnt = cnt;
>  	st.sdp = sdp;
>  	rc = dt_probe_iter(dtp, pdp, (dt_probe_f *)dt_stmt_probe, NULL, &st);
> diff --git a/libdtrace/dtrace.h b/libdtrace/dtrace.h
> index 09a87977..5dacc998 100644
> --- a/libdtrace/dtrace.h
> +++ b/libdtrace/dtrace.h
> @@ -150,6 +150,7 @@ typedef struct dtrace_stmtdesc {
>  	dtrace_attribute_t dtsd_descattr;	/* probedesc attributes */
>  	dtrace_attribute_t dtsd_stmtattr;	/* statement attributes */
>  	int dtsd_clauseflags;			/* clause flags */
> +	int dtsd_index;				/* index in dtp->dt_stmts */

dtsd_index -> dtsd_id

>  } dtrace_stmtdesc_t;
>  
>  /* dtsd clause flags */
> @@ -189,7 +190,7 @@ typedef enum {
>  
>  typedef struct dtrace_probedata {
>  	dtrace_hdl_t *dtpda_handle;		/* handle to DTrace library */
> -	dtrace_epid_t dtpda_epid;		/* enabled probe ID */
> +	dtrace_stid_t dtpda_stid;		/* statement ID */
>  	dtrace_datadesc_t *dtpda_ddesc;		/* probe data description */
>  	dtrace_probedesc_t *dtpda_pdesc;	/* probe description */
>  	unsigned int dtpda_cpu;			/* CPU for data */
> @@ -283,7 +284,6 @@ typedef struct dtrace_errdata {
>  	dtrace_datadesc_t *dteda_ddesc;		/* probe data inducing err */
>  	dtrace_probedesc_t *dteda_pdesc;	/* probe inducing error */
>  	unsigned int dteda_cpu;			/* CPU of error */
> -	int dteda_action;			/* action inducing error */

Keep it for now.

>  	int dteda_offset;			/* offset in DIFO of error */
>  	int dteda_fault;			/* specific fault */
>  	uint64_t dteda_addr;			/* address of fault, if any */
> diff --git a/test/demo/builtin/eipd.d b/test/demo/builtin/eipd.d
> deleted file mode 100644
> index 659b0940..00000000
> --- a/test/demo/builtin/eipd.d
> +++ /dev/null
> @@ -1,4 +0,0 @@
> -BEGIN {
> -	trace(epid);
> -	exit(0);
> -}
> diff --git a/test/demo/dtrace/error.r b/test/demo/dtrace/error.r
> index d3904f47..3c434721 100644
> --- a/test/demo/dtrace/error.r
> +++ b/test/demo/dtrace/error.r
> @@ -3,4 +3,4 @@
>  
>  -- @@stderr --
>  dtrace: script 'test/demo/dtrace/error.d' matched 2 probes
> -dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
> +dtrace: error in dt_clause_0 for probe ID 1 (dtrace:::BEGIN): invalid address ({ptr}) at BPF pc NNN
> diff --git a/test/demo/spec/specopen.d b/test/demo/spec/specopen.d
> index 528d6c25..c510045b 100644
> --- a/test/demo/spec/specopen.d
> +++ b/test/demo/spec/specopen.d
> @@ -2,7 +2,7 @@
>  
>  /*
>   * Oracle Linux DTrace.
> - * Copyright (c) 2005, Oracle and/or its affiliates. All rights reserved.
> + * Copyright (c) 2005, 2024, Oracle and/or its affiliates. All rights reserved.
>   * Licensed under the Universal Permissive License v 1.0 as shown at
>   * http://oss.oracle.com/licenses/upl.
>   */
> @@ -33,8 +33,7 @@ fbt:::
>  /self->spec/
>  {
>  	/*
> -	 * A speculate() with no other actions speculates the default action:
> -	 * tracing the EPID.
> +	 * A speculate() with no other actions speculates the default action.
>  	 */
>  	speculate(self->spec);
>  }
> diff --git a/test/stress/buffering/tst.resize3-manual.r b/test/stress/buffering/tst.resize3-manual.r
> index 43b647c7..5493783e 100644
> --- a/test/stress/buffering/tst.resize3-manual.r
> +++ b/test/stress/buffering/tst.resize3-manual.r
> @@ -1,5 +1,5 @@
>                     FUNCTION:NAME
> -                          :BEGIN           3
> +                          :BEGIN            4294967297

Rather than changing the expected output, which now depends on the artificial
epid builtin var, I think you should just change the test to trace a constant,
since that has the same effect and does not change the purpose of the test.
And that guarantees predictable and consistent output.

>                            :BEGIN 
>  
>  -- @@stderr --
> diff --git a/test/stress/buffering/tst.resize3.r b/test/stress/buffering/tst.resize3.r
> index 9c471158..807c4d1c 100644
> --- a/test/stress/buffering/tst.resize3.r
> +++ b/test/stress/buffering/tst.resize3.r
> @@ -1,5 +1,5 @@
>                     FUNCTION:NAME
> -                          :BEGIN           3
> +                          :BEGIN            4294967297

Rather than changing the expected output, which now depends on the artificial
epid builtin var, I think you should just change the test to trace a constant,
since that has the same effect and does not change the purpose of the test.
And that guarantees predictable and consistent output.

>                            :BEGIN 
>  
>  -- @@stderr --
> diff --git a/test/unittest/actions/setopt/tst.badopt.r b/test/unittest/actions/setopt/tst.badopt.r
> index 29e39fd4..e2f6d2c3 100644
> --- a/test/unittest/actions/setopt/tst.badopt.r
> +++ b/test/unittest/actions/setopt/tst.badopt.r
> @@ -1,16 +1,16 @@
>  
>  -- @@stderr --
> -dtrace: error on enabled probe ID 2 (ID 1: dtrace:::BEGIN): couldn't set option "Nixon" to "1": Invalid option name
> +dtrace: error in dt_clause_0 for probe ID 1 (dtrace:::BEGIN): couldn't set option "Nixon" to "1": Invalid option name

Perhaps it would be more efficient to update runtest.sh to support both the
old and the new error reporting output, and changing both into a single unified
form that substitutes changeable elements.

E.g.
dtrace: error on enabled probe ID 2 (ID 1: dtrace:::BEGIN): couldn't set option "Nixon" to "1": Invalid option name

and

dtrace: error in dt_clause_0 for probe ID 1 (dtrace:::BEGIN): couldn't set option "Nixon" to "1": Invalid option name

could both be rewritten using pattern amtching and substitutions to be:

dtrace: error for probe (dtrace:::BEGIN): couldn't set option "Nixon" to "1": Invalid option name

and tests that are supposed to exercise specific aspects of the error message
or that depend on specific details could test that explicitly?

> -dtrace: error on enabled probe ID 2 (ID 1: dtrace:::BEGIN): couldn't set option "Harding" to "1": Invalid option name
> +dtrace: error in dt_clause_0 for probe ID 1 (dtrace:::BEGIN): couldn't set option "Harding" to "1": Invalid option name
>  
> -dtrace: error on enabled probe ID 2 (ID 1: dtrace:::BEGIN): couldn't set option "Hoover" to "1": Invalid option name
> +dtrace: error in dt_clause_0 for probe ID 1 (dtrace:::BEGIN): couldn't set option "Hoover" to "1": Invalid option name
>  
> -dtrace: error on enabled probe ID 2 (ID 1: dtrace:::BEGIN): couldn't set option "Bush" to "1": Invalid option name
> +dtrace: error in dt_clause_0 for probe ID 1 (dtrace:::BEGIN): couldn't set option "Bush" to "1": Invalid option name
>  
> -dtrace: error on enabled probe ID 2 (ID 1: dtrace:::BEGIN): couldn't set option "quiet" to "um, no": Invalid value for specified option
> +dtrace: error in dt_clause_0 for probe ID 1 (dtrace:::BEGIN): couldn't set option "quiet" to "um, no": Invalid value for specified option
>  
> -dtrace: error on enabled probe ID 2 (ID 1: dtrace:::BEGIN): couldn't set option "aggrate" to "0.5hz": Invalid value for specified option
> +dtrace: error in dt_clause_0 for probe ID 1 (dtrace:::BEGIN): couldn't set option "aggrate" to "0.5hz": Invalid value for specified option
>  
> -dtrace: error on enabled probe ID 2 (ID 1: dtrace:::BEGIN): couldn't set option "bufsize" to "1m": Operation illegal when tracing is active
> +dtrace: error in dt_clause_0 for probe ID 1 (dtrace:::BEGIN): couldn't set option "bufsize" to "1m": Operation illegal when tracing is active
>  
> diff --git a/test/unittest/arrays/tst.declared-bounds.runtime_out.r b/test/unittest/arrays/tst.declared-bounds.runtime_out.r
> index 4917528d..9ab1ab8d 100644
> --- a/test/unittest/arrays/tst.declared-bounds.runtime_out.r
> +++ b/test/unittest/arrays/tst.declared-bounds.runtime_out.r
> @@ -1,3 +1,3 @@
>  expected run-time error
>  -- @@stderr --
> -dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): index out of bounds (8) in action #1 at BPF pc NNN
> +dtrace: error in dt_clause_0 for probe ID 1 (dtrace:::BEGIN): index out of bounds (8) at BPF pc NNN
> diff --git a/test/unittest/builtinvar/tst.id_ERROR.r.p b/test/unittest/builtinvar/tst.id_ERROR.r.p
> index 884b43f4..cd035080 100755
> --- a/test/unittest/builtinvar/tst.id_ERROR.r.p
> +++ b/test/unittest/builtinvar/tst.id_ERROR.r.p
> @@ -1,4 +1,4 @@
>  #!/usr/bin/gawk -f
>  
>  # Drop the line with run-dependent PRID for profile probe.
> -!/error on enabled probe ID/ { print }
> +!/dtrace: error in dt_clause_. for probe ID [0-9]* \(profile:::tick-1s):/ { print }
> diff --git a/test/unittest/codegen/err.deref_0.r b/test/unittest/codegen/err.deref_0.r
> index 07c1dc52..812ca433 100644
> --- a/test/unittest/codegen/err.deref_0.r
> +++ b/test/unittest/codegen/err.deref_0.r
> @@ -1,3 +1,3 @@
>  
>  -- @@stderr --
> -dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address (0) in action #1 at BPF pc NNN
> +dtrace: error in dt_clause_0 for probe ID 1 (dtrace:::BEGIN): invalid address (0) at BPF pc NNN
> diff --git a/test/unittest/codegen/err.deref_1.r b/test/unittest/codegen/err.deref_1.r
> index a2ca8ac4..01ca1037 100644
> --- a/test/unittest/codegen/err.deref_1.r
> +++ b/test/unittest/codegen/err.deref_1.r
> @@ -1,3 +1,3 @@
>  
>  -- @@stderr --
> -dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address (1) in action #1 at BPF pc NNN
> +dtrace: error in dt_clause_0 for probe ID 1 (dtrace:::BEGIN): invalid address (1) at BPF pc NNN
> diff --git a/test/unittest/codegen/err.deref_i0.r b/test/unittest/codegen/err.deref_i0.r
> index 07c1dc52..812ca433 100644
> --- a/test/unittest/codegen/err.deref_i0.r
> +++ b/test/unittest/codegen/err.deref_i0.r
> @@ -1,3 +1,3 @@
>  
>  -- @@stderr --
> -dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address (0) in action #1 at BPF pc NNN
> +dtrace: error in dt_clause_0 for probe ID 1 (dtrace:::BEGIN): invalid address (0) at BPF pc NNN
> diff --git a/test/unittest/codegen/err.deref_i1.r b/test/unittest/codegen/err.deref_i1.r
> index a2ca8ac4..01ca1037 100644
> --- a/test/unittest/codegen/err.deref_i1.r
> +++ b/test/unittest/codegen/err.deref_i1.r
> @@ -1,3 +1,3 @@
>  
>  -- @@stderr --
> -dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address (1) in action #1 at BPF pc NNN
> +dtrace: error in dt_clause_0 for probe ID 1 (dtrace:::BEGIN): invalid address (1) at BPF pc NNN
> diff --git a/test/unittest/codegen/err.deref_string-assoc.r b/test/unittest/codegen/err.deref_string-assoc.r
> index 08277992..5d4a36ff 100644
> --- a/test/unittest/codegen/err.deref_string-assoc.r
> +++ b/test/unittest/codegen/err.deref_string-assoc.r
> @@ -1,3 +1,3 @@
>  66
>  -- @@stderr --
> -dtrace: error on enabled probe ID 4 (ID 1: dtrace:::BEGIN): invalid address (1) in action #2 at BPF pc NNN
> +dtrace: error in dt_clause_1 for probe ID 1 (dtrace:::BEGIN): invalid address (1) at BPF pc NNN
> diff --git a/test/unittest/codegen/err.deref_string-gvar.r b/test/unittest/codegen/err.deref_string-gvar.r
> index 08277992..5d4a36ff 100644
> --- a/test/unittest/codegen/err.deref_string-gvar.r
> +++ b/test/unittest/codegen/err.deref_string-gvar.r
> @@ -1,3 +1,3 @@
>  66
>  -- @@stderr --
> -dtrace: error on enabled probe ID 4 (ID 1: dtrace:::BEGIN): invalid address (1) in action #2 at BPF pc NNN
> +dtrace: error in dt_clause_1 for probe ID 1 (dtrace:::BEGIN): invalid address (1) at BPF pc NNN
> diff --git a/test/unittest/codegen/err.deref_string-lvar.r b/test/unittest/codegen/err.deref_string-lvar.r
> index 08277992..5d4a36ff 100644
> --- a/test/unittest/codegen/err.deref_string-lvar.r
> +++ b/test/unittest/codegen/err.deref_string-lvar.r
> @@ -1,3 +1,3 @@
>  66
>  -- @@stderr --
> -dtrace: error on enabled probe ID 4 (ID 1: dtrace:::BEGIN): invalid address (1) in action #2 at BPF pc NNN
> +dtrace: error in dt_clause_1 for probe ID 1 (dtrace:::BEGIN): invalid address (1) at BPF pc NNN
> diff --git a/test/unittest/codegen/err.deref_string-tvar.r b/test/unittest/codegen/err.deref_string-tvar.r
> index 08277992..5d4a36ff 100644
> --- a/test/unittest/codegen/err.deref_string-tvar.r
> +++ b/test/unittest/codegen/err.deref_string-tvar.r
> @@ -1,3 +1,3 @@
>  66
>  -- @@stderr --
> -dtrace: error on enabled probe ID 4 (ID 1: dtrace:::BEGIN): invalid address (1) in action #2 at BPF pc NNN
> +dtrace: error in dt_clause_1 for probe ID 1 (dtrace:::BEGIN): invalid address (1) at BPF pc NNN
> diff --git a/test/unittest/codegen/err.str_NULL_plus_offset-assoc.r b/test/unittest/codegen/err.str_NULL_plus_offset-assoc.r
> index 187543b6..fa9c63a9 100644
> --- a/test/unittest/codegen/err.str_NULL_plus_offset-assoc.r
> +++ b/test/unittest/codegen/err.str_NULL_plus_offset-assoc.r
> @@ -1,3 +1,3 @@
>  
>  -- @@stderr --
> -dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
> +dtrace: error in dt_clause_0 for probe ID 1 (dtrace:::BEGIN): invalid address ({ptr}) at BPF pc NNN
> diff --git a/test/unittest/codegen/err.str_NULL_plus_offset-lvar.r b/test/unittest/codegen/err.str_NULL_plus_offset-lvar.r
> index 187543b6..fa9c63a9 100644
> --- a/test/unittest/codegen/err.str_NULL_plus_offset-lvar.r
> +++ b/test/unittest/codegen/err.str_NULL_plus_offset-lvar.r
> @@ -1,3 +1,3 @@
>  
>  -- @@stderr --
> -dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
> +dtrace: error in dt_clause_0 for probe ID 1 (dtrace:::BEGIN): invalid address ({ptr}) at BPF pc NNN
> diff --git a/test/unittest/codegen/err.str_NULL_plus_offset-tvar.r b/test/unittest/codegen/err.str_NULL_plus_offset-tvar.r
> index 187543b6..fa9c63a9 100644
> --- a/test/unittest/codegen/err.str_NULL_plus_offset-tvar.r
> +++ b/test/unittest/codegen/err.str_NULL_plus_offset-tvar.r
> @@ -1,3 +1,3 @@
>  
>  -- @@stderr --
> -dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
> +dtrace: error in dt_clause_0 for probe ID 1 (dtrace:::BEGIN): invalid address ({ptr}) at BPF pc NNN
> diff --git a/test/unittest/codegen/err.str_NULL_plus_offset.r b/test/unittest/codegen/err.str_NULL_plus_offset.r
> index 187543b6..fa9c63a9 100644
> --- a/test/unittest/codegen/err.str_NULL_plus_offset.r
> +++ b/test/unittest/codegen/err.str_NULL_plus_offset.r
> @@ -1,3 +1,3 @@
>  
>  -- @@stderr --
> -dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
> +dtrace: error in dt_clause_0 for probe ID 1 (dtrace:::BEGIN): invalid address ({ptr}) at BPF pc NNN
> diff --git a/test/unittest/disasm/tst.vartab-bvar.r b/test/unittest/disasm/tst.vartab-bvar.r
> index 06d7c52b..53e5f618 100644
> --- a/test/unittest/disasm/tst.vartab-bvar.r
> +++ b/test/unittest/disasm/tst.vartab-bvar.r
> @@ -4,7 +4,7 @@ curthread               scl glb r    D type (pointer) (size 8)
>  timestamp               scl glb r    D type (integer) (size 8)
>  vtimestamp              scl glb r    D type (integer) (size 8)
>  ipl                     scl glb r    D type (integer) (size 4)
> -epid                    scl glb r    D type (integer) (size 4)
> +epid                    scl glb r    D type (integer) (size 8)
>  id                      scl glb r    D type (integer) (size 4)
>  arg0                    scl glb r    D type (integer) (size 8)
>  arg1                    scl glb r    D type (integer) (size 8)
> diff --git a/test/unittest/drops/drp.DTRACEDROP_DBLERROR.r b/test/unittest/drops/drp.DTRACEDROP_DBLERROR.r
> index 9fa54dd9..364e0860 100644
> --- a/test/unittest/drops/drp.DTRACEDROP_DBLERROR.r
> +++ b/test/unittest/drops/drp.DTRACEDROP_DBLERROR.r
> @@ -4,4 +4,4 @@
>  -- @@stderr --
>  dtrace: script 'test/unittest/drops/drp.DTRACEDROP_DBLERROR.d' matched 3 probes
>  dtrace: [DTRACEDROP_DBLERROR] 1 error in ERROR probe enabling
> -dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
> +dtrace: error in dt_clause_0 for probe ID 1 (:::BEGIN): invalid address ({ptr}) at BPF pc NNN
> diff --git a/test/unittest/error/tst.DTRACEFLT_BADADDR.null_ptr_field.d b/test/unittest/error/tst.DTRACEFLT_BADADDR.null_ptr_field.d
> index df3ded2d..8b7a4d63 100644
> --- a/test/unittest/error/tst.DTRACEFLT_BADADDR.null_ptr_field.d
> +++ b/test/unittest/error/tst.DTRACEFLT_BADADDR.null_ptr_field.d
> @@ -1,6 +1,6 @@
>  /*
>   * Oracle Linux DTrace.
> - * Copyright (c) 2021, 2022, Oracle and/or its affiliates. All rights reserved.
> + * Copyright (c) 2021, 2024, Oracle and/or its affiliates. All rights reserved.
>   * Licensed under the Universal Permissive License v 1.0 as shown at
>   * http://oss.oracle.com/licenses/upl.
>   */
> @@ -15,13 +15,13 @@
>  
>  BEGIN
>  {
> -	myepid = epid;
> +	myid = id;
>  	trace(((struct task_struct *)NULL)->pid);
>  	exit(1);
>  }
>  
>  ERROR
>  {
> -	exit(arg1 != myepid || arg2 != 1 || arg4 != DTRACEFLT_BADADDR ||
> +	exit(arg1 != myid || arg2 != 0 || arg4 != DTRACEFLT_BADADDR ||
>  	     arg5 != 0);
>  }
> diff --git a/test/unittest/error/tst.DTRACEFLT_BADADDR.null_ptr_field.r b/test/unittest/error/tst.DTRACEFLT_BADADDR.null_ptr_field.r
> index 187543b6..fa9c63a9 100644
> --- a/test/unittest/error/tst.DTRACEFLT_BADADDR.null_ptr_field.r
> +++ b/test/unittest/error/tst.DTRACEFLT_BADADDR.null_ptr_field.r
> @@ -1,3 +1,3 @@
>  
>  -- @@stderr --
> -dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
> +dtrace: error in dt_clause_0 for probe ID 1 (dtrace:::BEGIN): invalid address ({ptr}) at BPF pc NNN
> diff --git a/test/unittest/error/tst.DTRACEFLT_BADADDR.r b/test/unittest/error/tst.DTRACEFLT_BADADDR.r
> index b9f5f43c..ec23cd45 100644
> --- a/test/unittest/error/tst.DTRACEFLT_BADADDR.r
> +++ b/test/unittest/error/tst.DTRACEFLT_BADADDR.r
> @@ -1,6 +1,6 @@
> -The arguments are 3 1 1 0
> +The arguments are 1 1 1 0
>  The value of arg4 should be 1
>  The value of arg5 should be 0
>  
>  -- @@stderr --
> -dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
> +dtrace: error in dt_clause_1 for probe ID 1 (dtrace:::BEGIN): invalid address ({ptr}) at BPF pc NNN
> diff --git a/test/unittest/error/tst.DTRACEFLT_BADADDR2.r b/test/unittest/error/tst.DTRACEFLT_BADADDR2.r
> index 6c5fa119..712678d8 100644
> --- a/test/unittest/error/tst.DTRACEFLT_BADADDR2.r
> +++ b/test/unittest/error/tst.DTRACEFLT_BADADDR2.r
> @@ -1,6 +1,6 @@
> -The arguments are 3 1 1 16384
> +The arguments are 1 1 1 16384
>  The value of arg4 should be 1
>  The value of arg5 should be 16384
>  
>  -- @@stderr --
> -dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
> +dtrace: error in dt_clause_1 for probe ID 1 (dtrace:::BEGIN): invalid address ({ptr}) at BPF pc NNN
> diff --git a/test/unittest/error/tst.DTRACEFLT_DIVZERO.div.d b/test/unittest/error/tst.DTRACEFLT_DIVZERO.div.d
> index bcd5e9aa..b1d15423 100644
> --- a/test/unittest/error/tst.DTRACEFLT_DIVZERO.div.d
> +++ b/test/unittest/error/tst.DTRACEFLT_DIVZERO.div.d
> @@ -1,6 +1,6 @@
>  /*
>   * Oracle Linux DTrace.
> - * Copyright (c) 2006, 2022, Oracle and/or its affiliates. All rights reserved.
> + * Copyright (c) 2006, 2024, Oracle and/or its affiliates. All rights reserved.
>   * Licensed under the Universal Permissive License v 1.0 as shown at
>   * http://oss.oracle.com/licenses/upl.
>   */
> @@ -13,9 +13,14 @@
>  
>  #pragma D option quiet
>  
> +BEGIN { myid = id } /* clause 0 */
> +BEGIN { myid = id } /* clause 1 */
> +BEGIN { myid = id } /* clause 2 */
> +BEGIN { myid = id } /* clause 3 */
> +
>  BEGIN
>  {
> -	myepid = epid;
> +	myid = id;
>  	i = 1;
>  	j = 2;
>  	j = i / (j - 2);
> @@ -24,6 +29,6 @@ BEGIN
>  
>  ERROR
>  {
> -	exit(arg1 != myepid || arg2 != 1 || arg4 != DTRACEFLT_DIVZERO ||
> +	exit(arg1 != myid || arg2 != 4 || arg4 != DTRACEFLT_DIVZERO ||
>  	     arg5 != 0);
>  }
> diff --git a/test/unittest/error/tst.DTRACEFLT_DIVZERO.div.r b/test/unittest/error/tst.DTRACEFLT_DIVZERO.div.r
> index e6d6afa2..45a787e5 100644
> --- a/test/unittest/error/tst.DTRACEFLT_DIVZERO.div.r
> +++ b/test/unittest/error/tst.DTRACEFLT_DIVZERO.div.r
> @@ -1,3 +1,3 @@
>  
>  -- @@stderr --
> -dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): divide-by-zero in action #1 at BPF pc NNN
> +dtrace: error in dt_clause_4 for probe ID 1 (dtrace:::BEGIN): divide-by-zero at BPF pc NNN
> diff --git a/test/unittest/error/tst.DTRACEFLT_DIVZERO.mod.d b/test/unittest/error/tst.DTRACEFLT_DIVZERO.mod.d
> index 105523f8..69452d8c 100644
> --- a/test/unittest/error/tst.DTRACEFLT_DIVZERO.mod.d
> +++ b/test/unittest/error/tst.DTRACEFLT_DIVZERO.mod.d
> @@ -1,6 +1,6 @@
>  /*
>   * Oracle Linux DTrace.
> - * Copyright (c) 2021, 2022, Oracle and/or its affiliates. All rights reserved.
> + * Copyright (c) 2021, 2024, Oracle and/or its affiliates. All rights reserved.
>   * Licensed under the Universal Permissive License v 1.0 as shown at
>   * http://oss.oracle.com/licenses/upl.
>   */
> @@ -13,9 +13,14 @@
>  
>  #pragma D option quiet
>  
> +BEGIN { myid = id; } /* clause 0 */
> +BEGIN { myid = id; } /* clause 1 */
> +BEGIN { myid = id; } /* clause 2 */
> +BEGIN { myid = id; } /* clause 3 */
> +
>  BEGIN
>  {
> -	myepid = epid;
> +	myid = id;
>  	i = 1;
>  	j = 2;
>  	j = i % (j - 2);
> @@ -24,6 +29,6 @@ BEGIN
>  
>  ERROR
>  {
> -	exit(arg1 != myepid || arg2 != 1 || arg4 != DTRACEFLT_DIVZERO ||
> +	exit(arg1 != myid || arg2 != 4 || arg4 != DTRACEFLT_DIVZERO ||
>  	     arg5 != 0);
>  }
> diff --git a/test/unittest/error/tst.DTRACEFLT_DIVZERO.mod.r b/test/unittest/error/tst.DTRACEFLT_DIVZERO.mod.r
> index e6d6afa2..45a787e5 100644
> --- a/test/unittest/error/tst.DTRACEFLT_DIVZERO.mod.r
> +++ b/test/unittest/error/tst.DTRACEFLT_DIVZERO.mod.r
> @@ -1,3 +1,3 @@
>  
>  -- @@stderr --
> -dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): divide-by-zero in action #1 at BPF pc NNN
> +dtrace: error in dt_clause_4 for probe ID 1 (dtrace:::BEGIN): divide-by-zero at BPF pc NNN
> diff --git a/test/unittest/error/tst.DTRACEFLT_UNKNOWN.r b/test/unittest/error/tst.DTRACEFLT_UNKNOWN.r
> index 1e4fdd64..caa5570f 100644
> --- a/test/unittest/error/tst.DTRACEFLT_UNKNOWN.r
> +++ b/test/unittest/error/tst.DTRACEFLT_UNKNOWN.r
> @@ -1,5 +1,5 @@
> -The arguments are 3 1 PC 1 64
> +The arguments are 1 1 PC 1 64
>  The value of arg4 = 0
>  
>  -- @@stderr --
> -dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
> +dtrace: error in dt_clause_1 for probe ID 1 (dtrace:::BEGIN): invalid address ({ptr}) at BPF pc NNN
> diff --git a/test/unittest/error/tst.clause_scope-begin-ended.r b/test/unittest/error/tst.clause_scope-begin-ended.r
> index 8d57382e..e806cc80 100644
> --- a/test/unittest/error/tst.clause_scope-begin-ended.r
> +++ b/test/unittest/error/tst.clause_scope-begin-ended.r
> @@ -2,4 +2,4 @@ Error fired
>  Clause executed
>  
>  -- @@stderr --
> -dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
> +dtrace: error in dt_clause_1 for probe ID 1 (dtrace:::BEGIN): invalid address ({ptr}) at BPF pc NNN
> diff --git a/test/unittest/error/tst.clause_scope-begin.r b/test/unittest/error/tst.clause_scope-begin.r
> index 8d57382e..e806cc80 100644
> --- a/test/unittest/error/tst.clause_scope-begin.r
> +++ b/test/unittest/error/tst.clause_scope-begin.r
> @@ -2,4 +2,4 @@ Error fired
>  Clause executed
>  
>  -- @@stderr --
> -dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
> +dtrace: error in dt_clause_1 for probe ID 1 (dtrace:::BEGIN): invalid address ({ptr}) at BPF pc NNN
> diff --git a/test/unittest/error/tst.clause_scope-regular.r b/test/unittest/error/tst.clause_scope-regular.r
> index fff6fe1e..d1b71add 100644
> --- a/test/unittest/error/tst.clause_scope-regular.r
> +++ b/test/unittest/error/tst.clause_scope-regular.r
> @@ -2,4 +2,4 @@ Error fired
>  Clause executed
>  
>  -- @@stderr --
> -dtrace: error on enabled probe ID 3 (ID nnn: profile:::tick-10ms): invalid address ({ptr}) in action #1 at BPF pc NNN
> +dtrace: error in dt_clause_1 for probe ID nnn (profile:::tick-10ms): invalid address ({ptr}) at BPF pc NNN
> diff --git a/test/unittest/error/tst.clause_scope-regular.r.p b/test/unittest/error/tst.clause_scope-regular.r.p
> index 7659601b..f7a200c4 100755
> --- a/test/unittest/error/tst.clause_scope-regular.r.p
> +++ b/test/unittest/error/tst.clause_scope-regular.r.p
> @@ -1,3 +1,7 @@
> -#!/bin/sed -f
> +#!/usr/bin/awk -f
> +
>  # This report has a variable probe ID in it.
> -s/ID [0-9][0-9]*: profile/ID nnn: profile/
> +{
> +    sub("for probe ID [0-9][0-9]* .profile", "for probe ID nnn (profile");
> +    print;
> +}
> diff --git a/test/unittest/error/tst.error.r b/test/unittest/error/tst.error.r
> index 0d29bcc8..d9f80037 100644
> --- a/test/unittest/error/tst.error.r
> +++ b/test/unittest/error/tst.error.r
> @@ -1,4 +1,4 @@
>  Error fired
>  
>  -- @@stderr --
> -dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
> +dtrace: error in dt_clause_1 for probe ID 1 (dtrace:::BEGIN): invalid address ({ptr}) at BPF pc NNN
> diff --git a/test/unittest/error/tst.errorend.r b/test/unittest/error/tst.errorend.r
> index 73abf697..9c07fa70 100644
> --- a/test/unittest/error/tst.errorend.r
> +++ b/test/unittest/error/tst.errorend.r
> @@ -2,4 +2,4 @@ Error fired
>  End fired after exit
>  
>  -- @@stderr --
> -dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
> +dtrace: error in dt_clause_2 for probe ID 1 (dtrace:::BEGIN): invalid address ({ptr}) at BPF pc NNN
> diff --git a/test/unittest/funcs/alloca/err.alloca-bcopy-before-beyond.r b/test/unittest/funcs/alloca/err.alloca-bcopy-before-beyond.r
> index 187543b6..fa9c63a9 100644
> --- a/test/unittest/funcs/alloca/err.alloca-bcopy-before-beyond.r
> +++ b/test/unittest/funcs/alloca/err.alloca-bcopy-before-beyond.r
> @@ -1,3 +1,3 @@
>  
>  -- @@stderr --
> -dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
> +dtrace: error in dt_clause_0 for probe ID 1 (dtrace:::BEGIN): invalid address ({ptr}) at BPF pc NNN
> diff --git a/test/unittest/funcs/alloca/err.alloca-bcopy-before-bottom.r b/test/unittest/funcs/alloca/err.alloca-bcopy-before-bottom.r
> index 187543b6..fa9c63a9 100644
> --- a/test/unittest/funcs/alloca/err.alloca-bcopy-before-bottom.r
> +++ b/test/unittest/funcs/alloca/err.alloca-bcopy-before-bottom.r
> @@ -1,3 +1,3 @@
>  
>  -- @@stderr --
> -dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
> +dtrace: error in dt_clause_0 for probe ID 1 (dtrace:::BEGIN): invalid address ({ptr}) at BPF pc NNN
> diff --git a/test/unittest/funcs/alloca/err.alloca-bcopy-beyond-top.r b/test/unittest/funcs/alloca/err.alloca-bcopy-beyond-top.r
> index 187543b6..fa9c63a9 100644
> --- a/test/unittest/funcs/alloca/err.alloca-bcopy-beyond-top.r
> +++ b/test/unittest/funcs/alloca/err.alloca-bcopy-beyond-top.r
> @@ -1,3 +1,3 @@
>  
>  -- @@stderr --
> -dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
> +dtrace: error in dt_clause_0 for probe ID 1 (dtrace:::BEGIN): invalid address ({ptr}) at BPF pc NNN
> diff --git a/test/unittest/funcs/alloca/err.alloca-bcopy-crossing-bottom.r b/test/unittest/funcs/alloca/err.alloca-bcopy-crossing-bottom.r
> index 187543b6..fa9c63a9 100644
> --- a/test/unittest/funcs/alloca/err.alloca-bcopy-crossing-bottom.r
> +++ b/test/unittest/funcs/alloca/err.alloca-bcopy-crossing-bottom.r
> @@ -1,3 +1,3 @@
>  
>  -- @@stderr --
> -dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
> +dtrace: error in dt_clause_0 for probe ID 1 (dtrace:::BEGIN): invalid address ({ptr}) at BPF pc NNN
> diff --git a/test/unittest/funcs/alloca/err.alloca-bcopy-crossing-top.r b/test/unittest/funcs/alloca/err.alloca-bcopy-crossing-top.r
> index 4257f567..fab8ca7f 100644
> --- a/test/unittest/funcs/alloca/err.alloca-bcopy-crossing-top.r
> +++ b/test/unittest/funcs/alloca/err.alloca-bcopy-crossing-top.r
> @@ -1,3 +1,3 @@
>  
>  -- @@stderr --
> -dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid size ({ptr}) in action #1 at BPF pc NNN
> +dtrace: error in dt_clause_0 for probe ID 1 (dtrace:::BEGIN): invalid size ({ptr}) at BPF pc NNN
> diff --git a/test/unittest/funcs/alloca/err.alloca-crossing-clauses.r b/test/unittest/funcs/alloca/err.alloca-crossing-clauses.r
> index f5ff855d..6bea5653 100644
> --- a/test/unittest/funcs/alloca/err.alloca-crossing-clauses.r
> +++ b/test/unittest/funcs/alloca/err.alloca-crossing-clauses.r
> @@ -1,3 +1,3 @@
>  
>  -- @@stderr --
> -dtrace: error on enabled probe ID 4 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #2 at BPF pc NNN
> +dtrace: error in dt_clause_1 for probe ID 1 (dtrace:::BEGIN): invalid address ({ptr}) at BPF pc NNN
> diff --git a/test/unittest/funcs/alloca/err.alloca-load-before-bottom.r b/test/unittest/funcs/alloca/err.alloca-load-before-bottom.r
> index 187543b6..fa9c63a9 100644
> --- a/test/unittest/funcs/alloca/err.alloca-load-before-bottom.r
> +++ b/test/unittest/funcs/alloca/err.alloca-load-before-bottom.r
> @@ -1,3 +1,3 @@
>  
>  -- @@stderr --
> -dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
> +dtrace: error in dt_clause_0 for probe ID 1 (dtrace:::BEGIN): invalid address ({ptr}) at BPF pc NNN
> diff --git a/test/unittest/funcs/alloca/err.alloca-load-beyond-top.r b/test/unittest/funcs/alloca/err.alloca-load-beyond-top.r
> index 187543b6..fa9c63a9 100644
> --- a/test/unittest/funcs/alloca/err.alloca-load-beyond-top.r
> +++ b/test/unittest/funcs/alloca/err.alloca-load-beyond-top.r
> @@ -1,3 +1,3 @@
>  
>  -- @@stderr --
> -dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
> +dtrace: error in dt_clause_0 for probe ID 1 (dtrace:::BEGIN): invalid address ({ptr}) at BPF pc NNN
> diff --git a/test/unittest/funcs/alloca/err.alloca-load-crossing-bottom.r b/test/unittest/funcs/alloca/err.alloca-load-crossing-bottom.r
> index 187543b6..fa9c63a9 100644
> --- a/test/unittest/funcs/alloca/err.alloca-load-crossing-bottom.r
> +++ b/test/unittest/funcs/alloca/err.alloca-load-crossing-bottom.r
> @@ -1,3 +1,3 @@
>  
>  -- @@stderr --
> -dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
> +dtrace: error in dt_clause_0 for probe ID 1 (dtrace:::BEGIN): invalid address ({ptr}) at BPF pc NNN
> diff --git a/test/unittest/funcs/alloca/err.alloca-null-deref-lvalue.r b/test/unittest/funcs/alloca/err.alloca-null-deref-lvalue.r
> index 187543b6..fa9c63a9 100644
> --- a/test/unittest/funcs/alloca/err.alloca-null-deref-lvalue.r
> +++ b/test/unittest/funcs/alloca/err.alloca-null-deref-lvalue.r
> @@ -1,3 +1,3 @@
>  
>  -- @@stderr --
> -dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
> +dtrace: error in dt_clause_0 for probe ID 1 (dtrace:::BEGIN): invalid address ({ptr}) at BPF pc NNN
> diff --git a/test/unittest/funcs/alloca/err.alloca-null-deref.r b/test/unittest/funcs/alloca/err.alloca-null-deref.r
> index 187543b6..fa9c63a9 100644
> --- a/test/unittest/funcs/alloca/err.alloca-null-deref.r
> +++ b/test/unittest/funcs/alloca/err.alloca-null-deref.r
> @@ -1,3 +1,3 @@
>  
>  -- @@stderr --
> -dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
> +dtrace: error in dt_clause_0 for probe ID 1 (dtrace:::BEGIN): invalid address ({ptr}) at BPF pc NNN
> diff --git a/test/unittest/funcs/alloca/err.alloca-scratch-exceeding-bcopy.r b/test/unittest/funcs/alloca/err.alloca-scratch-exceeding-bcopy.r
> index 4257f567..fab8ca7f 100644
> --- a/test/unittest/funcs/alloca/err.alloca-scratch-exceeding-bcopy.r
> +++ b/test/unittest/funcs/alloca/err.alloca-scratch-exceeding-bcopy.r
> @@ -1,3 +1,3 @@
>  
>  -- @@stderr --
> -dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid size ({ptr}) in action #1 at BPF pc NNN
> +dtrace: error in dt_clause_0 for probe ID 1 (dtrace:::BEGIN): invalid size ({ptr}) at BPF pc NNN
> diff --git a/test/unittest/funcs/alloca/err.alloca-store-before-bottom.r b/test/unittest/funcs/alloca/err.alloca-store-before-bottom.r
> index 187543b6..fa9c63a9 100644
> --- a/test/unittest/funcs/alloca/err.alloca-store-before-bottom.r
> +++ b/test/unittest/funcs/alloca/err.alloca-store-before-bottom.r
> @@ -1,3 +1,3 @@
>  
>  -- @@stderr --
> -dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
> +dtrace: error in dt_clause_0 for probe ID 1 (dtrace:::BEGIN): invalid address ({ptr}) at BPF pc NNN
> diff --git a/test/unittest/funcs/alloca/err.alloca-store-beyond-top.r b/test/unittest/funcs/alloca/err.alloca-store-beyond-top.r
> index 187543b6..fa9c63a9 100644
> --- a/test/unittest/funcs/alloca/err.alloca-store-beyond-top.r
> +++ b/test/unittest/funcs/alloca/err.alloca-store-beyond-top.r
> @@ -1,3 +1,3 @@
>  
>  -- @@stderr --
> -dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
> +dtrace: error in dt_clause_0 for probe ID 1 (dtrace:::BEGIN): invalid address ({ptr}) at BPF pc NNN
> diff --git a/test/unittest/funcs/alloca/err.alloca-store-crossing-bottom.r b/test/unittest/funcs/alloca/err.alloca-store-crossing-bottom.r
> index 187543b6..fa9c63a9 100644
> --- a/test/unittest/funcs/alloca/err.alloca-store-crossing-bottom.r
> +++ b/test/unittest/funcs/alloca/err.alloca-store-crossing-bottom.r
> @@ -1,3 +1,3 @@
>  
>  -- @@stderr --
> -dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
> +dtrace: error in dt_clause_0 for probe ID 1 (dtrace:::BEGIN): invalid address ({ptr}) at BPF pc NNN
> diff --git a/test/unittest/funcs/bcopy/err.badbcopy1.r b/test/unittest/funcs/bcopy/err.badbcopy1.r
> index 187543b6..fa9c63a9 100644
> --- a/test/unittest/funcs/bcopy/err.badbcopy1.r
> +++ b/test/unittest/funcs/bcopy/err.badbcopy1.r
> @@ -1,3 +1,3 @@
>  
>  -- @@stderr --
> -dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
> +dtrace: error in dt_clause_0 for probe ID 1 (dtrace:::BEGIN): invalid address ({ptr}) at BPF pc NNN
> diff --git a/test/unittest/funcs/bcopy/err.badbcopy4.r b/test/unittest/funcs/bcopy/err.badbcopy4.r
> index 187543b6..fa9c63a9 100644
> --- a/test/unittest/funcs/bcopy/err.badbcopy4.r
> +++ b/test/unittest/funcs/bcopy/err.badbcopy4.r
> @@ -1,3 +1,3 @@
>  
>  -- @@stderr --
> -dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
> +dtrace: error in dt_clause_0 for probe ID 1 (dtrace:::BEGIN): invalid address ({ptr}) at BPF pc NNN
> diff --git a/test/unittest/funcs/bcopy/err.badbcopy5.r b/test/unittest/funcs/bcopy/err.badbcopy5.r
> index 187543b6..fa9c63a9 100644
> --- a/test/unittest/funcs/bcopy/err.badbcopy5.r
> +++ b/test/unittest/funcs/bcopy/err.badbcopy5.r
> @@ -1,3 +1,3 @@
>  
>  -- @@stderr --
> -dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
> +dtrace: error in dt_clause_0 for probe ID 1 (dtrace:::BEGIN): invalid address ({ptr}) at BPF pc NNN
> diff --git a/test/unittest/funcs/bcopy/err.badbcopy6.r b/test/unittest/funcs/bcopy/err.badbcopy6.r
> index 4257f567..fab8ca7f 100644
> --- a/test/unittest/funcs/bcopy/err.badbcopy6.r
> +++ b/test/unittest/funcs/bcopy/err.badbcopy6.r
> @@ -1,3 +1,3 @@
>  
>  -- @@stderr --
> -dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid size ({ptr}) in action #1 at BPF pc NNN
> +dtrace: error in dt_clause_0 for probe ID 1 (dtrace:::BEGIN): invalid size ({ptr}) at BPF pc NNN
> diff --git a/test/unittest/funcs/bcopy/err.badbcopy7.r b/test/unittest/funcs/bcopy/err.badbcopy7.r
> index 4257f567..fab8ca7f 100644
> --- a/test/unittest/funcs/bcopy/err.badbcopy7.r
> +++ b/test/unittest/funcs/bcopy/err.badbcopy7.r
> @@ -1,3 +1,3 @@
>  
>  -- @@stderr --
> -dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid size ({ptr}) in action #1 at BPF pc NNN
> +dtrace: error in dt_clause_0 for probe ID 1 (dtrace:::BEGIN): invalid size ({ptr}) at BPF pc NNN
> diff --git a/test/unittest/funcs/bcopy/err.badbcopy8.r b/test/unittest/funcs/bcopy/err.badbcopy8.r
> index 4257f567..fab8ca7f 100644
> --- a/test/unittest/funcs/bcopy/err.badbcopy8.r
> +++ b/test/unittest/funcs/bcopy/err.badbcopy8.r
> @@ -1,3 +1,3 @@
>  
>  -- @@stderr --
> -dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid size ({ptr}) in action #1 at BPF pc NNN
> +dtrace: error in dt_clause_0 for probe ID 1 (dtrace:::BEGIN): invalid size ({ptr}) at BPF pc NNN
> diff --git a/test/unittest/funcs/copyin/err.badaddr.r b/test/unittest/funcs/copyin/err.badaddr.r
> index ba4a4695..7b0c5949 100644
> --- a/test/unittest/funcs/copyin/err.badaddr.r
> +++ b/test/unittest/funcs/copyin/err.badaddr.r
> @@ -3,4 +3,4 @@
>  
>  -- @@stderr --
>  dtrace: script 'test/unittest/funcs/copyin/err.badaddr.d' matched 2 probes
> -dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
> +dtrace: error in dt_clause_0 for probe ID 1 (dtrace:::BEGIN): invalid address ({ptr}) at BPF pc NNN
> diff --git a/test/unittest/funcs/copyin/err.null_arg1.r b/test/unittest/funcs/copyin/err.null_arg1.r
> index a806d107..270dc9ce 100644
> --- a/test/unittest/funcs/copyin/err.null_arg1.r
> +++ b/test/unittest/funcs/copyin/err.null_arg1.r
> @@ -3,4 +3,4 @@
>  
>  -- @@stderr --
>  dtrace: script 'test/unittest/funcs/copyin/err.null_arg1.d' matched 2 probes
> -dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
> +dtrace: error in dt_clause_0 for probe ID 1 (dtrace:::BEGIN): invalid address ({ptr}) at BPF pc NNN
> diff --git a/test/unittest/funcs/copyinstr/err.badaddr.r b/test/unittest/funcs/copyinstr/err.badaddr.r
> index 0f566d6e..6f341979 100644
> --- a/test/unittest/funcs/copyinstr/err.badaddr.r
> +++ b/test/unittest/funcs/copyinstr/err.badaddr.r
> @@ -3,4 +3,4 @@
>  
>  -- @@stderr --
>  dtrace: script 'test/unittest/funcs/copyinstr/err.badaddr.d' matched 2 probes
> -dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
> +dtrace: error in dt_clause_0 for probe ID 1 (dtrace:::BEGIN): invalid address ({ptr}) at BPF pc NNN
> diff --git a/test/unittest/funcs/copyinstr/err.null_arg1.r b/test/unittest/funcs/copyinstr/err.null_arg1.r
> index cdd7c22c..cac3de0e 100644
> --- a/test/unittest/funcs/copyinstr/err.null_arg1.r
> +++ b/test/unittest/funcs/copyinstr/err.null_arg1.r
> @@ -3,4 +3,4 @@
>  
>  -- @@stderr --
>  dtrace: script 'test/unittest/funcs/copyinstr/err.null_arg1.d' matched 2 probes
> -dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
> +dtrace: error in dt_clause_0 for probe ID 1 (dtrace:::BEGIN): invalid address ({ptr}) at BPF pc NNN
> diff --git a/test/unittest/funcs/copyinto/err.badaddr.r b/test/unittest/funcs/copyinto/err.badaddr.r
> index 11861e1f..c86debc0 100644
> --- a/test/unittest/funcs/copyinto/err.badaddr.r
> +++ b/test/unittest/funcs/copyinto/err.badaddr.r
> @@ -3,4 +3,4 @@
>  
>  -- @@stderr --
>  dtrace: script 'test/unittest/funcs/copyinto/err.badaddr.d' matched 2 probes
> -dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
> +dtrace: error in dt_clause_0 for probe ID 1 (dtrace:::BEGIN): invalid address ({ptr}) at BPF pc NNN
> diff --git a/test/unittest/funcs/copyinto/err.badsize.r b/test/unittest/funcs/copyinto/err.badsize.r
> index ec4b062e..1be8abf4 100644
> --- a/test/unittest/funcs/copyinto/err.badsize.r
> +++ b/test/unittest/funcs/copyinto/err.badsize.r
> @@ -3,4 +3,4 @@
>  
>  -- @@stderr --
>  dtrace: script 'test/unittest/funcs/copyinto/err.badsize.d' matched 2 probes
> -dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid size ({ptr}) in action #1 at BPF pc NNN
> +dtrace: error in dt_clause_0 for probe ID 1 (dtrace:::BEGIN): invalid size ({ptr}) at BPF pc NNN
> diff --git a/test/unittest/funcs/copyinto/err.null_arg1.r b/test/unittest/funcs/copyinto/err.null_arg1.r
> index f568ee5c..215e0f19 100644
> --- a/test/unittest/funcs/copyinto/err.null_arg1.r
> +++ b/test/unittest/funcs/copyinto/err.null_arg1.r
> @@ -3,4 +3,4 @@
>  
>  -- @@stderr --
>  dtrace: script 'test/unittest/funcs/copyinto/err.null_arg1.d' matched 2 probes
> -dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
> +dtrace: error in dt_clause_0 for probe ID 1 (dtrace:::BEGIN): invalid address ({ptr}) at BPF pc NNN
> diff --git a/test/unittest/funcs/err.badalloca.r b/test/unittest/funcs/err.badalloca.r
> index 30224330..078630b6 100644
> --- a/test/unittest/funcs/err.badalloca.r
> +++ b/test/unittest/funcs/err.badalloca.r
> @@ -1,3 +1,3 @@
>  
>  -- @@stderr --
> -dtrace: error on enabled probe ID 4 (ID NNN: profile:::tick-1): invalid address ({ptr}) in action #1 at BPF pc NNN
> +dtrace: error in dt_clause_1 for probe ID NNN (profile:::tick-1): invalid address ({ptr}) at BPF pc NNN
> diff --git a/test/unittest/funcs/err.badalloca.r.p b/test/unittest/funcs/err.badalloca.r.p
> index d7a88a39..93d0acfb 100755
> --- a/test/unittest/funcs/err.badalloca.r.p
> +++ b/test/unittest/funcs/err.badalloca.r.p
> @@ -1,3 +1,7 @@
> -#!/bin/sed -f
> +#!/usr/bin/awk -f
>  
> -s/(ID [0-9]*/(ID NNN/g
> +# This report has a variable probe ID in it.
> +{
> +    sub("for probe ID [0-9]* .profile", "for probe ID NNN (profile");
> +    print;
> +}
> diff --git a/test/unittest/funcs/err.link_ntopbadaddr.r b/test/unittest/funcs/err.link_ntopbadaddr.r
> index b798b5e0..5acdfe61 100644
> --- a/test/unittest/funcs/err.link_ntopbadaddr.r
> +++ b/test/unittest/funcs/err.link_ntopbadaddr.r
> @@ -1,3 +1,3 @@
>  -- @@stderr --
> -dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
> +dtrace: error in dt_clause_0 for probe ID 1 (dtrace:::BEGIN): invalid address ({ptr}) at BPF pc NNN
>  
> diff --git a/test/unittest/funcs/err.link_ntopbadarg.r b/test/unittest/funcs/err.link_ntopbadarg.r
> index e386a67c..32c13dde 100644
> --- a/test/unittest/funcs/err.link_ntopbadarg.r
> +++ b/test/unittest/funcs/err.link_ntopbadarg.r
> @@ -1,3 +1,3 @@
>  -- @@stderr --
> -dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): illegal operation in action #1 at BPF pc NNN
> +dtrace: error in dt_clause_0 for probe ID 1 (dtrace:::BEGIN): illegal operation at BPF pc NNN
>  
> diff --git a/test/unittest/funcs/inet_ntoa6/err.inet_ntoa6.arg1_null.r b/test/unittest/funcs/inet_ntoa6/err.inet_ntoa6.arg1_null.r
> index 187543b6..fa9c63a9 100644
> --- a/test/unittest/funcs/inet_ntoa6/err.inet_ntoa6.arg1_null.r
> +++ b/test/unittest/funcs/inet_ntoa6/err.inet_ntoa6.arg1_null.r
> @@ -1,3 +1,3 @@
>  
>  -- @@stderr --
> -dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
> +dtrace: error in dt_clause_0 for probe ID 1 (dtrace:::BEGIN): invalid address ({ptr}) at BPF pc NNN
> diff --git a/test/unittest/funcs/inet_ntoa6/err.inet_ntoa6.arg1_null_const.r b/test/unittest/funcs/inet_ntoa6/err.inet_ntoa6.arg1_null_const.r
> index 187543b6..fa9c63a9 100644
> --- a/test/unittest/funcs/inet_ntoa6/err.inet_ntoa6.arg1_null_const.r
> +++ b/test/unittest/funcs/inet_ntoa6/err.inet_ntoa6.arg1_null_const.r
> @@ -1,3 +1,3 @@
>  
>  -- @@stderr --
> -dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
> +dtrace: error in dt_clause_0 for probe ID 1 (dtrace:::BEGIN): invalid address ({ptr}) at BPF pc NNN
> diff --git a/test/unittest/funcs/strlen/tst.null.r b/test/unittest/funcs/strlen/tst.null.r
> index 187543b6..fa9c63a9 100644
> --- a/test/unittest/funcs/strlen/tst.null.r
> +++ b/test/unittest/funcs/strlen/tst.null.r
> @@ -1,3 +1,3 @@
>  
>  -- @@stderr --
> -dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
> +dtrace: error in dt_clause_0 for probe ID 1 (dtrace:::BEGIN): invalid address ({ptr}) at BPF pc NNN
> diff --git a/test/unittest/funcs/strtok/tst.strtok_null.r b/test/unittest/funcs/strtok/tst.strtok_null.r
> index 03226aa1..319af487 100644
> --- a/test/unittest/funcs/strtok/tst.strtok_null.r
> +++ b/test/unittest/funcs/strtok/tst.strtok_null.r
> @@ -3,4 +3,4 @@
>  
>  -- @@stderr --
>  dtrace: script 'test/unittest/funcs/strtok/tst.strtok_null.d' matched 2 probes
> -dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
> +dtrace: error in dt_clause_0 for probe ID 1 (dtrace:::BEGIN): invalid address ({ptr}) at BPF pc NNN
> diff --git a/test/unittest/funcs/strtok/tst.strtok_nulldel.r b/test/unittest/funcs/strtok/tst.strtok_nulldel.r
> index 70f8e4e2..82bbba19 100644
> --- a/test/unittest/funcs/strtok/tst.strtok_nulldel.r
> +++ b/test/unittest/funcs/strtok/tst.strtok_nulldel.r
> @@ -3,4 +3,4 @@
>  
>  -- @@stderr --
>  dtrace: script 'test/unittest/funcs/strtok/tst.strtok_nulldel.d' matched 2 probes
> -dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
> +dtrace: error in dt_clause_0 for probe ID 1 (dtrace:::BEGIN): invalid address ({ptr}) at BPF pc NNN
> diff --git a/test/unittest/funcs/strtok/tst.strtok_nullstr.r b/test/unittest/funcs/strtok/tst.strtok_nullstr.r
> index a57b2469..1183b2bd 100644
> --- a/test/unittest/funcs/strtok/tst.strtok_nullstr.r
> +++ b/test/unittest/funcs/strtok/tst.strtok_nullstr.r
> @@ -3,4 +3,4 @@
>  
>  -- @@stderr --
>  dtrace: script 'test/unittest/funcs/strtok/tst.strtok_nullstr.d' matched 2 probes
> -dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
> +dtrace: error in dt_clause_0 for probe ID 1 (dtrace:::BEGIN): invalid address ({ptr}) at BPF pc NNN
> diff --git a/test/unittest/funcs/strtok/tst.strtok_nullstr2.r b/test/unittest/funcs/strtok/tst.strtok_nullstr2.r
> index d7df3aca..082e0e0c 100644
> --- a/test/unittest/funcs/strtok/tst.strtok_nullstr2.r
> +++ b/test/unittest/funcs/strtok/tst.strtok_nullstr2.r
> @@ -4,4 +4,4 @@
>  
>  -- @@stderr --
>  dtrace: script 'test/unittest/funcs/strtok/tst.strtok_nullstr2.d' matched 4 probes
> -dtrace: error on enabled probe ID 4 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #2 at BPF pc NNN
> +dtrace: error in dt_clause_1 for probe ID 1 (dtrace:::BEGIN): invalid address ({ptr}) at BPF pc NNN
> diff --git a/test/unittest/funcs/substr/err.substr_null_arg1.r b/test/unittest/funcs/substr/err.substr_null_arg1.r
> index 187543b6..fa9c63a9 100644
> --- a/test/unittest/funcs/substr/err.substr_null_arg1.r
> +++ b/test/unittest/funcs/substr/err.substr_null_arg1.r
> @@ -1,3 +1,3 @@
>  
>  -- @@stderr --
> -dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
> +dtrace: error in dt_clause_0 for probe ID 1 (dtrace:::BEGIN): invalid address ({ptr}) at BPF pc NNN
> diff --git a/test/unittest/pointers/err.AllocaOverrun.r b/test/unittest/pointers/err.AllocaOverrun.r
> index 187543b6..fa9c63a9 100644
> --- a/test/unittest/pointers/err.AllocaOverrun.r
> +++ b/test/unittest/pointers/err.AllocaOverrun.r
> @@ -1,3 +1,3 @@
>  
>  -- @@stderr --
> -dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
> +dtrace: error in dt_clause_0 for probe ID 1 (dtrace:::BEGIN): invalid address ({ptr}) at BPF pc NNN
> diff --git a/test/unittest/pointers/err.BadAlign.r b/test/unittest/pointers/err.BadAlign.r
> index 187543b6..fa9c63a9 100644
> --- a/test/unittest/pointers/err.BadAlign.r
> +++ b/test/unittest/pointers/err.BadAlign.r
> @@ -1,3 +1,3 @@
>  
>  -- @@stderr --
> -dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
> +dtrace: error in dt_clause_0 for probe ID 1 (dtrace:::BEGIN): invalid address ({ptr}) at BPF pc NNN
> diff --git a/test/unittest/pointers/err.InvalidAddress2.r b/test/unittest/pointers/err.InvalidAddress2.r
> index 187543b6..fa9c63a9 100644
> --- a/test/unittest/pointers/err.InvalidAddress2.r
> +++ b/test/unittest/pointers/err.InvalidAddress2.r
> @@ -1,3 +1,3 @@
>  
>  -- @@stderr --
> -dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
> +dtrace: error in dt_clause_0 for probe ID 1 (dtrace:::BEGIN): invalid address ({ptr}) at BPF pc NNN
> diff --git a/test/unittest/pointers/err.InvalidAddress4.r b/test/unittest/pointers/err.InvalidAddress4.r
> index 187543b6..fa9c63a9 100644
> --- a/test/unittest/pointers/err.InvalidAddress4.r
> +++ b/test/unittest/pointers/err.InvalidAddress4.r
> @@ -1,3 +1,3 @@
>  
>  -- @@stderr --
> -dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
> +dtrace: error in dt_clause_0 for probe ID 1 (dtrace:::BEGIN): invalid address ({ptr}) at BPF pc NNN
> diff --git a/test/unittest/speculation/err.CommitWithInvalid.r b/test/unittest/speculation/err.CommitWithInvalid.r
> index fc072417..0449b242 100644
> --- a/test/unittest/speculation/err.CommitWithInvalid.r
> +++ b/test/unittest/speculation/err.CommitWithInvalid.r
> @@ -1,3 +1,3 @@
>  
>  -- @@stderr --
> -dtrace: error on enabled probe ID 4 (ID 1: dtrace:::BEGIN): illegal operation in action #2 at BPF pc NNN
> +dtrace: error in dt_clause_1 for probe ID 1 (dtrace:::BEGIN): illegal operation at BPF pc NNN
> diff --git a/test/unittest/speculation/err.DiscardWithInvalid.r b/test/unittest/speculation/err.DiscardWithInvalid.r
> index fc072417..0449b242 100644
> --- a/test/unittest/speculation/err.DiscardWithInvalid.r
> +++ b/test/unittest/speculation/err.DiscardWithInvalid.r
> @@ -1,3 +1,3 @@
>  
>  -- @@stderr --
> -dtrace: error on enabled probe ID 4 (ID 1: dtrace:::BEGIN): illegal operation in action #2 at BPF pc NNN
> +dtrace: error in dt_clause_1 for probe ID 1 (dtrace:::BEGIN): illegal operation at BPF pc NNN
> diff --git a/test/unittest/speculation/tst.negcommit.r b/test/unittest/speculation/tst.negcommit.r
> index 69f246a0..cf8fb6f8 100644
> --- a/test/unittest/speculation/tst.negcommit.r
> +++ b/test/unittest/speculation/tst.negcommit.r
> @@ -3,4 +3,4 @@
>  
>  -- @@stderr --
>  dtrace: script 'test/unittest/speculation/tst.negcommit.d' matched 2 probes
> -dtrace: error on enabled probe ID 2 (ID 1: dtrace:::BEGIN): illegal operation in action #1 at BPF pc NNN
> +dtrace: error in dt_clause_0 for probe ID 1 (dtrace:::BEGIN): illegal operation at BPF pc NNN
> diff --git a/test/unittest/variables/bvar/tst.arg3-ERROR.sh b/test/unittest/variables/bvar/tst.arg3-ERROR.sh
> index 4b139be2..902298c2 100755
> --- a/test/unittest/variables/bvar/tst.arg3-ERROR.sh
> +++ b/test/unittest/variables/bvar/tst.arg3-ERROR.sh
> @@ -151,7 +151,7 @@ done
>  
>  # Do a sanity check on DTrace's error output.
>  
> -awk '/^dtrace: error on enabled probe ID [0-9]* \(ID 1: dtrace:::BEGIN): invalid address \(0x40) in action #[0-9] at BPF pc [0-9]*$/ { print $NF }' \
> +awk '/^dtrace: error in dt_clause_[1-4] for probe ID 1 \(dtrace:::BEGIN): invalid address \(0x40) at BPF pc [0-9]*$/ { print $NF }' \
>    disasm.out > err_pcs.txt.chk1
>  if ! diff -q err_pcs.txt err_pcs.txt.chk1; then
>  	echo ERROR: problem with DTrace error output
> -- 
> 2.43.5
> 
