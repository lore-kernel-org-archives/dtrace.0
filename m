Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52FFA2F2737
	for <dtrace@lists.linux.dev>; Thu,  3 Jul 2025 19:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751569414; cv=fail; b=T92dnpArH0qhydOWQdla4r7ADikcxf9Wxt/ijCf+s/gziWQpLAvskeKvAi/KVl44Genwb8D7qkwxihKK/Pf3cl5Aja80Z0zvGU4ONzQ7pwBvcojqKdjvCMCdUEMDdKfG14+bLlRtnppFB4jh74IdWZNctgPHj1DdC+cnShUd6BY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751569414; c=relaxed/simple;
	bh=xJCsj3tpcSCqqjv4lSdo/Xi9q/H5wdk5GZr9Ka3bgQU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=TQq6l/R7r3trSJ/6NSL/3o/ICDZ4L2P/tNhyH1puYosUDkyOhrxCya0oSY+LxqLQ3wh/Sd8OqQXifng24AhGyVTmswlSZ+z7CxDACHblPWvDO9UZmvGI8GVmkn8w6KWRJ+ISqtI+7mN1R/QTpwgnqHBZ5YOFEBl/fTvK7WihQZo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=q+UHTeXH; dkim=fail (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=My7+9/di reason="signature verification failed"; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="q+UHTeXH";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="My7+9/di"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 563HZ3Pd009467
	for <dtrace@lists.linux.dev>; Thu, 3 Jul 2025 19:03:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=xeMuW3MZIz1FcGVKVR1yCx2hkqHs6XWxhspkBNKqglY=; b=
	q+UHTeXHwOOQCeTTkGLeZpbH8sreLluyz3waa+IlJX7DKm6XOuu+LtDsM/COzKuA
	nO88NQ716mtUGhMyNEbqeJ5Z3uN8NHan4lQ2TVjSM9oaeetYwyMQfQgXxvQFa5nY
	OX3ALaQOd0emCw6NOEn+WgjKVsy4oUy4FqCTSyiwOO9Xj/JIBNw9OlIS7mQ8tkqq
	Ci6MHaiZ+m77TePkSJjQ68fx0S48cgbUpiONdws+WaCmgVwduPMCTC2QKbZafvT+
	hs4AK7tLPDxmrrzyeyhkdNOFhujoQaftWdS6XVCPXLp+Ss2U9oTKMlbTL5VUIjLc
	A2ByNhq8+KjDNJo5hQj5zg==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47j80w9ju9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 03 Jul 2025 19:03:29 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 563IweG9025010
	for <dtrace@lists.linux.dev>; Thu, 3 Jul 2025 19:03:29 GMT
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010065.outbound.protection.outlook.com [52.101.61.65])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 47j6ud2x1k-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 03 Jul 2025 19:03:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kWQnBGN4SybWkYTm/gaxvlozEqVsf95Uxwz7wvu910IEvEdUoi0Y2RBiD6L9ghiOl6YDfjEIy8szp/CUdRKjogd7RyzAseIympMyuzfXoVvH/MRLAjJYBlRxOFIWMPd6FatMiiL7iDuTiEcXWbt+G/O89UIfNKmEQv6XRUfqo6E1/WjbyjBiuKFTF+CB8iQzo/Lq5lDtNFf1hNe5pp5c8LhhwRYKjUncp2/O8UFb75BMZWIv/kVZg2xWzUihs708y55A/joryCWMA8jFic/nQFcVeofKaNWjPmSV7/O3pN5w2EuuxK6kDb6qgY8HJZZFuNulx0Hhs1tzUVRrZza+Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DETYxJeYHDDBdZaw7js9Zt9bgjMwm0gwJJD7a4gEUY8=;
 b=qWvCfOyk50sgHCNGvjgfE0TxlXzJ/fr2YZrb1imA+co3LKYo9JQ74S+u0OHYfj3MupAxRpfoBPAabp2K3NJBVq7NdeAmHzWze8z1g3ourUJyEPk0QKj1spuIxG+S6BNxXZ6Brcp5JyVfod0kZJkQwsKUesc1yXeAADD2R4ylgezSelUc/HcL31aaWsAfqzXC0TX/jfjRUFSz1NoKDXxqIgsGB1HCIIUey2g2lVJ8bAvviFPz2yl4wx9tQOLdF0kOqnt2yrGQEMdJxGjMGNcx8l3vMa8E3f8fjNi5P3X9etNQhm1Bs7peXpO5aKP+gWcF9zQ2DxS6d9xXXO5GEVPW9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DETYxJeYHDDBdZaw7js9Zt9bgjMwm0gwJJD7a4gEUY8=;
 b=My7+9/diV0AJ8qzYhYxxatQ8othpKdNYmk2udWKaStTT/SpVfsCdSZmPwjhUkBnOs2xZgsLiCePlBbkm0OqtfPTDF5FbkfMpDr01lpCPsl42eAhzfu+xH51FnIN2exr4WAM3pC/UF/GLuJAPA7ZccASIP844ZwnK/T9bSFBIGxs=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by MW6PR10MB7637.namprd10.prod.outlook.com (2603:10b6:303:246::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Thu, 3 Jul
 2025 19:03:25 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%6]) with mapi id 15.20.8857.026; Thu, 3 Jul 2025
 19:03:25 +0000
