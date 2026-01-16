Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D33B34C140
	for <dtrace@lists.linux.dev>; Fri, 16 Jan 2026 19:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768591310; cv=fail; b=AW34iYILnN6VS/FbuebF1FgZPJ+e2hjEPiUI58rmZTPlIz4Fd1nOlMGvlmxb/b1h5HZOu1JmBn3YzkF/+k+ZL/lYkRwFuD/oOD4fSlXPGY0gswxN+asrGONeGTTHCmc00+U7PbQSPUm/f6kmUYkOIZ98+FeM9rXm3K26TzXuoj4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768591310; c=relaxed/simple;
	bh=fI7cF9uhPx+D9eKwCJ5+EGIfWGE4csPBnmn7l+/xe1Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=e3HwPeXsUxMu4aR92otUZFqg+GHnMNEAbCCuBshV2th+oDLUtvIcoVNeE7N4zIDblwCjpH0vjoMzEWcy9nYs1Uxt2RB5+n5LMQvTAwqtqlaGDpppbglkzQRLKJNYpQJYHDK1vV1FoISLr1TOnvApyHhEhB6LgFRAHz2WCg0AzEU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=V0KYJsCJ; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=lG5KuL86; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="V0KYJsCJ";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="lG5KuL86"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60GDQv7O1431237
	for <dtrace@lists.linux.dev>; Fri, 16 Jan 2026 19:21:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=Ag9RiIW73N9+Ppu/sJ
	cOQtPsgW6eBx0hQXwY5VcoDVY=; b=V0KYJsCJ73jwgw+Jb0U1iJ1CL5JUO4y3+X
	o5LKVf3ajZErb8N03jvE5tIb3K9sD9MHRtq7uRwjTqT9hZ8/oqCy0jaM3Tw6SSR+
	yfvCKpGkrtB8tif1ClkiE1TjDDOV1tMbkyxwaAjfla5VNvM7rYSn4FRdyWQcN07g
	ZwDK6ZHR2RvuRE3iw5kKZRBSdENAHz2kgbo+CVo0CRi6Mjd8j181slncSNO1fKEl
	uB6ljQbTY/AQp+cmwwepA2yC7jHb8xX889wOXuwnsvKx+7hRsb1szn/BUgKhO7kh
	QOele/DvGLDKBngbYjEZSL2b3oMeICfHsZII0sh/cAbxsIMG3MUQ==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4bkqq5ahqx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 16 Jan 2026 19:21:47 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 60GIkdq4029350
	for <dtrace@lists.linux.dev>; Fri, 16 Jan 2026 19:21:46 GMT
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012040.outbound.protection.outlook.com [40.107.200.40])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4bkd7q29fr-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 16 Jan 2026 19:21:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A3nWGeJ3ugJsb7crLG2eWJC23pg021XBOAGoWVl85HvTphAAdrVrMvZYdmajIu8sZlfh762T+TYT8ww3wZcyAovUWDqXCvRUqpC8l000WL3L1uTbYkPg01mx7KURbMMAMfJ8Zk+br9aNbjxao220Z+WWvw+YKRTjw5D6m3p9B/gm/uv2d5iYqmID6xg2EgInA6L855eVrEFJuEBfLGdVYld/FMITVN4M7LmtW5aLhSWzJBuxW77u/PbRkr5b+ddQoK7Tq0q2Lw+2w+idRuwsk3JeEcWqrKsEGxMaeoVOAQXkNlMZ5ceswcn5EckIN666KztZBIpmVdyz7N9n5VN71A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ag9RiIW73N9+Ppu/sJcOQtPsgW6eBx0hQXwY5VcoDVY=;
 b=cvGUM84/TGLECVVuizU/pQj4t8sZpawyXMM7uAjce8UgC1uf2II+Dwqs3bJ6o4caircIRV55JpXQItKBuvyClgSO2mtm/xQPqOJ7Lj3Z34HvFywv4etrFSe/ajzXSD7rg2o0W4fPFfn8Od9H+HJ3fKFrYn9gPh/5lR40/Jhc1Q7CI8uhtHRH9DCwWahfAXugXBcy3VGcvlvxYcNJgIqr4uPY8DdMOwGLX9SX6XbnvunjJPZcEoNsGnsyXEX/Kc/d6SN3z1z5xeqRlB7ZVLzORuSz53ADXHeXGgJ0pfOMkmw+jcq3MNoEPz0KdE7XqYSoiEQiyAG5SowCA2Hbo2IfnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ag9RiIW73N9+Ppu/sJcOQtPsgW6eBx0hQXwY5VcoDVY=;
 b=lG5KuL86DplHq54uh4kd8/kwg2tl0u+UuFA7jxYwPzHh6DDaADfvPlVWzAsdbf9C/LZrnmkDXqUxYXGFwimN4Dp0zXEn3u00AcXTgW5qzjp5s39osJEMLLjtwMVObDLl8zDK1PCm5uCaVM4hORAHZut/EAQBi2zaH2ZUfxPqDRA=
