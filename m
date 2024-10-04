Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5AC21F4FCA
	for <dtrace@lists.linux.dev>; Fri,  4 Oct 2024 19:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728069769; cv=fail; b=YYR13fr2fby/YKJSRsVFXj9jS2UtbOAy7txIiJBkwtPhQeaNSyAnDLogzy00SFnkv0NXdFDd17iu+yJUoI4gXnWFAHoG4En6y8MkEZPXG8kqg37XWg5N2CApTjUGHZQymPhSsujMCYuDp0ykL0YZ8QB/YYt50CRgimP5pi6UApo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728069769; c=relaxed/simple;
	bh=G2i2fTXgTXdWyuTcxqrqY4uNJPkCD7iK83SXbW/layo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=rpCn9VZfxMrT4hFeiEuE8qIFruAMNCm55EqnJfsx1FraeV/vflwm+i+3myA1zv31dmUDx0hkKePuVHEiX+XmiM0C/2jf6TAZmtkj43nsg93tsOJHfErrjNCtLULOKSHO25pgjapkeCrrylxku0yttE+F6h8PLPyJFpZmOXBy8PI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=ZwRKiGtL; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=VnvtDe0J; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ZwRKiGtL";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="VnvtDe0J"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 494Hfent013304
	for <dtrace@lists.linux.dev>; Fri, 4 Oct 2024 19:22:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:cc:subject:message-id:references:content-type
	:in-reply-to:mime-version; s=corp-2023-11-20; bh=tPxNe/rWrSZQnwm
	br/2YWD1+F1Lpo1pctm0Zi6FZZLU=; b=ZwRKiGtLQUV+7RALR3ePx5jdGi3Cdl+
	o5aIS5VAJaRPFL+RTsU6jtAPKDymbthJ5bVzPwgYyNAAarRCtfUdgnDQbOzuD5+d
	RLF22EJ5V6shSEtd/ZrSVxg2/Z3x5txjz/gwaZveA2nj/82Yo9Z3MVYV/vgiBE05
	2PFI0ryzoRQv+2abOFLqmr6bvvh2bLMqeZrq0Dxbq2cMjDM8bw0HNjqN0GPzjsCq
	0/yLIzFZIblI/+1D5KfkLOQu+215XR184h8Smwm1Vu4RcVSFM4R5W4slBD6O6haB
	woeqJtLJepn9STGzLpABwzaYamwI7nrPxC1Va4gBPKeSU0Pca144qWA==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42204gt9f3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 04 Oct 2024 19:22:45 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 494J75MI038181
	for <dtrace@lists.linux.dev>; Fri, 4 Oct 2024 19:22:45 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2100.outbound.protection.outlook.com [104.47.58.100])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 422057q78h-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 04 Oct 2024 19:22:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xErhwIQKrN0gguipn7Eq0tBwHct0pbsW9Jb87cCosspVe+iH8qRB+4myy+2Qv/rWiOjLG9WMNlWpvzhp15AmGLGGVmiC7fCNQABdBPS+h87+SEvTI9mgw/d7t1CbbI97ut8vMtzsMYi2fhzenFa9aZlUUm4+lRU47/DHAqgfaVr5hvOHGb/tPfQfOZ8CkBB2yH4q0NH2N0UVCq+5lcrw8DyXhC7K/5IwYy2nx0cApdEcIthGT2B+lOEAtwa9nfNmNnHJB5nEI/oxoBOW6GbiusXwqMPGJfMj2XvItuWgcX4XN3nk0w05HyIpiY2Owqm1oy488Y6Mvu3YcOVLOoW+1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tPxNe/rWrSZQnwmbr/2YWD1+F1Lpo1pctm0Zi6FZZLU=;
 b=vqyiAOQ+ILwZB0JzCNBpnq40IQRz8XvTK4UhjFx4OCusx86SKq+rnMcZu+I88c1r+N8hJ3LLdb+eli9w7NAgMd/mYaxkn07k/HBAMjOB0MM8dSIP6lcSE3Rs5loCsZfk4YG71GBKXC/TMtKHIooQ0/slxXNNwq8lqiL2oXRhJDz/W7zyhyfQhAqgnuOmysvf07itzRfkSISREhNSuxm/80qF3qzgioyfNGd67FLaLhe1b40LJPdP0wRSfF0zFgT9zausGTgPDnrnSt6U2kqqdKAp1oeBR66fLBIeK2jKqLIzyXyGJ7jJ5hn/Yq2u7bxCSUlEF+n0OuY4nN5/g1yS1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tPxNe/rWrSZQnwmbr/2YWD1+F1Lpo1pctm0Zi6FZZLU=;
 b=VnvtDe0JsHVCWtWyDd6J4UDcCI+BdNlTDK8HRQ/IG/u0EGf/35UO0pXG5YMMAvEThKz/6TBo99UZiW+0ETxC3ttdDTKtrP49zrE9Z/L6GFHDJhQODwAyVClBeyRQvKwzY7PMq6oRvMrFhk1YFb5GNirXS0l99ycFJkrIr+OmI64=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by SJ0PR10MB4560.namprd10.prod.outlook.com (2603:10b6:a03:2d3::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.18; Fri, 4 Oct
 2024 19:22:41 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%6]) with mapi id 15.20.8026.016; Fri, 4 Oct 2024
 19:22:41 +0000