Date: Thu, 3 Jul 2025 15:03:22 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Alan Maguire <alan.maguire@oracle.com>
Cc: Kris Van Hees <kris.van.hees@oracle.com>,
        Eugene Loh <eugene.loh@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
Subject: Re: [DTrace-devel] [PATCH] test/utils: add more reliable "get remote
 address" approach
Message-ID: <aGbT+p0DjRTFl7Oc@oracle.com>
References: <20250703113345.1273604-1-alan.maguire@oracle.com>
 <e660b225-4a3c-209f-fae4-8831f6c3229c@oracle.com>
 <08bae006-f438-4134-a811-609b3fda69d1@oracle.com>
 <afbb9858-e5a7-6d76-a6c2-23b46d8660df@oracle.com>
 <58cb8219-337e-42ed-ae17-1c4e77894a9c@oracle.com>
 <aGbLTOzqILN+3J93@oracle.com>
 <a2f593f6-38d6-4a8d-8d42-4bdb6b9ac14f@oracle.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a2f593f6-38d6-4a8d-8d42-4bdb6b9ac14f@oracle.com>
X-ClientProxiedBy: BLAPR05CA0008.namprd05.prod.outlook.com
 (2603:10b6:208:36e::11) To SJ0PR10MB5672.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::21)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|MW6PR10MB7637:EE_