Received: from DS0PR10MB7522.namprd10.prod.outlook.com (2603:10b6:8:15e::16)
 by BLAPR10MB5187.namprd10.prod.outlook.com (2603:10b6:208:334::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.6; Fri, 16 Jan
 2026 19:21:44 +0000
Received: from DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a]) by DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a%6]) with mapi id 15.20.9520.005; Fri, 16 Jan 2026
 19:21:44 +0000
Date: Fri, 16 Jan 2026 14:21:41 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 1/2] Remove reference to missing dt_prov_rawfbt.c file
Message-ID: <aWqPxU3MCeHMbvEz@oracle.com>
References: <20260116185505.19610-1-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260116185505.19610-1-eugene.loh@oracle.com>
X-ClientProxiedBy: BLAPR05CA0005.namprd05.prod.outlook.com
 (2603:10b6:208:36e::14) To DS0PR10MB7522.namprd10.prod.outlook.com
 (2603:10b6:8:15e::16)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB7522:EE_|BLAPR10MB5187:EE_
X-MS-Office365-Filtering-Correlation-Id: 2bc256f0-323d-45af-86a5-08de55347bdd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?k+pfjWlaZwq0VnXdSntamqFQ7Yn5T+Of6UnhlnR7DQkRubiYcvGKu6RLNwtY?=
 =?us-ascii?Q?GJId+vqqv+TILsL4lvDlu6zJoPqnc2B0evqix9JpI4T2e5hegd1hQv2J0CSB?=
 =?us-ascii?Q?glMSw10bfEeGFbgd2QV7gkf25u08Sfw3np8S1I+3V+eGzYOFgH1VgSBfDiiX?=
 =?us-ascii?Q?nG/BG5U9lVmQVjg1HFWZR51Q34IWtlSLp614n5s0IKIPB2JqK/MtPD4D+r6w?=
 =?us-ascii?Q?F6wQ5Zz80S3/BlASaBj17gF34++0K+sJnZNbg0qd7/wyLlRrClKRqCuF6VjM?=
 =?us-ascii?Q?0TYZgSIOzgj/BggqljR3H1j16NFkjtdKn9MjVxxvOpcrZ7btbY13uRZk0XEa?=
 =?us-ascii?Q?8fCj4aPbcqGqbMcFjB76isCo09ElToDUYlK/1/vE8sKBuy+MrTpVsVE4dsbD?=
 =?us-ascii?Q?43HW0rWhnlWsVxOtcbeGKTcDaSCjxfbwQIUBRjGg8FLcaDOF2m+DP6EeNIVt?=
 =?us-ascii?Q?RKv8LWeCJP8cq0em5MWi0h71EQ03OcDdjt495noa4Xo7+B8akucKQEihzOQ0?=
 =?us-ascii?Q?mQH8F2UdOCNMNUQPoCQOBtKXYaD0t2E7GEmm4wcyKCvSRv3iRm4dSSGUaIL1?=
 =?us-ascii?Q?Qo8IQ0nTALRSQAVfbILnm9c1voIRXHEFuDcJzmMhhbwF0Qt1ENUWjJWtsxmR?=
 =?us-ascii?Q?mRcxg1ZBIw+nEaCjHcUnU/9wW+1yRWyZLU6jhx6qVUuyJN7/3e0tWaFxsYWS?=
 =?us-ascii?Q?xXl0g/e0km3b78BWv8YnzJ6LW8GlU9TCPqvPmr90Kvpftt/VrGa82+iUaa5a?=
 =?us-ascii?Q?bwaY82TACLh9dUO9k9NbV+85PfaHQk6mssWjkKKimMHtboWw1GjymIkm3jp8?=
 =?us-ascii?Q?aL3qMTyxYl3KeSZnYEcEij6EdUmblxLY+HKPiCmJ31Kr9msHB/MWyy5Oe+Ru?=
 =?us-ascii?Q?T1KlJk7ABC3bqZJCkzmY2vUFruP0Sq0EiIQ6ybVoaiUgePrqqZLMnZgd+tWB?=
 =?us-ascii?Q?xIuBpMXnD0nZ89O2SlD9gZZ/NaeaCVVCk0O8CP4m0SR4PeCo4ME6rtWsUy5F?=
 =?us-ascii?Q?NNQWh8Sk3Rd1cX5e0oOTOSyujDnrP2pwDQpP9otb9C57aqWxw0i/LcJpKo8A?=
 =?us-ascii?Q?lo0XU3CA9jBVy8Kj9kgYBRnK87FT6C/s74Q8B59HHg+n+b/Cqq2PeRnjZR5m?=
 =?us-ascii?Q?UIJN1HXqO4AtHSWjNyQt+kcMVZkO8xh9JJ2PUGUuHt62PqVlj30jbXpvNHI6?=
 =?us-ascii?Q?eEg88Kk0T20KCvd1FBimYnSaARjqZO+Z+uF1QxYEZB6BCkEVVIGgU4ZLI2Fv?=
 =?us-ascii?Q?2zbB65xRHAnqdHnObo3it8+gM0TYEb3wYUpdLPCEfQglMVHBeH9S2rMQcvd+?=
 =?us-ascii?Q?ilW1daO42d2nMKqamjAQxGkMFKsGiMeituZEEBVRd2jLj0toEtz8yhsNF9jU?=
 =?us-ascii?Q?v85pw4LC4ERNHOycJnju2j+rNjpSGPNgYLENUJceYubgo3V6HABrBPzCEyUD?=
 =?us-ascii?Q?HxU9DLFtRCeVTsu3bxhtBtPFjaKGfNjQYCGGMcaJYpf2RL7xxhW+mKantwpp?=
 =?us-ascii?Q?XdEtTChYLlsns7+k7VIM+J/FTUzXfJM9fQGFO0McjpAvOoftbbwilvqBLwni?=
 =?us-ascii?Q?mT6Aku4fTWO8ugCWYMp2DrbA2G6UWA5kpGsqe46P?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB7522.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?oQEYiyZaAl5ONt64cRyaRmk+915JkGf0KKjwcZkdHJVue4zVeQAidCidt/zd?=
 =?us-ascii?Q?CnF4xUHCRsHCjG4xoc285z+Z2eKbDnTX/tsr5CzywkFQho19AwGNlXdMHZG1?=
 =?us-ascii?Q?JzD74q8W9dGJx0bIlipj1MOL9ORITlibT8AO30BSqDfn1IzkSl7NEWWGpKbE?=
 =?us-ascii?Q?uUdkeikhIQkFTNS6tNwmv7ctrcwi19+YHAuK7QLiJPWp4Za3tjhprk80SOB9?=
 =?us-ascii?Q?KYxRdD40cKEmnfVFgl1YJ+A4VnklLLMMFwy9PRU1B1YIEhgb6wmHvNzHi7rw?=
 =?us-ascii?Q?yQpO1PanprqDhIcOILb8qnHyiIPiFTaLC4Nu/+zXzRyonfXQg7TZqwtmQi9x?=
 =?us-ascii?Q?UFdm6x4vdCWswMnPXXoY6z0YsqbyvVTAZdgOGURAgx3yAGU7rCwTguTnHhwW?=
 =?us-ascii?Q?z6UqW1eN6fyXdjrh8SmKlhgZnpTQzzrvll+sMWfwyQJR2lIVYXm7KQXTOIl8?=
 =?us-ascii?Q?ZWrwA5YLRZdAPBzDapLkyEF3E4BleMmXNFxunqNkdhvLorICLBoG6CxdYF/T?=
 =?us-ascii?Q?Sx0wIIiSwIl7nkZXHamavVQRaajLj/qljP76ggz4uicOLDhDsTkoQsk3vNUL?=
 =?us-ascii?Q?Jb+rrQxKPoUFsZyU5izdZZM5OfVbCINyqPXNuxeSO+d6n3HO8HzHVtY06HWi?=
 =?us-ascii?Q?BXaK5QbDhO4PIaNNb785jPkt08bbEBJ+Z1lEkzi5XwrQObpHwjC3sOuDSVHA?=
 =?us-ascii?Q?cHR32Qa54fbYzj6zT7BsGMi1977oSsrxKZJJUK0dKWS/AAfC1G4yxbHdnFJ1?=
 =?us-ascii?Q?9ISc+IbmnV4ZwoIU5CLrHUN7WVaUoIWuPIT2SgMpTYcvESrpqxnADv2jqR6F?=
 =?us-ascii?Q?Q6aV7cfGE2unf7OE418UsBANAUFT4yB4R/++RHYoxlBsXPkyGKuW/QrC6xPS?=
 =?us-ascii?Q?QNFC5TIAbZZLIHu8YyltpdL2+3P/miOozRf6fIIoeD5twn9kOi3URjIPWShO?=
 =?us-ascii?Q?ZZt7VVhwjuNOjsP3udQ+SfzbncPiURKGSGOYL/Qk2fd5Tl66rq91nfmuuJhi?=
 =?us-ascii?Q?8eZl+SJM9bh1JqzlbuALwkgBl4bIUrJVPhtdDBdle5/Aiwi1u+h4j35LzZ5R?=
 =?us-ascii?Q?7T94wjG4BXKA7thMnT7+7iQp9PiM9SIENAbqvGYmry59ks9WtO4yt8y25WKR?=
 =?us-ascii?Q?FZLt25CYU6rhlObqeYjxiSTgUWss+LNXsDLhM4K86cESSmzcgEpbqTcPGlKO?=
 =?us-ascii?Q?N7SqL4wKDQnPNGjxcbOcc3dR3B/4oj/90GmPv5jHlg8Ih1hzXEDlg50htjQn?=
 =?us-ascii?Q?ytgAVQnPydRE689pfwcig+ujwWF+plTDYM9lMPQM4pPV2jFlh0jm4gHSylRa?=
 =?us-ascii?Q?LTfkeagKPYlvoGvM31EhsU+zLBpzdgRCu0Ee6XUludMuy2UwhFNDyMoWVKdc?=
 =?us-ascii?Q?5JovQVrd8saR9jLWkd74dkYfvElcLGstYsFm8VUamRPLHAkJivihpPK5mTKT?=
 =?us-ascii?Q?MUJT0JCSDYA9nvp0bk0Z4LMbcgwDnLyj/yDzeSiD6Wui+14OEBoO0hMjOFEH?=
 =?us-ascii?Q?LkztIkYIx7Z3wMz+bmT44J8S0AhuNCyxdZhpe4lCywTb97i7Vs9FiXj+nhd/?=
 =?us-ascii?Q?zmCzBM2C/6+wucvTBapRJqnB/qxMyObV/jTqRYG50A3y/gMfLUoM5+z2PIok?=
 =?us-ascii?Q?vvNrp6pigAjmT2mb8eaMCcGYxMwPjKSl7rNgbUiRaD+ei6KPOV6vlNqzQ1Xa?=
 =?us-ascii?Q?OHIEqfEbu20LlbeMQbgfMlktN4fydkvqcT9/rNRJEsx8YFu2fIPf2Do1pasA?=
 =?us-ascii?Q?6GFlEgJtBw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	MYoIlzY/n3lfxv+EZEA5TKRVxi0OO6Q3al70NE5MK5m/K8tx/Go0U5o3QQCdwjsb+BCXO5/j06PH9DRmkFLs3Nb4/YsTcfyqqYeySUjCRF0sE5gjDe8dDsV7mNGHpa9QOGE6CeBgVg+8xnKO4EzzejydrlU35vU81jXJ8EUHg6/0wIYPJhfM/BM20uhNXRtjhM4EaKm58AyFnp6RPR+dWd+W51CsWvq0jhiNpOLZWEaDP2rkyrXaRgmd5YuSrKrXJfC6Qf/3+pehJAX9E+q5J7HrSz1q0Lk1nNrfYryDfXEnpRufPP9sw+Ho8WSCf8Xy2btX6tgSkyJO0xriiif6NiJjmsKrDxO+fOncWS+tTK3hhVVkZWps/bXFaa28NJRnkOQm8R9efYLFYNek/asRWqbQkb8h37UWXmexDGq6KX6S2XGZPuD6ZhtfUolVhMMWRoaPGYjKIJXYEya/HCYHHBBgFEyt/PemLjXxwtBUFedXex2o2nBbdqfEn0reLyFvxsX/MHe5H1qf4vHGKZmDsAJKBnnNL+hjdg+SwKVR+Nx61yfndaPAknSrv40910BbwUx7/KKa3823LEpIaEnhkI/8FbwrbTNKOdGzaMC3Mq4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bc256f0-323d-45af-86a5-08de55347bdd
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB7522.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 19:21:43.9430
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c+NEhqkOtyPlkSxMAzpffjZrDAPn1YSIa2Z2vngifZ+w0iQUMEfSAe4ijiSmhSwkEbLTBl93SuhZLBPmCtdBiMLVnpCwm5EFYe/6kwfIVWY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB5187
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_07,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 malwarescore=0
 mlxlogscore=999 suspectscore=0 mlxscore=0 phishscore=0 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2512120000 definitions=main-2601160143
