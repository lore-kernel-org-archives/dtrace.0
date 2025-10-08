Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 314CD35949
	for <dtrace@lists.linux.dev>; Wed,  8 Oct 2025 18:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759947529; cv=fail; b=b5wZmNpvtlZc/Ayo7VtNJahD7V1pq+cwI9VAYhgu5Jxy/6kYNBXF0vG+pzzNbEYfjtLhhUdSSOL8e9HBQmbokq59UYCH7Ceb2mBkvBwsn2vya4J0S90DzbWzJ7b+XhmSX4c0axeQdsDuYzzffUzlloKiYH0vBD0q9peERRS/LOk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759947529; c=relaxed/simple;
	bh=AAW8sH/9wxvN650Y0/PzKTgwvZ9wyR32sS6fgD1bMM0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=hYChMcEnUnXxRuNzYTEVr9K9LiuGhN0Ltks3CYPe2Uk20SeptlPO0RZHj8fs25A9lkBQ7g9ue1CPFECIAtDSnp9zazD1s96iZGGfUsw3cHEoqfAg+lacXMmi+Pqsz5w6dPj4Ai7V/WpKMyFPY42ipQ0N56RaR49eYngM6Xat0qg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Sbv3Vf98; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=cfx+cM6H; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Sbv3Vf98";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="cfx+cM6H"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 598HESGs029178
	for <dtrace@lists.linux.dev>; Wed, 8 Oct 2025 18:18:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=NpP+ibGHzAlDJYM9gg
	WsOHPoNqLWF0LUCvSMnBZ1ODk=; b=Sbv3Vf989zs+J+PTpJY1j4216E38smO0if
	blEKFy2in03QbizhSCzTR4lcdsTOM1jSLl+LdlaVjLSqDhzhI7kxDr5stqk9/CBN
	TUh5PEBsuOBfbxTMR2TZELp7lEmQ48nBKg5sc+nHC8w1ua7Ze7/ReVGC7CvWNWCw
	9JA564Gu3+CtWd8bSVsMFI40d+5yTYzr4aV5Mt+sOwGc9WnRBb6eGl96SAhnc/wv
	2LYSDz7cl1Dcrqg9bmpEq6wfcAKLZvoxyPZkc4oWB8RxcnnitPZKXCnwn7YcxYQJ
	hbxzUYabrBXiD8WL/iymKODFXwIOowyuy6ijbSw+wTuECmDAt16w==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 49nv6b83r8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 08 Oct 2025 18:18:47 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 598HE9H5010279
	for <dtrace@lists.linux.dev>; Wed, 8 Oct 2025 18:18:46 GMT
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011002.outbound.protection.outlook.com [40.93.194.2])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 49nv65t26x-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 08 Oct 2025 18:18:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JL8g7YRq77nfAQf9voWy6Tdk4c/HLf8RRTcT/Nq3wmF3TFxTvQWihv2S/CXLbiyehCOLufUu2YV3kqJ8WxhY1vei5dQ/6Wf0sMqZyP3jGdJ46lWV1tLIe3aawtGqSmHuiqK0AA0rHsoFuB9CVGaACb4ksHgHB5BVwcmsvs5JKVfC/BpaLQ6ykh8PF863c4CcOfZsxwX8xpqpl9Ft1E4eDZfiCPCz4b4GnH0k5tvE/Ueg214qtRPV61indmzEyDNkK2exHcPzzO9ep9nyxe2qa5UbRNoAjyyvgFPa3RdoI+mbdOgMKVGaqf5PV3XGK3T9268yOAoL80hBPsWyk/V23g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NpP+ibGHzAlDJYM9ggWsOHPoNqLWF0LUCvSMnBZ1ODk=;
 b=wSWsYbse5FuW/6V/fih8V2I/p5FdkhAfLhTNkOJRRo11Aw6ioM06kDUTrJpfWPZ2rasKYwCUGjvmfwKZTODetoZJWJk2uRTUTJqw8Uphi/W3z3KfkR8VKIVY5SvsC6QeG49UkFP8EgfgLz56xCu0Gz/yL9Q6ZDC+uOU/zy7TK4SLYFRIlwxOO50ranJdZDKD81T/OI3oz0NUg4pflOSKRu7lnxY3ZwRZ0RrC7kepMfISZkvTqHgzAlhxJUMRNo4+5o6H2Hj63S+YSGSwKbMfYKLau1IIZG9ibMWt3AsScFXPOmj/bCBnQprL7tkLzVBw7T7SjftzWz1cFoz3X6/Jzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NpP+ibGHzAlDJYM9ggWsOHPoNqLWF0LUCvSMnBZ1ODk=;
 b=cfx+cM6HP8E7LR1WylJv9ui4lxozr+Hrl3vb97R094qiI+MV+Ae+f8RyZAJ+hrJGecbyt9xWsCr1JhAmFsFoEfb1BpA5q33EVn9RAuCg2APng7+sT4NTcKlJUJ7KO/mTR3RfhAezDOIX1TbW3ub/KzoOAezGLix5rH25LxoiTWQ=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by BN0PR10MB4936.namprd10.prod.outlook.com (2603:10b6:408:123::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.9; Wed, 8 Oct
 2025 18:18:35 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%4]) with mapi id 15.20.9203.007; Wed, 8 Oct 2025
 18:18:35 +0000