X-MS-Office365-Filtering-Correlation-Id: 80248c10-4289-44ba-6612-08ddba6449c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?ff1aA7iuadzaxpT3JVTm4OU47NfM5tVFMuAL6CQVAndDFei0rKOVkRXK0E?=
 =?iso-8859-1?Q?i+yrT2yD35Ltej807DXm8Gk53lIOGBsRzjk67YgUtBDtoe8yzzIwx2em0i?=
 =?iso-8859-1?Q?+cQ5cUlRoD+ory/iMiw92KfVdxGAEs3XlJW4E0VRWHK1DwMTe8xAEQAiXA?=
 =?iso-8859-1?Q?OFjkwzetTyWZ9BUXjdXEVCbUgd3PjsnaAuO8MJr1OZAoyPxY913tOtrlFc?=
 =?iso-8859-1?Q?QH4HGLG+oA2HDaoHyzZPlOokgO7t1kDtICb9SZz/Yl7p8c+sNEEpQiDgl5?=
 =?iso-8859-1?Q?ggN7q6IyykTjYl8EC283mR6rKMmWRbVdq6A/RmxqQZ/j+OjjSHKOfglZ4f?=
 =?iso-8859-1?Q?FwbHCEpjG5Wbxhxy/ch/lfS2TsojIFQvOmyM42qbDa2A99ezpZyJJlUgIt?=
 =?iso-8859-1?Q?Nh2YomQnoASEUyW5lazkmnE2TzSrPsXvmMTCB1TzFSrV0P5+/HFCbNRMSK?=
 =?iso-8859-1?Q?cr9DfguMuyeIzm65DEzkZYigiOoydn6SCpvENHnLLuXo9JIsVBvALrAvV8?=
 =?iso-8859-1?Q?75BTt0jS8OKEb5brmYjDfxFxR+qqA9H4fFmmjQSgi0II91v3cZgxoOUZsL?=
 =?iso-8859-1?Q?k5k6uNrvT/Zy3DQsnymT5b9Ba0yUnA4ndne4zUPo9j3Sqx2g7d8jU4Gu7j?=
 =?iso-8859-1?Q?CYXdaztbn+OjCEt6k0+Z0ySDnhcfCMaLvd7CXU8Ti0O6C9KIKHTcXs4WsL?=
 =?iso-8859-1?Q?RQgCSk5obPhWO+LJLd39iRoAQiekiRX+W49JCyBL2S7j627G2J8QP4dAPP?=
 =?iso-8859-1?Q?RIkeP9Ok9K+s6KyCBuOnS+5/Cl/aMdlGmrKF6CDIM9K9IOSg8EaNpwgLM+?=
 =?iso-8859-1?Q?nr3U8th1BFAW0agxOrMsc6BEeigba6PmK+Y5tkcJxsx/2SK8XMx9q17fun?=
 =?iso-8859-1?Q?L6RXpGbNxAIYu3PMjhsgibU60B/uAHCywfwT59pUULPrBSUtqMXpnt8e7s?=
 =?iso-8859-1?Q?/OzZ9Y2Hf6XfZttzzu83YnzxoJKczGHtsNIEinmsyQfbDkEoMPdw6dSq2l?=
 =?iso-8859-1?Q?aPjVynAESWaUur5B3b6XtqhMTHhg5V7YoszXA6IO0fb2YDu0XSFUamkkFP?=
 =?iso-8859-1?Q?ZbcVFiNLmwdWQ6s8M4rNuLIBiFlzVZ0PN4aAAyVBmxgWXuKVFpAmisJoJ7?=
 =?iso-8859-1?Q?Lef/bf5ihyEHmh1uxVMYt4iW3cotJGHuuu9KMu1II2Osl6Ai8E8fnjL5wy?=
 =?iso-8859-1?Q?7R4/raSp/9VPBN33WydxApALK6jKx/TWa6X9Xk4/CDbOeJo1qlruv1VHNI?=
 =?iso-8859-1?Q?tbfh9JCUcPacjiZx1e3QqML8pSXLGIG8gOikZ6WtaZjeM+BUGElFRDzGV6?=
 =?iso-8859-1?Q?LVaLYMm51lrtVKxo65y1R6gWZGMroFL5WNjXZ5qxnogPshbhjmZ7lUqbKz?=
 =?iso-8859-1?Q?Uem4ZuXAjr/pRq8gS0DRu4wOEm7VkIBaiJTkENLUG+qOdT2j45RCPfammM?=
 =?iso-8859-1?Q?wpBaRubw9T3TyKLN/XYnXnTm1pfnvGbNLFeyLSLCfo7OtZDAFKh4cPhHNU?=
 =?iso-8859-1?Q?4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?Il8LN7I20HrMKk/6Yuxo2Q4MG1Cn2AmBxP6TN85/7NI69yLDr/7foa46o4?=
 =?iso-8859-1?Q?Hks/Zz1fhkPd1ZpejIlCkhrEAkDzD7qe2AdsXSeDkHx4Y/dJy3GWYPa8no?=
 =?iso-8859-1?Q?ul0JYSBwTRj2H/Dt+q4cnmwias0Sq4y1hhiu8KfAueTf7FUTV9uhvHnoFN?=
 =?iso-8859-1?Q?n9uW/xXFL21YHf+k2ODb/7l8oNiSkwVnb2p2AQ9YoS4ubkQUnKgqNFPor3?=
 =?iso-8859-1?Q?LvYEDoFDY6tam/rc1XVdJLofwVWuewaVLNoMdaG9KEwYquHCpI6z+ELLCP?=
 =?iso-8859-1?Q?PixH/UIDyLGBjQT/1P3uW95FOrIbaB+cynDicxYX14Axw06Y+LZ/nkGN5h?=
 =?iso-8859-1?Q?350BJNDIqmgHGZ2b8bpq9LdTq0ogPOpRsXiup2mJCJbk3GroBG2DG249j2?=
 =?iso-8859-1?Q?YlCqNPb1rVvjwA5HpOzSPssw9Oamd/iG7TR/WQEFZ8jnV5bhUTCBZn38LA?=
 =?iso-8859-1?Q?YPdijzDllTU61je4+d5WBpuIY2jtYgGV/Cxo7ui9+22o7egNCi/qCYI9ld?=
 =?iso-8859-1?Q?Qad9JFpEBkvR0RvtPVGhVgz0rkRagejBsyfFTSMKavUPI9WgfYI9gET9Aj?=
 =?iso-8859-1?Q?rF9Hj1qOcnNOb/g3ZB6beL/vkyW2sQpQMa0CHoYRVEB93YFAtV7WyaixVf?=
 =?iso-8859-1?Q?KF+UXoFCEh1W9YqsPF8GSA7bCN3u0BO4avS9Fzff77mlzbO0o6q2NajT9b?=
 =?iso-8859-1?Q?WkQ6+zedeI/X6YoAi4CMuL4dqYmp0o5Zsac/dA1foQJnobhO4u3grNQAee?=
 =?iso-8859-1?Q?7ocjwq598YpBMt4qhsvH0DSUJ1a5yb+Eobj0r6cWAuZzrcBtPUxvTbdAB4?=
 =?iso-8859-1?Q?RgkCjEL5lu4oDDdK+1RutCef9muxP57hwmcrpsMJsveUe3DHXnz1a8J7GV?=
 =?iso-8859-1?Q?cD+vUQStGBKgDyr4n2Npu7wuj0dz51WBX1KFMXPApd30pqUxHgwu/Gf0Fq?=
 =?iso-8859-1?Q?htCx4hl1OaunC7AaJmLdck2LxTbPIJAijoQLBJkDjwSva5eLV/gCx/4jb1?=
 =?iso-8859-1?Q?nJS5chP4hn4qkFav9av06CSuwB8V3BmWSr9PfVbKzp+YM7CX9mV9j766Cs?=
 =?iso-8859-1?Q?j8VF0rRrzFMwXd6YjoPYVeE/yQCnBRo7TJbr9Xsh1YcF4QPNqRpUokQQpC?=
 =?iso-8859-1?Q?BzSbVHpC9ws8FejMd+lKNRr4ARfpha9WsYeIkq41znZAKHI8MfgMRx2pQx?=
 =?iso-8859-1?Q?qrs4ILHn2czl3hg59pwTya851PPrzL0kBBcEHa1r5L9JPan8m9EIiiBlDo?=
 =?iso-8859-1?Q?SfRndas+RWxtKInVfnrrm9PFsvW8Y2YRNsag+8qpj3DhHwn6gKqDe6eVgj?=
 =?iso-8859-1?Q?qoSx5tWVPy9VY93SYp0BXgtn9Q6pombuIwOOPHiSCj+90MBRoRfpbVRkkP?=
 =?iso-8859-1?Q?JhTJCtwY+C5MyhtmuNF+lY4dszcpCIp7NbXwoGeU9AD112FRni4ShwBX2z?=
 =?iso-8859-1?Q?KQhpbvKV9D3ifDTLDrwRxU8izMnlPj5NxecUmqwH3xG9NFMfTtZvE153nL?=
 =?iso-8859-1?Q?GVGXnYnkmpYjnR3On6S7p5sM2F3jcB/nW4YP/W5OTjRU8idcY0fbFEApGi?=
 =?iso-8859-1?Q?JuQ8mPo/ZnDH7DUoEej/VvAKGOXUU5EmQd8KEPeMfWI7mJZmXpxha88nJZ?=
 =?iso-8859-1?Q?wNpJ1+X186PBELO8YJkzlLL6oQo7Sls85XII1KIrgj03VYy6+G6F8O8Q?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	1ZD4HI4fPBO2O0Ig2GKys7/+6Gf/LxOmAOuX+92025fc9TmSIqWvtUtZ4vOAvhn9oqAeuJ8qfIbzN2FoMOz6/XQWpBJn+tSy3rcPZfct1iDFCk0STg9fdbDoKE2jFmYcn3jywLB8rbNDVXEOltPcEVIgftFk05nviX+5J85iISfmAXkkzwZQhbg0Ck1MZUxI0I781Xw1XYE100J6S+bZfWBZ0Y1/FH6HBcqynIWHPMlDXwMRyWIj1wC7RvME83/+fqWUMR71gowe4+mJHuvuocSDsz0luaw73kX2/5jD09p7K/7VN8bn6nbVd3NlBGQZSIvNqzyskRMvl36PyZIXnD1GjRuIDc7eULnljdUnAEigOIO4YS/6WIuUtOoiFx0IjriHHuHT5CkmyUE+XrAh0NzCuEQj+dPvLvqc3YpoX1JSLGf00rnuJIFGscfzS85crKDdtLzX0f2GtY3gzkDOlY12dZU+EPMZQ5sJ4MsQsK5YfXVRtz+tjkmvXICa/u6xIAKO8uG0MfF4hQCwaSEJlgvmFdhxz3/xSE3EkOLnDpWak0N0ZspeVPDTqELQ8YKYryG7x94bYwaGKht65vIg/PoKWpkk/e3nLvCO94Nv4bM=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80248c10-4289-44ba-6612-08ddba6449c3
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 19:03:25.5450
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SFEOPADLNSjMEP0zKsVkeEYQhpR2jpGm3zbxBpAmuderETDIRHfHcBM5DU+RMtuMyMgtaSUiP3YZwZ0XRxOkElhqn97+6t1uYXXqc+hpJsE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR10MB7637
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-03_04,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 spamscore=0 suspectscore=0
 phishscore=0 mlxlogscore=999 mlxscore=0 adultscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2507030158