X-Proofpoint-ORIG-GUID: lFj_MKr8oXhMZIt8e5U6i0QaCRm4cxSj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDE0NCBTYWx0ZWRfX1xL1hTrH9X/M
 02CFxt7QKxYiGwxi7mpTxzND2ElnF1PAvlvukLRL5LUAvwzwSKgsr+WUAuU/7p66TiWiSW36HW+
 iPInI5PeteFe2Z4MD8i4oOeBwXsQqAvgGwB02BoJpL8Kw8l4SiI0PXk+urcrOLUKfi/r2fMSKbX
 4x7oiGlZNAdHD381MtuQ76qAH+aA5ZZvjvfRsce8zlcPUqwnNCP4wfimwrvcsg/y6QL8jam9Jgu
 XbDqtPs/lZDG/PgxosZqI7yAVMNSuN54NEEMevGlgOadU1OJjT1EdI10ENSuUIYBfbrNZUBt7Ho
 cSJ+J5HSG0z0VEGk8GoK0RuoIlh55xS/PMqt4yP9wOhSYRBfkh6BERrYa66zD43u3dVljLVL/EW
 Manr3iWVh+Yn0QUu29+Yv3HNRXPZgFp3zF2GlMUDB0UChjIkUlWLQXHmJtLXTk9aP1pduGFJrki
 Qwi4YXX7dwosJjICWENxNMhwxyxhnUgDyVVAuQXY=