Date: Wed, 8 Oct 2025 14:18:32 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH] test: Account for variations in error messages
Message-ID: <aOaq+M6NZIDj/KvU@oracle.com>
References: <20251007223950.31241-1-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251007223950.31241-1-eugene.loh@oracle.com>
X-ClientProxiedBy: BLAPR05CA0021.namprd05.prod.outlook.com
 (2603:10b6:208:36e::17) To SJ0PR10MB5672.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::21)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|BN0PR10MB4936:EE_
X-MS-Office365-Filtering-Correlation-Id: 7792f487-5e7f-402d-9bc1-08de0697182f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?EHzj6nt+ME9I8W03l6Ph1bpbkyUpGhA+g3VxpNXG3XadMZwgSNlYRPCzVFH9?=
 =?us-ascii?Q?cI1LDTQiZLqfvmj8lXSJfF8jveIxKlmeoSyCTOUGvotlWMXXkqPQKGAoFPjt?=
 =?us-ascii?Q?YLzlPeUKfWjQzj46zS06+yBcFlV61tA3S0mvwx6RF5NiWih7RC4aDFZfNvEI?=
 =?us-ascii?Q?jVZ/dWxQ+2VHCMeu4pLRCUVuiiK+aM75MK6PV5lrfUyvyvDyatycXRmhUTKS?=
 =?us-ascii?Q?JyfIGIT8Q+3drIjy1qeHQq5KMKoNkF4RjYVqHzQ/o73JUZ+vr7q8VItuMXmi?=
 =?us-ascii?Q?gMvDfNtgLgNi8laRFfvmgIK0P/FewwnfcjPHtOcerVxACHn/eLzgEFfxavLM?=
 =?us-ascii?Q?a+Sa1NiSuMknWcPoYKW55mOS/+HSExgB7tZccCxKL0rG9YV7oLRliGqlHy1G?=
 =?us-ascii?Q?t0vg3gP0XtmVIfD3Ulg+JBkZc8rUf0GOF1qhSl8E0+oR0dmVQZ8aDVP7u2KT?=
 =?us-ascii?Q?IAVj1p4eeO1Z4p1rGU6n+Kwzo7B0MFvZ70uGmXg43UbFCbVgdVMUxYCQ32ba?=
 =?us-ascii?Q?08TyQBgHqlR8RSGdWIEf3GiSPKfzVx5kmvb7nxAf54r15mIJKQLmXR3F/bD1?=
 =?us-ascii?Q?PgQeCLtMfDI9x+E1LJf8P1xawML3FxDRgnvdE/4gHKDuX5liokbLLLp1NGhb?=
 =?us-ascii?Q?ImCnc/oC4YtduXGoVmXMMA44BjiUoppPCwILRdxUfv90sxMo72qtR1NjJRSc?=
 =?us-ascii?Q?0H7LgAan2Xz0gLt9LKRkCab1FD0/BZIe3H2cCIMq785RJhqer4HKk0MXJfds?=
 =?us-ascii?Q?LQIHPWxCE9Vlv6lmqA3B9Ivp2w46kVxeKbC6goxyxtiaTB4OBSNKTeT8/unN?=
 =?us-ascii?Q?7BV0hZOvgePx1aqebA7dRRsuSN4hpo0IsoeF/0VAcvnCDuZF+QOrlWYCqVTg?=
 =?us-ascii?Q?X535+G1gwZ7qCyeZWmokg66mW8fX3EOP4h2cruOOn6vI7D8iQYxPgWstQNhf?=
 =?us-ascii?Q?rTuuu5rZ9xy/fGQYwS748UuXj2+b0qmP24PiSDbhRMMI+yVwG0VKKisVp5Qz?=
 =?us-ascii?Q?6foqgX3N31Gs+fWJwvZuifh1bmF5xp16a3HWBiMYQIFa3Oyusgt0fB2c6Bxs?=
 =?us-ascii?Q?DWP9DGpqXTOzGf99h9gSIp8vc/boDulYwb0ijLJyc0SIq52a3Yj3jaTzg+Vb?=
 =?us-ascii?Q?GOGFtjTTPh5e0GnWB7X0VpdLVSL4I+Y8XaejC13NUZ/FEIEGyj9a6CAsg4P1?=
 =?us-ascii?Q?ECUlCN0nYaiIVFlN/ieFXGpjZNrDeXYt6aroSzh6E5JhV6h2xdyYRZ11B6Ju?=
 =?us-ascii?Q?HlpZRR3E7WuSTG/HPgR+k+EJsHrbUJG+lCl5QzwtrUgdq2Nh1AbdSIMLIzk7?=
 =?us-ascii?Q?jQWIAjg0OpntfS+veTJIaalovHiU7tb32DumZ13f3mhQJU+pNBwr3aIfbjev?=
 =?us-ascii?Q?lUxZDMAcQbFc+6x4hEEm8gwfFlIZvwYfHH9lBkZXt0/9KMaei1Yvo54OIhet?=
 =?us-ascii?Q?EftCc4bu97odWBI0mpZ1s/I+ECUmnR7p/6zKuO8f7JAL565bEHsSgA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?LNnRQL4JVxNdttlhO70pOmaZdNHo9HzQWZ0MtojeBZVv+kJUOBR2D8Yvn9K5?=
 =?us-ascii?Q?vIv1XlUL7LA3QEBvo2wPoIzieBGFtgx+E/6xn8PU9OhZ/VBboDczSKUqII9U?=
 =?us-ascii?Q?ylUnpaGlfer5ziM0L4A2RA34/QkO+IqN5RpcjMH8xCxyVITqUu1V5VLUmMtL?=
 =?us-ascii?Q?JxY22Hj3kwELcr91Zm43kVyQvxV/5nou5imvQGOrjm1lDAOhQ/yUMKhoW9JN?=
 =?us-ascii?Q?mwmdoT+/P9SUyqyq0vQEbBlpjyzbFB7gBp0BU/LAqBuCjxArsEdkvfW4Opj2?=
 =?us-ascii?Q?L54Y21aU/SrBnUzr8g0rFu3DVpcZyRaSHHmzisIlelk6jR+CXI8sGAbcYHvI?=
 =?us-ascii?Q?H6/v4uUIDOOdmIvsINfzOHwmncnAeIq/g7kopQ1OAa/Ruc5yflTNDfmmTBc3?=
 =?us-ascii?Q?G36RL7eO6vZKQhVBIi3rhl9U0ULLr42Nb+i3vWU/arQc5uGPrzc8TVUdUXB/?=
 =?us-ascii?Q?InKTqzRWrrJ/zp9j3GjNHR4F/acybvnyIoFrGOmlQSq9rntKsNfEFAN0P6Ww?=
 =?us-ascii?Q?Dmdvz/TV0AEYEdVvO327PnKpeIIil2xE7iNK1ZR+Aq9fjiPEbuHpFgAdQYdb?=
 =?us-ascii?Q?p6Fu4q7IYC3fZoYmQiExZ8qRNFRvh2DP4aS/shspY6Ayvb+/hKUTLk9RSbfk?=
 =?us-ascii?Q?3nw0f0bHGTIAooG8vS/CeELB9W8vGneAtlGzu0IEZIUfHsRtmITabv9jP5i4?=
 =?us-ascii?Q?boapxZ7FFKFIUDj5wTZUcHZDB02wJvILzlR7RsgNnQgad1IZdcbK0MRrge7c?=
 =?us-ascii?Q?AmNvyPdvY6M0TXfVFmaF5nXbiN8ElrTEGrKPG/EEOL2P4cAmNsuAC/bH0DxL?=
 =?us-ascii?Q?6suHRuXIUeayempvOmZpCBABMLXCTmhNZK7YdesgTCQJQsrjH5pnpHuPyCBS?=
 =?us-ascii?Q?GzGwvoeNKHYHz2imCu6BLZ1Qp+mgIWTUfhktBOeVkdiSWDb/31GH1IYNEFXB?=
 =?us-ascii?Q?eDIUwfuAm5IJK2qszQzKEjoYwns3HvUK3wWCJYDfm3zDXyhpzeeINAAaArAS?=
 =?us-ascii?Q?b8wGawW5U2pQPZkBZ76VaMpoFgdOsmoMymE8WcirCoKCSmNjx95dEFNjBICQ?=
 =?us-ascii?Q?7Ixxddld87OEPbDefogssD/2X5iKyAoB3WcrWmnlwmlRLC/bGpCqhlQKPzeg?=
 =?us-ascii?Q?fT4X5WRi7NgzFwrhsmTtbxkD3mIRPUrBej6ytZRC7zxoBFXFE+HSEi7JGQjM?=
 =?us-ascii?Q?2aC74KqoxKWwHnYs5FKUCjrcGCIvmforZxlSqgEgaW8Qzb+WjDxRmhdlg2m3?=
 =?us-ascii?Q?ovqVlu0rVX7i/P/p6dxXA3YHfaeWAiodGjt9uYvfbf10lO07QMet7zWu03+M?=
 =?us-ascii?Q?lZt608oYmLSlMlzs51l1MFPLMNWQlYnvcSPhK6B4PF9HGZXKOKms2kajJSB8?=
 =?us-ascii?Q?X5CLb6Tzu6GZUFmt87nAaL1weMmUA0YcO/LlrrsbnSqhLPl0C/09o7qiViF3?=
 =?us-ascii?Q?EnjY3m2UR5RG7hBQR537xC7/+UEQtbXqox/1GHyxOJ2MhhS13grrLSl6nJX9?=
 =?us-ascii?Q?qIiSoTWMl+POD3tfD7SWASRh1LqbEphnEbERdQ2TRjXxHf17wu0jyr8FDNtG?=
 =?us-ascii?Q?/seegF2oqs7XeQgWGpaSfwvkxL8PA+qaNoWzFBMk1j0YxSRQ6ZCkm35rY+lE?=
 =?us-ascii?Q?tg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	3oZ8Qo989mvjS6GNSwQcLlQ7MpSoYIgVkma2vMqdpMMGeHHe0VtPLcJbYKF5arSpyLppNql2qDn8HyQr1mFZoSINUsGsmnX9K3Pfl/f4+3D1dmtYaq+6Nydy2fiLpfVbnurnytXCtn/rpOSpGQrvmD2q6MwtyvHQNopEv7PpsYZQSOVIH8NFdE4QAZulzrjYqQ8qKSTLUWxoqUEB54WUhnIJuM7PrFdOF4y1YpCiKVyGydcV+nsQLpN3yVpJMmwNMeYw+AjN0Xy3/y5cBqA+wLHvp4fnUoP7aRbvQmyU3F6/vCubFK1z8uV5ZaWOu8qR0qmHIiiZcFXB/6MzZD81c2x7scWAu7ZXWPlQgBXq9qGns2OqftCKUD+qVzeADD0lEoBKZov2oe+YYSqB2nudPlQJtQqFdAmhEfF9/qG9Z9vTZultqZFloVUi0mfC6a+UjChGfGf1MtY2Ngo+pRycraTss3X7PyRSV/NbCrebzEfE7w2cThLJO0fdyYZlY2Nur2BWeb7YKSEZuq8I/W2AYCPvZv0SsFM+wM7HVi+YFw9oclhJjhqAEHd3n7PLmq3lgjnuiZbDooMNSIq4Z6B7q+QS8GLJrYcmfjOPSvrEpOQ=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7792f487-5e7f-402d-9bc1-08de0697182f
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2025 18:18:35.0973
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IUnX2lwbuPzZjMm/BdET8IIEnzzBNouSL38CQzm8MuYPfLxOfXn+k/gGrdEC/YZ5AzGg5yNPEGJOkjdWOimJVrervpzff7Qsniwvig4i3z0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB4936
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-08_05,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 suspectscore=0
 spamscore=0 adultscore=0 phishscore=0 mlxscore=0 malwarescore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2510020000 definitions=main-2510080129
