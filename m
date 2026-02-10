Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8276946A
	for <dtrace@lists.linux.dev>; Tue, 10 Feb 2026 20:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770756353; cv=fail; b=f1gTbYD+B66oKs9NsT+wgPD6lOfoUG9fbvrGaY40m+U51NVuUOKknI9KkXwAAkhBeMohU6svURYBUIRZf9Xbb4VzvKLXsoSHz7M0M9/tbbxeUWyA05DNwfteMwVkAvcUtmVzz3eqdgLQNlk5xts4/MA8tRDWXR5YJ7qKmNYx5kw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770756353; c=relaxed/simple;
	bh=sNAFGCOhYFQHdN8HSIU1HlUHUFy1CWWn9Z/l83UdO0g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=QrnzQqdxuu1I7J8iWmAreLiIwbchpVV+EYIbgPM7TnTpiKyJM0zMUnwYwHJ0IvzG+k7EsOTpv7lu4U8JjfFcDE4embScL91vwoItFD9BTnsaC21BBGesfCA63WoMAvFbcmxoj71tLIkJhJ9TWwbQmM7NgvhQcz9JwRkPPjZWQlk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=f23hQgCQ; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=ccdoJ/ig; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="f23hQgCQ";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="ccdoJ/ig"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61AH2uvh3923645
	for <dtrace@lists.linux.dev>; Tue, 10 Feb 2026 20:45:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=SaTj9+DqjridBLxK+r
	AFbiI8KszRGJQ9DZmePJ636wY=; b=f23hQgCQUiPaWETCqP61njTGon+W8Rj2pD
	lItMGjHuFi+W7ABPT+vCdZedhsWzm2EIe+ZzONbW0cQ1PAKLLo+dq9VaKvHbJJbG
	l7l7YEhG1sE2ZCUKIgkeM0/umrV0Z/Xjaqcq6zej89jZgceZJ6baN0/lHjYlIwZu
	M4p/GyYqWzSNL8nwBDZqIzj+CFIpgK4erYhaJr8y6LlH5rFh/2FWPr0DTvGdMjmT
	brEmuFHszlF2WYXOFo8gOCMGNhvCXmz0/eZDQO5aeTNG/S+bVJ4y/Bl6jVCMTId9
	PtuUx+1zZ17mAXne1h24qIGu6eqTWRuycI5NameGoG7gKW3Bv1hA==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4c88qt0e91-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 10 Feb 2026 20:45:51 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 61AK7IES030561
	for <dtrace@lists.linux.dev>; Tue, 10 Feb 2026 20:45:39 GMT
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11010015.outbound.protection.outlook.com [52.101.201.15])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4c8228kqqm-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 10 Feb 2026 20:45:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oFXVz5fCnTIvecnotqnGp7rB9Bz93kP4jWSJX47v2B+39nPB5d4qVjGti6OEq8odg0b5RXxYrEtfiIWQj6FR474fywOEJ7Tkw/FqUtGPloYo3kL8Hv2yF+HkhIaQMAiRhmMeSK9F6gJ6dLMl14HQwACjADwDM9RA3XTWcUw8iJdbJPJr0xypjgL5bi3k9tKImAslRfpP13GOtrSbHN+vSuyCODHvlHYVJSL53qrVQJdZv/3p2B/KRtU3Lt0a/anC3u1YYhupkk8UPFpGbezioJUydrc6wpgy8Cfxnh26ha4fyOot7LlS4u/cbATepJ+peJOOap0wnOwMGZdsnkIMyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SaTj9+DqjridBLxK+rAFbiI8KszRGJQ9DZmePJ636wY=;
 b=rFXEJfZqcNyBdhdJZv4A/9B/7RAD1Nnc3nQKZnvBMXMECyMXgU4CCHoZTJvV+gNIxy43Drw7kEtJN2gz53fM9z5SmhevS1UTqN0IJ92H0EROzziH58B+Gyn1KAqsxQ0wHh/a3vqk9atY17FH/V/O8IFlF0VOZw03315q5i7haYjlgZuPp3Dxi7fAAYBlq7p1T6Aj8SN+OGir3NKdWJmXB/dD/AfKo0ulW+eYX9owNGxSj/JKTH+bws8GUtYzJuNc+BBsqpmFhZ7ZRWQ7dTSvXgorGEh1kUsBmwDow74CuNEoWFbZBBLlVZvExm6gvJjOyHLrh41A/k1ODa4X2hc1Mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SaTj9+DqjridBLxK+rAFbiI8KszRGJQ9DZmePJ636wY=;
 b=ccdoJ/igVwVXfm2Nnhanp3zVOgd9F/wjRHa5GnN8+yrbZbVWOJPdzPkjUcCP1I7en/tzwGiuerGS7eCXrSovQ9AQ9GtuyDF0CB+4W8UaOS9ks7txzZaXGStWO6vs5u1dG4IOznjcdj6E6g1pxF9fY+7oHrgTMnXM28JCldRHi8s=