Date: Fri, 4 Oct 2024 15:22:38 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Alan Maguire <alan.maguire@oracle.com>
Cc: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        DTrace development list <dtrace-devel@oss.oracle.com>
Subject: Re: sdt provider and access to the trace_event_raw_* struct
Message-ID: <ZwBAftV8Ov3FG2jr@oracle.com>
References: <9253be47-c9cb-4967-a090-cc1cb1f23c91@oracle.com>
 <Zv_7try5KxexkrVy@kvh-deb-bpf.us.oracle.com>
 <2d1eebfc-d0ca-4fc8-b6c5-c8fc3a37faa2@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2d1eebfc-d0ca-4fc8-b6c5-c8fc3a37faa2@oracle.com>
X-ClientProxiedBy: SJ0PR13CA0072.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::17) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|SJ0PR10MB4560:EE_
X-MS-Office365-Filtering-Correlation-Id: e78c1b98-323a-4c12-ee16-08dce4a9ea7e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?2DX6RBru5AHdqmWKlU2dOZaCav8mZhJJuDq8pryD15IryQNXEY6TIxiCInne?=
 =?us-ascii?Q?IPNJgdBfxTAbamm3KdRfVzB4rpIWvu2o3cF/fxZzPPYUXVLenUozGNnmoMFE?=
 =?us-ascii?Q?XdjLwtYGD9DqlN8quXRrv3+d/i1POW4Vxg0zg39Ny+TwgLDn7OiRSfb76iRj?=
 =?us-ascii?Q?66bJFHtvakxzSGe0aRoxlZ8QdYKH03t+c+TD9NapypKCOljRKftuJk6zjyIy?=
 =?us-ascii?Q?vmGRH+i4XkxvybNsoxWzDFboNhAb0Bs8cD3SFbVmfnD0w2Y+GtZ8HTcOBWIq?=
 =?us-ascii?Q?HHuuA4KELynOfywTqsxCpRHub89RSIpF+43mAmUM35eZkWs5FwKP+EzuCSrn?=
 =?us-ascii?Q?v4IYPh1K1pGLZdjw2PLb7Hkda09Sg7t+E7eblepnRJFrgCiskMmdqtnwhTiB?=
 =?us-ascii?Q?5hsYgqirERZ8ZYhjkeFdTrck75I22qTFi46gTlfl/t8rwcX9pzPTexexjZqH?=
 =?us-ascii?Q?0h/L7uyAEctkBaY4rZOpH8ZImiTUJj6Sp3lTNNDbW2jlqqgmLkT46y3MdXvB?=
 =?us-ascii?Q?bS+wg3vVx5tICygXe44WGTjBoCC9PlPdXBxf5wkZMjHsN+lT3SeVvGiDdYZA?=
 =?us-ascii?Q?7gEsIPi5npV0e3F9gBu8+7DXSpLDMldW0P+iYmHbEA78kub6io29vhbveZ+u?=
 =?us-ascii?Q?dtb7FO6EOxV3a9OvkQmSTOTv2VsyBGyceTvHDK1hl2XkfWh1yJGrOvT8BU3B?=
 =?us-ascii?Q?Uoib5MHLGBq8Heikcr0iZfKwomUmXLtKwby+SkGokHs0PlstWSemf9U0T+eS?=
 =?us-ascii?Q?9na84Yl0APV8XMyG1r8tYi8DehXrnim4unq7/0QUeUgWmWjZAfpi/Odw0nxT?=
 =?us-ascii?Q?PCWLAK9sRZxrs+JX4AKQk7JhHP+f6coOfGAjuZJ+dv9vjQuFru1GSZhiAvdN?=
 =?us-ascii?Q?vJZpYBAYAONT/pxlgcsQLAiFKpARcbG/J5wPL35AlJzpuNMp0DfhdzHVnfW+?=
 =?us-ascii?Q?yGr4JLQfqQPigBbtAdhaQbWXD7Z6Itfof4flGPclQ8RnvKERjwRd8fDT2m8u?=
 =?us-ascii?Q?F9HDnExcu/qeKb8YZt6JizLMOniAbNDWvK0iK5s6gIWJBAr0yODZTvg5c/DM?=
 =?us-ascii?Q?+RbEKGY+nptB588zSZskHulD0n1Ikk3EHwCyybvizLLKjSJduWIj0zUmsFIU?=
 =?us-ascii?Q?Jp/Vsrt4P6mU98xhgwvg2ZmBA1hMj/uI5D9zINi4bZpT1l1xnyIz7CbC0RJm?=
 =?us-ascii?Q?nc5G0q7w34i+royQR5TPOOGNv2EwqeeAKAzvImalK5cVLTRth2C6NpJK+2QR?=
 =?us-ascii?Q?0SJOFJxqNzOZ8ld7n28AoDFHRrqSJSIpSy5nc24dTA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?BA7E24APoGh3qGhkyWL2DlhaWXc3E8h83XX5FiFUf/u0hgjBhhZQ1p9xpeRc?=
 =?us-ascii?Q?d1Ekj5YvEW9UfV8b6/iOLar4/NSLe1XYPX6lXOBZfTQQegkTssI9Z3C/DJ4T?=
 =?us-ascii?Q?A05+EQUXfb/cf6ixJs0FDxP0a+hxOfn374YUx0JoiDQNl+2+jqHDwNFf/6LC?=
 =?us-ascii?Q?AKh4NN69u45Aay2uKA19zbAyrn6Iqt2w+428edEMTjq8S4ffOzjTQ+kV/5DA?=
 =?us-ascii?Q?SdsO3JfQCYpd7gLNfKlJ5GgR9/1d1k6RNRSyZ1TykwD/5Q6sDcIG0b9zh/9s?=
 =?us-ascii?Q?T3BmWulY64Vm34FCmMrL0RreKEuyOfJtmUeLwd3gbNafsYzSEfa9fbQzVG2/?=
 =?us-ascii?Q?iffevxqxxdv/qWUiMmQzCdFSkGi1HxrcKTvq3FG0Cwm29P22TySFJSub3Q8m?=
 =?us-ascii?Q?Xy+Zf5Fe7Jg3ZCx3tzwo/At80vw9q9B0FQ6yz77QRC77fdjQPqVxoZU+RGL6?=
 =?us-ascii?Q?2s1G7A7aWlQNO+PqByrQ4kzOl8HYLDQeNVag+mFQzq5SRQQIg8URQ/y216q4?=
 =?us-ascii?Q?cPrhMthGVpaL/OICbmGydto6WxIy+3NGbAFj9lxkUP4PGXomHx7h4aJwFahb?=
 =?us-ascii?Q?45P55Pxk2cSKM0Vnphdc4pNm3bkj7bxG6beWe3OEv7pMWbPN1XEray1ENdyn?=
 =?us-ascii?Q?n618oWahtSrSY1cr+Kzjda+iJcGe+tLbYXUie/jRHQcd2wZ04AdO+0bO6F/Y?=
 =?us-ascii?Q?BnEfCi5SaGgxG9IWhVRcAyE8Scnibx7y928J+SuiTvVMKBF7vNs/JxxPD+Gr?=
 =?us-ascii?Q?Z11NzqG2QNvvN1sRa2W0WqVz0xFXdYZOS9hPVSuqbxZ179vaarRtge2mtaBf?=
 =?us-ascii?Q?JH5NxresUZLeryWpXys4IrbDdyXs67SlbFMX9xpGUodJCrRX0Q4qJ8QNqzsf?=
 =?us-ascii?Q?i/sffG/gvmMrNgdK2/U+uLHr3BbNKIIVzvEtsvO5yGGjSEgnLeNRGKT0JdPc?=
 =?us-ascii?Q?wMJen4lyG6iWtx4WBKjm5UEOAh6CypD2y7l/Qh7h0cTZMxjzD3lLmHRic9t1?=
 =?us-ascii?Q?hhLCsOQfH0CrlGu3F94Yd1rIWxcqrXDPzEVm0lNfQG7JKICFkcrOGFkJWZHc?=
 =?us-ascii?Q?4yrbYZtWcTNiVQmnuBl81oTUjp/2FimQmCWYt9z03iyUfwFaXaa2HPZPbayz?=
 =?us-ascii?Q?mSpeeCFjDFE0NzEwaOW0eXPwxlI8L6oIvPDGPUkIryEJPXLFUkw79X7dH/vL?=
 =?us-ascii?Q?VI85Fcd6P1KZXS16JFspSUrtadGRdUifOgjAmpifSGVdvrnExQmA6qVH9eG/?=
 =?us-ascii?Q?OzFQwXrOzgkncnnmv0MovjBJX9C4dQhUWrZ/qAdJJwwU4Va31WzBsR05pU5Y?=
 =?us-ascii?Q?hNf1IoF/kwxqm8VbEi5ZHtp2WVw30j2zLI8TDvcGUE7Zh7NlJjs8wYzzKNW2?=
 =?us-ascii?Q?2IZ9opnAcVYAD3lqWBrTB76wAl4BTEagobxQ6F4MZAl+lUeqg2pRuoySaK4s?=
 =?us-ascii?Q?nm4BbAXMFLrPGGupk3u5gUIXpBUzKTDAdA4WeTH2mZ97oMxSt17P1CrK2W8D?=
 =?us-ascii?Q?Wwy4t9bqMY1Dnb8QI8hmog1W79npvWFewvcVA4j0HasxwcthJg+T7uLf4T4K?=
 =?us-ascii?Q?bxjORcVwiypS4Xp93Hx50Uj3AmfSHYcf+8GGQYvmPGIj0BhJbuFaN+8kM9dj?=
 =?us-ascii?Q?Sg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	jaEjusmNVR/yBwyALtj2j/NkWf8L+ImElgcMtZNz4t9VcwI0/5+JIEWd0b/iV8wARzsKsw257J7ev7KXA8rDLIsW+K4zZiRajY+triAK0ADRbVyHsbR7eJnONAigH0oJisMz7gSVqhVuZGPKZpJjHE0O9C+XXnZjfn/mbbPAA6vLZ1VrYoC1fjJVO0Xjbn+YzObKBH2n365KhX9lCE/whmcRAM9U5Ajd++CeGfPf3XmIAU32drhGcBeNhyESNbcGa7C/PaR/3Ytp2BpyuokcmXhO9+fTUy+/I6x0LUhyODDTjEt73m4M3DSoWuHyKQFTyWB/oRDDiOkoncPa6nOmECWhjPJsYXTuHAlqE49K2K90ycWlq7BL6oDu/v+W4tboomodSrlRJfMAwpJvum1SRwgvgzS9xqYC/RgbohV/6486Y8ol1DcI7FqFBC+pHDCseANXmezcWFR/TaXkrih0kMgz1k/2L9+XUoEENF8KdpghU8acpK4zNHjIzPLGDkyCztdBqxNvgxUJmMaeoSNdaApmbvappfuLtYTe1tzerSrMRz6c43x3RI1gy8/ySCNraYbA9GFcBAZgMZHg5Jfu2hMVMjjmJsxGvVvoUx8yXaE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e78c1b98-323a-4c12-ee16-08dce4a9ea7e
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2024 19:22:41.5743
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JgkrSxePAETU5KRYOTVasPk/Q5hezYNHm0ZpZMWL4f9paEGvpuy58l3q6rIwECdctM7qVZYYdJAQL/fyG5mWQRD57daJHffg/TyZxlBrOdI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4560
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-04_16,2024-10-04_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 mlxlogscore=999
 adultscore=0 suspectscore=0 mlxscore=0 malwarescore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2409260000 definitions=main-2410040133