X-Proofpoint-GUID: VwHLZTWXtcF-cfsLXix4QZv6ovAArEfa
X-Authority-Analysis: v=2.4 cv=Nb7rFmD4 c=1 sm=1 tr=0 ts=68e6ab07 cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=GoEa3M9JfhUA:10 a=sWKEhP36mHoA:10 a=yPCof4ZbAAAA:8
 a=7iGXkBWN8PRJ95dekP8A:9 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: VwHLZTWXtcF-cfsLXix4QZv6ovAArEfa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfX28TPW3tDa0kE
 569tACwxZ6pxdMIvZSbJWa2s89YqjS7GywdjxDa34KQfdsLpksIaYzTikwsZYJ/cK4U7vnnO8w6
 YeMcntz+phcj/tcFPefZZ2kz4B4mkm9w+HPCI8r109huLtFFkq8zsfX6DNgXirExbevUflihkNF
 fGLiGVL85Rl9r1QovdDkhvqhFSuuIRXYA89o5gIWV9w4I5Pmfj2yDcBakZTRQBYhBGrdC1ml/S4
 27eNvI8iJ/an2Hf65r5bKFF8HvWmay99RfSbFn5pllgV5oMtku79+Nj2j6/d+EzDzjr92Agqiik
 f2Nwlrsj6MHK0lzwkQm+fPJNqsRmM5NZ7db0YO5hZq2v62JsGRPesCCkpPWXlf+eVON7EY4/HEX
 Xfe20P1efTcnpU4PaZjTcA1uY39trQ==