Received: from DS0PR10MB7522.namprd10.prod.outlook.com (2603:10b6:8:15e::16)
 by CH0PR10MB5097.namprd10.prod.outlook.com (2603:10b6:610:c2::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.8; Tue, 10 Feb
 2026 20:45:37 +0000
Received: from DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a]) by DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a%6]) with mapi id 15.20.9587.017; Tue, 10 Feb 2026
 20:45:37 +0000
Date: Tue, 10 Feb 2026 15:45:34 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 2/3] NEWS: Fix indentation
Message-ID: <aYuY7odgTkFUIVfI@oracle.com>
References: <20260210201637.8863-1-eugene.loh@oracle.com>
 <20260210201637.8863-2-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260210201637.8863-2-eugene.loh@oracle.com>
X-ClientProxiedBy: BLAPR05CA0013.namprd05.prod.outlook.com
 (2603:10b6:208:36e::28) To DS0PR10MB7522.namprd10.prod.outlook.com
 (2603:10b6:8:15e::16)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB7522:EE_|CH0PR10MB5097:EE_
X-MS-Office365-Filtering-Correlation-Id: 91953b1f-0ce7-4a4a-87bd-08de68e55815
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?lkd+gcIyVGN8KaRELH72Vew2wPoDpeR/TxSrVxapWp6R7tRUZSUekq88SarU?=
 =?us-ascii?Q?Djo+A0aJk0olMu/iaQpitmaZhycLD98/muSeyisBIStgNh6PoXmehLn3qxL3?=
 =?us-ascii?Q?m9FUXhVWT+JmwLuB+5huJ6jQeyMDLaja88pjty+3ZJ7RlOMxlEJTyjXNetZb?=
 =?us-ascii?Q?FKLp24Gp2G1TIQbc0hGPrsOfYwHjMzYysTruu00njIisE9aIxIhY9py5SAju?=
 =?us-ascii?Q?QHxtzq0nW2KNs7cSmbOqJQ9U7aKKJZeLfmEeiKc8/IjcTA1rUnamM9YQZh0S?=
 =?us-ascii?Q?bA1atupOXoPml1NHKFfKGMZp6L2DZbIKpYRKoCw4cq40YiK/j51q8F2LstFE?=
 =?us-ascii?Q?Q3ql3LwvJ7r+5v+/esVfGkkjphSYsysK5vRixXvGNfb6PeLuygmwTnFhWqPK?=
 =?us-ascii?Q?abr/H/SPR25dzgRy5Y0VGEsfcl2ZSVbFXOA0g8XSCq8uLf0VrAKuazXoZAY6?=
 =?us-ascii?Q?1agBohecl/tcjgN1mFaDQ62CFZfAOEXX4kr/etLCRUwfKgA/bAvlGIkrfO7b?=
 =?us-ascii?Q?uSu/kH/7YFNCCa5l6S7Plsy7xTWMXuaTp/DWsxlEjkgvnE0Xj2TmIUB8SkYX?=
 =?us-ascii?Q?Ei2JZo0/SM7el6A0ZjJ4W0UT8HC3QMN/Cm4b9Ovgv/O94jx2/kvO6iqZlw3P?=
 =?us-ascii?Q?uWy+6notx5nY0BWUZ2nNTw/odMtRXRDHPF372kAYGcsV0bWkGmvFkua96Snl?=
 =?us-ascii?Q?wolG7iAQOfWPXjVJPaSQh6AH0jmtrubEYRSeyE1I5J4wGLStuRefUc9pZv/U?=
 =?us-ascii?Q?adfyxZFSpaVIlgpP4UAE0QpOWFH3MK+unyIbUGPxd+gj2iWOOqJCoTi/ByQc?=
 =?us-ascii?Q?1UzK4aBRv3zijOEDdAPr4DbNsMqLPALfh1kNJ2TMV4c44FI/nSuDGEsbUtRX?=
 =?us-ascii?Q?APimE02W5sDqTMDCfIiZorqfDXC2qq8O+oocahO+11eCe5VRKV9Y/wiBjhdu?=
 =?us-ascii?Q?gF6bAIy3UxDbW+2dVCaA/wZyIOtc/4Wph3OD+Sa3zrELTZIpKNuwJHDQ6VhT?=
 =?us-ascii?Q?Dc5fxd+1uFTMveR1hAHp3WtOQzTg3DCReqgYEErhUyEL03UO4f+hNWTpjOB6?=
 =?us-ascii?Q?uN75Gnq2sn/3nfIMUtmGXyRwHcy2orJDWwXfArGjSYbPlMy7uNnPhfuh4Rgk?=
 =?us-ascii?Q?OJndBmd5i6pNgr0wgYkpqUmwRmhcY1ej2m/TEAj7aj2dP+TwVMfSNRm6C6s5?=
 =?us-ascii?Q?YpGM4nnS8DP6F9Y9XfdYLuPSM0kjVzWJU+3hLlA3EXH4Kv6tNQevuISa5qrn?=
 =?us-ascii?Q?JJjPTEeSn30u4mzjsdy3MtvKClD8evjPTE46W8eUK5/bo+ZY8kri8H25qiKn?=
 =?us-ascii?Q?qt2wYihoQceD98o1bTK7rE97K+BrMVgp6thZBYgTcREHBsI/9cDykZBYL7Uu?=
 =?us-ascii?Q?Mlu2r1ne45ohtBbJtVW//AM4mrrn+wew7GQ2UoQGuUX933kWERNoESp2j+WX?=
 =?us-ascii?Q?kwtLoXpunEE7Upv3Vs9BKwm14pOBE2ezY878msy8K7+i9t0nQvAFM3BHf09M?=
 =?us-ascii?Q?6OBwNjNdXa+vHmW6o5pjVwijRqL8Y3T6vp4TNR1tGYbM7y3LfpNBJjcKL/pH?=
 =?us-ascii?Q?6zI7Hqq0EMzegYC3QRU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB7522.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?KeWC6Oy/DJgR9mC47AGsH5WEA/ChCshpnRMnip5D48w6B6fpORSb2qTj/pPi?=
 =?us-ascii?Q?skNY7Kx2E4C3E6zApYkG01XLeEZq7qdUSulaTunW7PZQUgFy0IqBYOccazi+?=
 =?us-ascii?Q?lcLAFSUIz2OAGEFc2xeI5YpKsg5pJVf+Uwv1hJvFU7e6YnAwgj9ZuzLOxP0R?=
 =?us-ascii?Q?RWwug+gbRQ/f5cbf3DAUH59/ZEejEEx0nGhbl25IiL9zoENF57IOBTC2s0nD?=
 =?us-ascii?Q?3W1sOPCfpu5Uy1mJLbcEIqYT2OWiMYUGIaKxljk+FVbatXC2359yXBKO5aM1?=
 =?us-ascii?Q?YLuaNNMxZw5PeODhum77ZvlAUWBZ1/NGgl1nCtS3SpXCSv6jaAwDEpLtF47c?=
 =?us-ascii?Q?l6cRG+znC8olVhKe+D8vD2saOvejosCZyTCTxTt4s5Q8Hww81Oh3qnPQCwSz?=
 =?us-ascii?Q?w4zePuI/RG1Ak85jJ2XQ+198i32DIWdq1QGFkyJDPWQsvxyLiesQK4G8H8aj?=
 =?us-ascii?Q?VQZPj9zkErMDUr+o2fVSzYp2aAAlQBsW8pDUE0U1vqFjtPqzObybytDcxWF2?=
 =?us-ascii?Q?9aZAT4Qk43+dygSnpTrx/sv8a7TzGsaSzeeerLiDz1v22Y+UfUKlybd90vrl?=
 =?us-ascii?Q?++hspiLbfclL7ckRaQFhNBgWKov6u5gImMlaChRTUhiMq3HW+hz/ee4NULT7?=
 =?us-ascii?Q?T8L3M3LsYdL8CQcbB0jUztpBS+0PythAfC3/94c84OEmpMvC+NvbuR6gp8dn?=
 =?us-ascii?Q?mAuXgrbAcUQuBn5hSg1zH7iubZYuOD1i2rIejDgPRyzfg6II4bLJv80moER3?=
 =?us-ascii?Q?KJZahc6YK8c+gKQqU9IvdsjKVOW5TScgfDpX3k4j7fH/JEclHsBjSEqhQmXk?=
 =?us-ascii?Q?rlqlJJEgjhUsILn666AJyXmImznocYBj4lVZnZLJ2AWtBpjctMQGefzFmhpm?=
 =?us-ascii?Q?gazBB6MHP1xmz7NImJmntuYZkLQNkTrOweieeEGFflu76JaPPtUKnb8ohTd4?=
 =?us-ascii?Q?xeN8exqGuxGiPgRf2e16l3eUEm9cR69rMkySKvFyT8D1UT7yj4sH6tRYSGvS?=
 =?us-ascii?Q?B97Fa8BCHhLU7WvQrfpIiZd7uoetXNan0M9Ao9IyBT8RuDu4rHEPeq3qxTYz?=
 =?us-ascii?Q?WVCdNXPMUOw6VGcTDjmQa8f5l/QWSU/R8Rz/75FrmS39uRaI83QYDhtaQKwq?=
 =?us-ascii?Q?Qd/zt4IjNWo0swSdji93p/i7JSsycmW4dRiWakPhEVUXqG4h41KY/VjNcDEC?=
 =?us-ascii?Q?ym+UApCOHWALDJSQQBYJpKyehker+762M3KsYu8N/ZFo8wdVf5KDmKb0Bv/G?=
 =?us-ascii?Q?DHnZ6KMnzPPAMdh+DLsqv2zkeu4b70OdK6/RCTEg0bn1GTFMfNC3iCPMd4qI?=
 =?us-ascii?Q?L9Rso7Gd7Y07QwmlUFB+drqaGTxXuP/JWTu4ndAEuIRBcyESeCtYrMSXw7ng?=
 =?us-ascii?Q?fOjCQfdtm9VaPsjbnhCSWo7LlDTJXbcSg00vw2IR2OstnTEoMVABBDCUZiOW?=
 =?us-ascii?Q?0q1CgizZimnmC/QT2FKAr/0nJswb6muQeobEf9Az8wX8D3uFaHhOcIHUOCjO?=
 =?us-ascii?Q?w3BAIJII1cdatYpWRha/xkKVLtKuozOSVP8pomKSgLClQRQ1GKTxzk6XRlrQ?=
 =?us-ascii?Q?ymK3B55BKoIhR/QA6eZWH2eQ6IfenMpF+KCX0c8xAf6qVsKLl2EOH1ydhyDB?=
 =?us-ascii?Q?4E7KXnSqj+3yHnAjcqkYdWhEWtqzh59fc3kD7Ysb4yz4n+Xd1U64+H+gSkMS?=
 =?us-ascii?Q?pyUpoOeCi/t4oz0NFWLKDZ+KDxbn74Mamzk/xZHBdO+saTMLQNiOx5GfkGBd?=
 =?us-ascii?Q?SHyg+5O95g=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	jsFXrqtrB8O3hLFSiMZ7EO26SSk5WzX4BFXg5JUwIB59WW0A9IqjfAulqqJDIL1l4uyXHGUTi6yfK0oVtCGSIPFQpHvhTWZGCAxjGbMAefVWdRKz5nIZMdD8CcRyLjOWqSPt/mlBrR1VEn4M3F+HBrGlgMQgXRF5hMW5Py8S8HUl1diZXddXiQ34ZJ595sAr2V1HP0moaoropqbEk1ISb0f+4dxbR+y70omOdleOAx76jxdm7dn8BKXJWkPJSqI1qAImWj48PWT6HYaJg0Xva06JEoUOiyKMoyPKiRQE6Eyc0JoCOGardI962jhpCUCx5X9/XwXx7WhIaMWoVwEGe3AWXhOtBaHhWzRwC20j2JIFQO+4Oc9sLJGL73zGnL4Tj9z3L5n7ZTmnScHYly2QeRlUkeK4IbD6x/fwxBFQzO23tqlEFisVj5jFuwvDmpcZccnv6t8Um+qK78jh0oZXxucQl2Oh2n+LrG4BiT9QYvX78rgVVmV7vkZ2cBy2OlelPdCJn+0Gu2asTX+N3dxFogZdPlt/4ffgMaEQlyB+RE0Wusd43VzkcKZXNVlUfJeeouQbfCH160XEdMT+SZrrL8Y7twM5/qfyzTdfnkWLBVs=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91953b1f-0ce7-4a4a-87bd-08de68e55815
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB7522.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 20:45:37.0070
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CsaH+dYhZkGCGMVDUDpVZfqVSveBDCCJV33JyKrhYTzh7zifl3HL7frSn6vBhlQoLnykeZwYvi3tqXgPAm5h4HRE9EDBI4+W494tr7PK5fc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB5097
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-10_03,2026-02-10_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 adultscore=0
 mlxlogscore=999 malwarescore=0 phishscore=0 suspectscore=0 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2601150000 definitions=main-2602100172
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEwMDE3MiBTYWx0ZWRfXxoXBujCFBilb
 /DcSDVYeKzir01sVkhszBV9q2FbuHzBnmxdf7PyQB+v0yufoCv1YXUP+3LVriVHsKteFaNIfA26
 Est+eVLPh1h9/dVcYoa/zaS4smrzveIStKxHfRp9mDCU2R/LpVbjq5MS7u3++PR1o+Y/YouwA+5
 S8tvtW+NQ8FL3+W2XXWdhNjAsp5yZv5Mg02SYIHjbSju4slSBMIs7Iyny8SXl21BrvEu086zYKF
 Cb8HXxuTbolGIFf5WmI3hOK8G7Ke46MVkEs8wg/YkGFeTCAh+F03+SHvCC3YR/cOVLevc0kqxgH
 nMc2kRlpKFQLRMBu1Zg8BOHCGOG+oAceYQXy6MW2A+vfu8H5JvFEgrmOYXJJ1HSOqRxhFi5Iwpk
 LU4aOxvGddEhVBJJD8PFDjUOTF5stxaPMUHTV1L+wq0c3mrrhbiBRrAH3AR9mUI6jfiCrmvGfSU
 SeSRkpsMgL/DdDbA/iw==