X-Proofpoint-GUID: 7hCUFTfc1rZMFngBz1kwPv6Acx1e6jKe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAzMDE1OCBTYWx0ZWRfX7v8eYoJ3VA2j HSR6VMZBHSujdngT4GQslS21wTUfLqFItmj/75igsy4Z7LhgJ3jBgp5VgfTyEXTxPFxjsbnUGjW USeql2DNZnfdP8USF5Ig2SoS3OcIvd2XykN+eXE/3Mn0ee8tvyaRpxXK4+0KNI5XQeOZVjBsU7D
 fGz0VpCyf2k6mBZT5nEsnjX70DA4NKmU1/+OH8qI9FW7X3OHY3NaxbZxJqyoLNJdMul/bqLlr5r jmpUfeKx+aDU+fMLWkNZ4ofZ0vAmai4EJ91daJkQdkMAzIRqoJbtYbR4Qq7nFZiINOEUhqP2P77 CBbk2J2VN/jSUDeNd+1uXx7hxFy8imq0s63TUzpPHVGxhDYNDFPmceH/iwJnGsNTwA3fUQLXa0P
 7cJYPmGHlX0VjdAK2ZCbq+pIoaHA6JSHkWS18dACEnNAdXFsfKvKwboGW2OCZRtLX8LF1n13