X-Proofpoint-GUID: GcUFG_ZKQlPDIypkKgMfnmrArGAj5OqR
X-Proofpoint-ORIG-GUID: GcUFG_ZKQlPDIypkKgMfnmrArGAj5OqR

On Fri, Oct 04, 2024 at 04:46:58PM +0100, Alan Maguire wrote:
> On 04/10/2024 15:29, Kris Van Hees wrote:
> > On Fri, Oct 04, 2024 at 12:29:35PM +0100, Alan Maguire wrote:
> >> hi folks
> >>
> >> I've come across a case where I need to trace a kernel tracepoint with a
> >> lot of associated trace info.  It seems that the current approach for
> >> sdt probes looks at the "struct trace_event_raw_<tracepoint_name>"
> >> structure and maps its fields into args[] values, translating each
> >> member into a separate argument.  That works great for tracepoints with
> >> a limited number of fields. However in the case of a tracepoint with a
> >> lot of such fields (i.e. more than the number of args[] supported), it
> >> would be useful to also have a convenient way to access the raw "struct
> >> trace_event_raw_*" data, especially since we have access to it directly
> >> via CTF. It's possible to do this via a hack, e.g. the following works:
> > 
> > You should be able to use the raw tracepoint provider, rawtp,
> > e.g. rawtp:sched::sched_switch
> >
> 
> That's a good help, but I should have clarified that I was hoping for a
> way to get the tracepoint data _after_ it has been massaged into the
> tracepoint form; the above will give me access to the raw arguments that
> are used in tracepoint data setup, but I was hoping to have a way to get
> a pointer to the entire trace structure after it has been assigned. It's
> doable in my case (since the first parameter is always a reference) so
> not a massive deal, but it might be useful enhancement for others.

Can you give an example of where it goes wrong?  I don't see a reason why we
wouldn't be able to support more than the number of arguuments that we store
by default.  I.e. I do think that there is a limitation roght now, but I don't
think there is a hard reason for that.  We ought to be able to support access
to all arguments of the probe without much extra effort.

> Thanks!
> 
> Alan
> 
> >> #!/usr/sbin/dtrace -s
> >>
> >> sdt:sched::sched_switch
> >> {
> >>         s = (struct trace_event_raw_sched_switch *)(arg0-8);
> >>         print(s);
> >> }
> >>
> >>
> >> ...but presumably that only works because the first arg value isn't
> >> scalar. It would be good to have a helper or builtin variable to access
> >> this pointer directly. Maybe there's a better way to do this, or maybe
> >> we could add a helper/builtin to make this pointer accessible? What do
> >> folks think?
> >>
> >> Thanks!
> >>
> >> Alan