On Tue, Oct 07, 2025 at 06:39:50PM -0400, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> Clearly,
>     test/unittest/enum/err.*RepeatIdentifiers.d
>     test/unittest/types/err.*dupenum.d
> are impacted, but so are
>     test/unittest/offsetof/err.D_UNKNOWN.OffsetofNULL.d
>     test/unittest/types/err.D_UNKNOWN.dupstruct.d
>     test/unittest/union/err.D_DECL_INCOMPLETE.circular.d
>     test/unittest/union/err.D_DECL_INCOMPLETE.order.d
>     test/unittest/union/err.D_DECL_INCOMPLETE.simple.d
> due to symlinks to libctf.r.p.  And dupstruct needed a fix.
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>

Sad that we need to do this, but...

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

> ---
>  .../enum/err.D_DECL_IDRED.RepeatIdentifiers.r |  2 --
>  ...tIdentifiers.d => err.RepeatIdentifiers.d} |  7 +++----
>  test/unittest/enum/err.RepeatIdentifiers.r    |  2 ++
>  ...ntifiers.r.p => err.RepeatIdentifiers.r.p} |  0
>  .../unittest/types/err.D_DECL_IDRED.dupenum.r |  2 --
>  ...r.D_DECL_IDRED.dupenum.d => err.dupenum.d} |  4 +++-
>  test/unittest/types/err.dupenum.r             |  2 ++
>  ...DECL_IDRED.dupenum.r.p => err.dupenum.r.p} |  0
>  test/utils/libctf.r.p                         | 19 +++++++++++++++++++
>  9 files changed, 29 insertions(+), 9 deletions(-)
>  delete mode 100644 test/unittest/enum/err.D_DECL_IDRED.RepeatIdentifiers.r
>  rename test/unittest/enum/{err.D_DECL_IDRED.RepeatIdentifiers.d => err.RepeatIdentifiers.d} (78%)
>  create mode 100644 test/unittest/enum/err.RepeatIdentifiers.r
>  rename test/unittest/enum/{err.D_DECL_IDRED.RepeatIdentifiers.r.p => err.RepeatIdentifiers.r.p} (100%)
>  delete mode 100644 test/unittest/types/err.D_DECL_IDRED.dupenum.r
>  rename test/unittest/types/{err.D_DECL_IDRED.dupenum.d => err.dupenum.d} (74%)
>  create mode 100644 test/unittest/types/err.dupenum.r
>  rename test/unittest/types/{err.D_DECL_IDRED.dupenum.r.p => err.dupenum.r.p} (100%)
> 
> diff --git a/test/unittest/enum/err.D_DECL_IDRED.RepeatIdentifiers.r b/test/unittest/enum/err.D_DECL_IDRED.RepeatIdentifiers.r
> deleted file mode 100644
> index 424d6b077..000000000
> --- a/test/unittest/enum/err.D_DECL_IDRED.RepeatIdentifiers.r
> +++ /dev/null
> @@ -1,2 +0,0 @@
> --- @@stderr --
> -dtrace: failed to compile script test/unittest/enum/err.D_DECL_IDRED.RepeatIdentifiers.d: [D_DECL_IDRED] line 24: identifier redeclared: GREEN
> diff --git a/test/unittest/enum/err.D_DECL_IDRED.RepeatIdentifiers.d b/test/unittest/enum/err.RepeatIdentifiers.d
> similarity index 78%
> rename from test/unittest/enum/err.D_DECL_IDRED.RepeatIdentifiers.d
> rename to test/unittest/enum/err.RepeatIdentifiers.d
> index 43837c78a..0dfd7b86c 100644
> --- a/test/unittest/enum/err.D_DECL_IDRED.RepeatIdentifiers.d
> +++ b/test/unittest/enum/err.RepeatIdentifiers.d
> @@ -1,6 +1,6 @@
>  /*
>   * Oracle Linux DTrace.
> - * Copyright (c) 2006, Oracle and/or its affiliates. All rights reserved.
> + * Copyright (c) 2006, 2025, Oracle and/or its affiliates. All rights reserved.
>   * Licensed under the Universal Permissive License v 1.0 as shown at
>   * http://oss.oracle.com/licenses/upl.
>   */
> @@ -11,11 +11,10 @@
>   * error.
>   *
>   * SECTION: Type and Constant Definitions/Enumerations
> - *
> - * NOTES:
> - *
>   */
>  
> +/* @@runtest-opts: -xerrtags */
> +
>  #pragma D option quiet
>  
>  enum colors {
> diff --git a/test/unittest/enum/err.RepeatIdentifiers.r b/test/unittest/enum/err.RepeatIdentifiers.r
> new file mode 100644
> index 000000000..860ffb5c7
> --- /dev/null
> +++ b/test/unittest/enum/err.RepeatIdentifiers.r
> @@ -0,0 +1,2 @@
> +-- @@stderr --
> +dtrace: failed to compile script test/unittest/enum/err.RepeatIdentifiers.d: expected error
> diff --git a/test/unittest/enum/err.D_DECL_IDRED.RepeatIdentifiers.r.p b/test/unittest/enum/err.RepeatIdentifiers.r.p
> similarity index 100%
> rename from test/unittest/enum/err.D_DECL_IDRED.RepeatIdentifiers.r.p
> rename to test/unittest/enum/err.RepeatIdentifiers.r.p
> diff --git a/test/unittest/types/err.D_DECL_IDRED.dupenum.r b/test/unittest/types/err.D_DECL_IDRED.dupenum.r
> deleted file mode 100644
> index 0b6369e52..000000000
> --- a/test/unittest/types/err.D_DECL_IDRED.dupenum.r
> +++ /dev/null
> @@ -1,2 +0,0 @@
> --- @@stderr --
> -dtrace: failed to compile script test/unittest/types/err.D_DECL_IDRED.dupenum.d: [D_DECL_IDRED] line 18: identifier redeclared: x
> diff --git a/test/unittest/types/err.D_DECL_IDRED.dupenum.d b/test/unittest/types/err.dupenum.d
> similarity index 74%
> rename from test/unittest/types/err.D_DECL_IDRED.dupenum.d
> rename to test/unittest/types/err.dupenum.d
> index dfc74f250..22001e5d6 100644
> --- a/test/unittest/types/err.D_DECL_IDRED.dupenum.d
> +++ b/test/unittest/types/err.dupenum.d
> @@ -1,6 +1,6 @@
>  /*
>   * Oracle Linux DTrace.
> - * Copyright (c) 2006, Oracle and/or its affiliates. All rights reserved.
> + * Copyright (c) 2006, 2025, Oracle and/or its affiliates. All rights reserved.
>   * Licensed under the Universal Permissive License v 1.0 as shown at
>   * http://oss.oracle.com/licenses/upl.
>   */
> @@ -12,6 +12,8 @@
>   * SECTION: Type and Constant Definitions/Enumerations
>   */
>  
> +/* @@runtest-opts: -xerrtags */
> +
>  enum foo {
>  	x = 3,
>  	x = 4
> diff --git a/test/unittest/types/err.dupenum.r b/test/unittest/types/err.dupenum.r
> new file mode 100644
> index 000000000..153985568
> --- /dev/null
> +++ b/test/unittest/types/err.dupenum.r
> @@ -0,0 +1,2 @@
> +-- @@stderr --
> +dtrace: failed to compile script test/unittest/types/err.dupenum.d: expected error
> diff --git a/test/unittest/types/err.D_DECL_IDRED.dupenum.r.p b/test/unittest/types/err.dupenum.r.p
> similarity index 100%
> rename from test/unittest/types/err.D_DECL_IDRED.dupenum.r.p
> rename to test/unittest/types/err.dupenum.r.p
> diff --git a/test/utils/libctf.r.p b/test/utils/libctf.r.p
> index a2b4602cf..c81e1b709 100755
> --- a/test/utils/libctf.r.p
> +++ b/test/utils/libctf.r.p
> @@ -1,7 +1,26 @@
>  #!/usr/bin/gawk -f
>  # Licensed under the Universal Permissive License v 1.0 as shown at
>  # http://oss.oracle.com/licenses/upl.
> +
> +# Possible "enumerator" label.
> +/Duplicate member, enumerator, or variable name/ {
> +    sub(/member, enumerator, or variable/, "member or variable");
> +}
> +
> +# Possible trailing '.'.
>  /Duplicate member or variable name\.$/ { sub(/\.$/, ""); }
>  /Member name not found\.$/ { sub(/\.$/, ""); }
> +
> +# Could be union or struct.
>  /enum union pirate:/ { sub(/enum union pirate/, "enum struct pirate"); }
> +
> +# Older or newer libctf diags.
> +/\[D_DECL_IDRED\] line [1-9][0-9]*: identifier redeclared: [a-zA-Z]*$/ {
> +    sub(/\[D_DECL_IDRED\] line [1-9][0-9]*: .*$/, "expected error");
> +}
> +/\[D_UNKNOWN\] line [1-9][0-9]*: failed to define enumerator '[a-zA-Z]*': Duplicate member or variable name$/ {
> +    sub(/\[D_UNKNOWN\] line [1-9][0-9]*: .*$/, "expected error");
> +}
> +
> +# Print.
>  { print; }
> -- 
> 2.47.3
> 