X-Authority-Analysis: v=2.4 cv=D6hHKuRj c=1 sm=1 tr=0 ts=6866d401 b=1 cx=c_pps a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10 a=RdrAjqrQl7B-cDKtBfsA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 cc=ntf awl=host:13565
X-Proofpoint-ORIG-GUID: 7hCUFTfc1rZMFngBz1kwPv6Acx1e6jKe

On Thu, Jul 03, 2025 at 07:41:41PM +0100, Alan Maguire wrote:
> On 03/07/2025 19:26, Kris Van Hees wrote:
> > On Thu, Jul 03, 2025 at 07:02:57PM +0100, Alan Maguire wrote:
> >> On 03/07/2025 18:06, Eugene Loh wrote:
> >>> On 7/3/25 12:59, Alan Maguire wrote:
> >>>
> >>>> On 03/07/2025 17:43, Eugene Loh wrote:
> >>>>
> >>>>> I tested and it looks good (modulo the OL8 UEK6 issue mentioned in the
> >>>>> patch 3/4 feedback).
> >>>>>
> >>>> Sorry I couldn't find that issue; is this the 5.15 problem with the ip
> >>>> send probes?
> >>>
> >>>     dtrace: failed to compile script /dev/stdin:
> >>>     ".../build/dlibs/5.2/tcp.d", line 177: failed to resolve type of
> >>> inet_ntoa arg#1 (ipaddr_t *):
> >>>     Unknown type name
> >>>
> >>
> >> Ah, sorry yep I have a fix for that one in the next round. Basically we
> >> need to add it to the core set of typedefs and add a type for a pointer
> >> to ipaddr_t; we can't rely on the #pragma to include net.d unfortunately.
> > 
> > Why can't we rely on the pragma?  That is how e.g. the ip provider manages
> > this I believe?
> > 
> 
> Unfortunately the #pragma include doesn't do enough; it just defines a
> type for ipaddr_t , not a type for a _pointer_ to an ipaddr_t , which is
> what we need as a parameter to inet_ntoa(). I tried adding the ipaddr_t
> typedef to net.d and doing the pointer lookup/addition but that doesn't
> work either. Seems we need the core typedef + pointer addition or we hit
> this failure.

Actually, if you move 'typedef __be32          ipaddr_t;' from ip.d to net.d,
you should be set.  That is what I did in my priliminary tcp provider impl.
I do believe that works.  Either way, we use inet_ntoa() in the ip.d
translators and that works with that typedef in the file, so this really ought
to work.

> > I'd really rather not add a type like this to the core set of typedefs we
> > can avoid it, because it really isn't a core type.
> >
> 
> I can't see another way round this currently unfortunately.
> 
> Alan