X-Authority-Analysis: v=2.4 cv=J9KnLQnS c=1 sm=1 tr=0 ts=696a8fcb b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=yPCof4ZbAAAA:8 a=wI0BT-AHudYE2s8Lm8MA:9 a=CjuIK1q_8ugA:10 cc=ntf
 awl=host:12109
X-Proofpoint-GUID: lFj_MKr8oXhMZIt8e5U6i0QaCRm4cxSj

Maybe change the one-line description to not refer to a missing file because
that seems to imply that it ought to be there.  Perhaps phrase it as:

	Remove obsolete reference to dt_prov_rawfbt.c

-or-

	Remove reference to dt_prov_rawfbt.c which no longer exists

On Fri, Jan 16, 2026 at 01:55:05PM -0500, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> In commit 0b7c5a6327 ("fbt, rawfbt: consolidate code to avoid duplication"),
> the file dt_prov_rawfbt.c was removed.  Remove the remaining reference
> to this file.
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
> ---
>  libdtrace/Build | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/libdtrace/Build b/libdtrace/Build
> index 90613e9d7..3a6c04664 100644
> --- a/libdtrace/Build
> +++ b/libdtrace/Build
> @@ -1,5 +1,5 @@
>  # Oracle Linux DTrace.
> -# Copyright (c) 2011, 2025, Oracle and/or its affiliates. All rights reserved.
> +# Copyright (c) 2011, 2026, Oracle and/or its affiliates. All rights reserved.
>  # Licensed under the Universal Permissive License v 1.0 as shown at
>  # http://oss.oracle.com/licenses/upl.
>  
> @@ -115,7 +115,6 @@ dt_prov_ip.c_CFLAGS := -Wno-pedantic
>  dt_prov_lockstat.c_CFLAGS := -Wno-pedantic
>  dt_prov_proc.c_CFLAGS := -Wno-pedantic
>  dt_prov_profile.c_CFLAGS := -Wno-pedantic
> -dt_prov_rawfbt.c_CFLAGS := -Wno-pedantic
>  dt_prov_rawtp.c_CFLAGS := -Wno-pedantic
>  dt_prov_sched.c_CFLAGS := -Wno-pedantic
>  dt_prov_sdt.c_CFLAGS := -Wno-pedantic
> -- 
> 2.47.3
> 