X-Proofpoint-GUID: tXWfYrlZ13F34JaQkIEcypgnkEHkCE7s
X-Authority-Analysis: v=2.4 cv=Mehhep/f c=1 sm=1 tr=0 ts=698b98ff cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=yPCof4ZbAAAA:8
 a=JrYVi1yn5T0_F3HHEI8A:9 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: tXWfYrlZ13F34JaQkIEcypgnkEHkCE7s

On Tue, Feb 10, 2026 at 03:16:36PM -0500, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

> ---
>  NEWS | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/NEWS b/NEWS
> index bd20932a0..9c62e523b 100644
> --- a/NEWS
> +++ b/NEWS
> @@ -39,17 +39,17 @@ Testsuite changes:
>  
>  Documentation changes:
>  
> -- Add the DTrace Tutorial to the git repo and install package.
> + - Add the DTrace Tutorial to the git repo and install package.
>  
> -- Clean up formatting.
> + - Clean up formatting.
>  
> -- Add missing documentation:  trunc(), stapsdt, usdt.h include path.
> + - Add missing documentation:  trunc(), stapsdt, usdt.h include path.
>  
> -- Update sections: unimplemented functions, sdt provider.
> + - Update sections: unimplemented functions, sdt provider.
>  
> -- Update LLM context files to forbid "if" statements.
> + - Update LLM context files to forbid "if" statements.
>  
> -- Update README.md for RPM info.
> + - Update README.md for RPM info.
>  
>  Build-time:
>  
> -- 
> 2.47.3
> 
