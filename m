Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A820618D643
	for <dtrace@lists.linux.dev>; Thu, 17 Jul 2025 18:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752776197; cv=fail; b=EmR7pyp+sE1jNdsdRRBYqE6+SzwS8n0vZZjQaAD1rVcmnWxdubyRtvKPr/OXmlvbHXZc4S80H5OwEIX1jpv6V/rGGpBwCG9R1SzIeKmhtRB+2ckH4bb5o6TRn2WhEnfQkz/1dNNs0PJLe4C2TTIjRELaaIAuj6uqCIIPHR/rPHs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752776197; c=relaxed/simple;
	bh=Zx+B1oD1MxMfjMOg2/Eo7zrvM4kl35KLHNxZLJoga9Q=;
	h=Date:From:To:Subject:Content-Type:Message-ID:MIME-Version; b=euO0vjbdsJUbP5rdnTLPb9SUhcXjGNio/kOeGvFOke6U3qg9tloU7ozA7HSWIyObdbZ5HXrj5rB8YJZkvC/Vrk7gIeIr2a8xv0SumHugGFsSKT0qGKpLItH4XhMljjXYqAave0OXbxwkixiW8oN2jqx0YzHlbjGPms7mgmVxCe4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=haFwSZ1c; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Rip1luun; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="haFwSZ1c";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Rip1luun"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56HH0iFn027536
	for <dtrace@lists.linux.dev>; Thu, 17 Jul 2025 18:16:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=4ujrLr73udLpo5qFBaUQX5XAKYRyyDe3XzqoojJCwec=; b=
	haFwSZ1chtszGuAonqs3zGXGhEELZ/kdMAqJfM4Pa/6iTyA4R3r9z0zcEDhjVsQ1
	/laRVG3MZMetVEf4BoC7EsaFU8/NwCzf6vmtyoLDFdpxEt37LEPfHmyfPfza+cXr
	NwvCv0TmvGBqhi6fYSYWZMHyDknjqJYs3ZgggGW5ILtWnJwbb346R6oqvhX787/O
	a1q21w4UEUfR031Phepv4XoBDrOYcuU3pvK4mebFXGBNSET9Xqil22v6MhjpRR1G
	3TjRC5Lg9Zf3bFJKJOpfOOU8d0gq29kHaM9zJ2r87eYsP/RktW9sQxCw11EoawRr
	Z+9MXn6s01/jzUfGiLJ+jQ==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47uk1b3r3j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 17 Jul 2025 18:16:34 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 56HGc1Eh039724
	for <dtrace@lists.linux.dev>; Thu, 17 Jul 2025 18:16:33 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04on2069.outbound.protection.outlook.com [40.107.101.69])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 47ue5d50cn-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 17 Jul 2025 18:16:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GYFwoIYGBGqisVs51l5UGYqEEoX/+yvlTQ0zD0hKmS9Wx5Hm45jdpKAxuN+4uDfqgawN5Y0Ot1teoqT6YJJf96Vr6tqC85srizv0W+KSaMUvWQYO2pa1OG8vzW7HpTi7TmFq7N4zTxfWiZB+J7ZJCiJtA4q5BS+jDO9YXhXqnIDtT7YorUSSGJqPdDDnoh6NSAjvSVInGJFMcZRn3VNY7EK1d0gK5gVNfFgRj9VMQuFa+lZGxV2JdZ1kSZ+Vtv7tV0DgRrVyDcogS1S/x0L5zfXaxjQIDPFxh/LKVwQafNx+98Ax3P0daMiqG/POdJ1Ghfk1IfYU+Gw09GgzezIffg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4ujrLr73udLpo5qFBaUQX5XAKYRyyDe3XzqoojJCwec=;
 b=RBjTDAYojE1PPguO30msZIDkDpDbwcwQPYFYTlz2BXgaJi6knKvP2+0IYidMr/XViXfVwuip2tSbzA1DSEhOdVO3+gbpvF/4aWnQ1z1LV7Lf1oFRum23MFuAcibj0GI7BuH91m4IHjqXzTdiTvrGJF/1+1n4chCn4K+2+NpaFPKdh3HtYLPkXbgjP633rPjmy4gI/3Gc4c+AKW9UGjL3IEP2i2nHoacDs3gsgzP1fcwDWvFMx3a2riE+rAeQxYi19yvUHUmWIvOVVC2La6FQzOXG2btste9NrNEN7U+GIihj8UgEYTHKgqiht3ljf+kXrHwq5830f7vhJaye999Fdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4ujrLr73udLpo5qFBaUQX5XAKYRyyDe3XzqoojJCwec=;
 b=Rip1luunXO/KeDSt8R68fMjESP7yA/M1Ml1UYKz51fVKWlG+kSAhOb8EVHOB+Gpx/AV30MqUwM3dOI64ev88f12AjqPhRTYQYYT/rHeea5fK9Co8GZ3Y1tTeLnnK4N7Ypi0lJfG2ZYfBMwOpExGHyZEoj3GOsG9k3c03UNqlkOI=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by IA3PR10MB8590.namprd10.prod.outlook.com (2603:10b6:208:57b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.25; Thu, 17 Jul
 2025 18:16:29 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%6]) with mapi id 15.20.8922.028; Thu, 17 Jul 2025
 18:16:29 +0000
Date: Thu, 17 Jul 2025 14:16:27 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH] tstring: fix leaks
Content-Type: text/plain
X-ClientProxiedBy: BLAPR05CA0022.namprd05.prod.outlook.com
 (2603:10b6:208:36e::27) To SJ0PR10MB5672.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::21)
Message-ID:
 <SJ0PR10MB567251942D6CE4D38E71903DC251A@SJ0PR10MB5672.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|IA3PR10MB8590:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ef2d7fa-e9cf-4819-544e-08ddc55e0cec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?9yhVeOS8j7LXWIusA4AbwrSS9B7YjcexouWyH/R00BfO0+qGiKIKMOGalcHx?=
 =?us-ascii?Q?QLqKMt5DEdOfMyY5Pi+axeIpv+Ci/DrgkJl6D2xb246VrV1jUhX5oQgzdqV5?=
 =?us-ascii?Q?QivIEyhtcOhoCqYbUA+budGEQYDGBgtPCjiEULtjqzZTSQGg+9zcxXqZUoIz?=
 =?us-ascii?Q?yZt+G04ye5IPRENJm7a9j5qTHt2p0adUIQhYo8OPBsctiix7yovKPKoyyUzM?=
 =?us-ascii?Q?wCSXipqpU+qFfwa3NcYUJDqouGiGxSQOmhjhUWef1TMxs60yZllfSZ9mqVO7?=
 =?us-ascii?Q?3NiYdVZo+shTKO+CRbpaeNSS/KJk3mE+1u6rD1TY6mq8AgGBLYM490g33Xxp?=
 =?us-ascii?Q?/R6rhLyHTkrR2BngtDu5fhajMdmfJEQhd2i6lZI/ugn8RXGjZwLdbWVtNYYB?=
 =?us-ascii?Q?q5zUZdD9v4v4kiZcN298E9cWCa0BX9d9tIQaMEhStTHIa1JU9BkkfGAWC2Y8?=
 =?us-ascii?Q?5q4wv13YGjRism50Q9gW+7XVDZRYAUaoVdDdpezOlmlc+6nRezzMlFOYE5L0?=
 =?us-ascii?Q?MnHbYMSrLdFcWnewpK/1P5JKjjb4uR6+WCYjpa9Fjpmb2+lOV7ViEuQm/X2F?=
 =?us-ascii?Q?IHCa+BKxaFnvYOAOM4USpatR/DcVHiNcO0pIlM/BHQDkB7QXKj7gTFgX/qRy?=
 =?us-ascii?Q?isCaRQygPL/KF7i9HFrGpBkNlK6K7Crkbytsh7xxsV7AB/Pr0jonOYdOceK2?=
 =?us-ascii?Q?+BvC2mH/AIFi7wh03wvdaT6b4WRTZ8xpnZW/jY5MHMop1maj9srOtNWqxDtD?=
 =?us-ascii?Q?KeTOcIZ6GQdXK3i93hRHoAEdKc/teojfnObYejfvI2nMc8biZ2DXAJ0UxVWb?=
 =?us-ascii?Q?zMqGSKigwruFR0E8q1JvYXHlOM9Ycj1eJcM7NW0WpsU1wIQpTsfu2ZQN1AsU?=
 =?us-ascii?Q?OcV7HXhrXQ0o3AlmTPMfn9GZ2GbKbCMA/+CXyKEXp7WE/NYc/2nV6/eiQuhL?=
 =?us-ascii?Q?pp2pPVVw0u+XR39mdWWXKbeHTG3so7+mrq0xTfl2obagI3MMhnMgtXofDzJQ?=
 =?us-ascii?Q?c8E4AI1vw//EEnM7dswT64TjEUUyU0hw830dK6U7vGrTVINmIc+G8r51JTob?=
 =?us-ascii?Q?Dlv5jmGQf2EA2JuCfahNynt+nCJnXf81aaMO8I7t+oEM2ABkTXqtG8UW90Ym?=
 =?us-ascii?Q?nnk7gwCDJeo1eTj8RQ9ZurOT0n2SUhsQPbPOyU88Bl6QoMj6CmDLERBdkppB?=
 =?us-ascii?Q?spCGyXdONvLoM03qrGfUI5JlXqA7BFNURVbTsivEDFAeUsFwo52WswuCwS78?=
 =?us-ascii?Q?O1GrZuqqtfIIe2ieGawQhjqpo+bZ7++gW47iubGHpNo9AFHgVG/c3iG/JzPo?=
 =?us-ascii?Q?NTG0Sddv5K/jeIFa16b04ECmpgiIbRNkO92lT+iGIEVFN3MJYZtrbzdZIoG2?=
 =?us-ascii?Q?BlbiNfRmtsoBt4NtYMkU8360tOsTit/rM/5UhXpPad5oWpEbkOArxtL3PbRz?=
 =?us-ascii?Q?CpPmdCcIjdA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?lMP3iLF5Evu3CkNfLnxbA2SS7xFTB6hxtroWAbZRXuDj6dA75tvN6OCZxnZZ?=
 =?us-ascii?Q?82XdouIljbB8EjLHA322b99pb1nxTU54Er+lIVXOnUCJIh3JM4cEBZg6LrDl?=
 =?us-ascii?Q?MTc5WfjRxrP90XBea78m7Z/Om2G0yeKcquRf4B0aimtN4wW0vtl+Y6AqJbPI?=
 =?us-ascii?Q?t9DRPmk1Hwaa3eW45ezj1/+PdMVTzyshNGLwadPW0IodpUKEDNmNSEsvif23?=
 =?us-ascii?Q?xHytYUIYR3L77+xZHmUWpdzy3i67+/LePdbWBHb18bTKYgSCBEanPEXj95Ul?=
 =?us-ascii?Q?ejKhva13jLx6FT+h4YX1rfGrQXU2nO452kS5/NHbHQXGfdzqz0z0JgnfrQqB?=
 =?us-ascii?Q?tv77kqPE5i7kwW3NBCPuJcHpQwBaOi/cDIqBLfHyx6/Z3dJW/eVnt0z/CKQp?=
 =?us-ascii?Q?U1kwX1wuYlsYM3KIY1jrSsz+hQV2b5eb+eNirrNjiVq15+8Y/AHfO8/CKWQg?=
 =?us-ascii?Q?WXEkFL+LhrOc9x+0mXuK/VAERxVRhfgBykXzuts0K9RzQ0kvBGKYCKpThRi3?=
 =?us-ascii?Q?SikTXykdAmZ84ABu4FWeqN7PvYMioYqv1ox2fuF+isVPg+XfHWHGwYXUSm5p?=
 =?us-ascii?Q?PYr7RudizwIuzvc/iTM2qHtwuRfGFD1rs9N7MUSP4Q3xRq0C548NjXHUvP2N?=
 =?us-ascii?Q?ugzxFpX84JR3ph4hsMOnT8n1c5aA82gTKcMLkSr3/QwhoWthwWO+VJTZTH3I?=
 =?us-ascii?Q?9HtmhQWACw/19VWbICfKLxjQssOKyBV2+x4P0pFa+nmf3INgvT5jTWCgwhok?=
 =?us-ascii?Q?U9QUOyd+fyrX9fEJgEwTfnKNHJ3kpjcC5TXvQYNEs2I8vJMlWUoPva52v6Mm?=
 =?us-ascii?Q?CRRlJXFIER5Ic2AmCoHacb4yxUUROR89xW40Tc0MN97m1SbKxtK1FfXh3ENM?=
 =?us-ascii?Q?gAOPVSqtvoXEXvk3c1PwEd3iG3YdPh+hlyESkVh/KCTwPcnNb3R/Sjalt6is?=
 =?us-ascii?Q?RJ+UgAKPvrc5BXdbuRyVwR3Nr6Rpd45+v7udMOEaF0PL08I2Vrjq2EvT6k2u?=
 =?us-ascii?Q?rpyRz0r0aKEfGkrcth8KbSix/GQcwqpPCKA9rxdMzTzLn1fkiogZosklAWwU?=
 =?us-ascii?Q?b8avBtb1Sa2PjlVtDAYxxAN3HYDCS7zNKTvE5leA17GivvucgcEws0jc5tqs?=
 =?us-ascii?Q?xCXLM3kwjNKSh7ke5yiybB6gsTsqD7daAQbOqm2AIsdmEnTk9uc0nAqldG1u?=
 =?us-ascii?Q?K0akVr3017XtteHzi72+q3EiX6ZCvj8YB74/I1PYiEd6UIpKpDzuQc8cdn5Z?=
 =?us-ascii?Q?e/iRsiNvaP/4xsGvaVp5wPt5onSU9tt9eWAKKW+bbdQmycZtkdxlvXPkrU15?=
 =?us-ascii?Q?a4CV/SDxYIme/OkG2WWX7vPTOv0lzswF6vdzrrWw9EXX0AAI5yJhPOgMFm+t?=
 =?us-ascii?Q?f1xlXeQ0grrVOqwfrXWFYqXcKuiM0Vegb2bweWOhl/vV/U9XEEycweuMeyGc?=
 =?us-ascii?Q?6geV3XWz4wNbctCqr0cujls0fh5FBt2DPt6ivLLq+qW/0h0AaK/FD37CYTc2?=
 =?us-ascii?Q?Eb4ei6EQnzhDP0mUhtSUd61bQ9mpvrcmpy6mRmOVCU2L+PwcTGl6nCaZDXaO?=
 =?us-ascii?Q?N3KA8ZMvJe607VsQ7bEOrJkXJtJKBXnF3/EQHKKcZZf6th8B1IPQfabqW+sC?=
 =?us-ascii?Q?oQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ShzW4v5StW5T2/AmYIGH8AfpVOkog/RcwAIAXt4zudilaJ/tEC7pWBqakggaO7W7s2sffQALVXGn7ul2oVi2R5iPaCCRBN2AyK+k8c58bfpcfVSPS6ehOcFfLDLGQAOfUTGH5y7OXh3YDCk5IZpbX77OcB5a9zYIxIeB/KWSN979er1gaOrnINekU89WudJVf3AwDbITFCG1HkZ5+57kNNaOEGtj1L5LpJWvovzS+e+LewCZP0mtal3ueg3xzfqvsL8TsbDAyE+Go5c4mDcHCU+yYfHzexTosQXpjRQ2SYJznCYHOjrpNO43PbYSoFJme6ITLq30v5seVSmdzZ6jR4zrEjbYoM+7bxdbwq7aFkDtC2wIymRnbn+WMk6oc5FDiyP/s8P7gl0Bli2OvIQoOCeXfXnPH7HxLEzPdXvJaV6x3i0OlF0zCciMjbDmoXlrA3pRadWriNKj5L5D19gGupiyWE1WMPhchyXsijoYZSbq61HwJlWKddqM7ie4ronCQPdYhFHXUX8bxEKsyxUpgu4EMUjHPHpfTPTluacHTL3P001DCFqh/21KrDL4LkkYoriR9rcze8tpc0ERtNXEEBA3CensCjyWYmPsYjNXgjE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ef2d7fa-e9cf-4819-544e-08ddc55e0cec
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2025 18:16:29.1581
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BA/RQdXSMl9QpfzQfydcKmEYUfEu+LEkvLZ+A4bSf0Ya954IyhSGh97IN54YVTX1yQWYXFdgLSdaFlA7I3jEG2sIOFUuuy8QAFlxmlSawb4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB8590
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-17_02,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxscore=0 adultscore=0
 spamscore=0 suspectscore=0 phishscore=0 mlxlogscore=999 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2507170161
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE3MDE2MiBTYWx0ZWRfX5UlP5ykaWHsl C+67/PJKp74TMmOGgAuNVCjXWEqSkrDTci8PAtgwIjbzUXafy2VxPZ5CVpfWH2eIcOXMxoDtuqh dSMWNkblaLdolPeUVkuHKPGh2reSwTUXn6k0yWl4UpH9MrgNfvAYawnQZWu6Le7wvEvTxj7QaZ8
 SRYQwSxry226iHGw8Lw5t9QGUsmRn12MRCzqDB+viLpLj9iPKGso3yxcTGCHo8cjw7nmvBuwFuK 33un7zShbPzenwRQF/MrQKYF5KLKFJCKT/gE1wtWup6LWXVhHbwxw/E4nLcyoYO3MbQmpPx4g4k n9OsGeFcWUkm3TJ+QAkqge4Fmes22vd/XedgfbQqWVgGnC7eZ8U1RKE+b0t3WIMprP8IK3y/ShY
 HXEhEzXldEuRG2/O5fRgfma8/ZUtKcqmNpd0ijaZDs3X1yhH9u+uWFvv1DIRdHHctPwz2fY6
X-Proofpoint-GUID: j4omvisukR1jo9X1svve_yBofpEdfsh2
X-Proofpoint-ORIG-GUID: j4omvisukR1jo9X1svve_yBofpEdfsh2
X-Authority-Analysis: v=2.4 cv=J8mq7BnS c=1 sm=1 tr=0 ts=68793e02 b=1 cx=c_pps a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=eIpBDFkxFqgr1yl1gAYA:9 cc=ntf awl=host:13600

Temporary strings were not being freed in various places.

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 libdtrace/dt_cg.c     | 12 ++++++------
 libdtrace/dt_parser.c |  1 +
 libdtrace/dt_parser.h |  2 +-
 3 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/libdtrace/dt_cg.c b/libdtrace/dt_cg.c
index c3376ee9..1a57686f 100644
--- a/libdtrace/dt_cg.c
+++ b/libdtrace/dt_cg.c
@@ -1515,6 +1515,7 @@ dt_cg_tstring_free(dt_pcb_t *pcb, dt_node_t *dnp)
 	case DT_NODE_OP2:
 	case DT_NODE_OP3:
 	case DT_NODE_DEXPR:
+	case DT_NODE_VAR:
 		if (dnp->dn_tstring) {
 			dt_cg_tstring_xfree(pcb, dnp->dn_tstring->dn_value);
 			dnp->dn_tstring = NULL;
@@ -4969,12 +4970,6 @@ dt_cg_asgn_op(dt_node_t *dnp, dt_irlist_t *dlp, dt_regset_t *drp)
 		idp = dt_ident_resolve(dnp->dn_left->dn_ident);
 
 		dt_cg_store_var(dnp, dlp, drp, idp);
-
-		/*
-		 * Move the (possibly) tstring from dn_right to the op node.
-		 */
-		dnp->dn_tstring = dnp->dn_right->dn_tstring;
-		dnp->dn_right->dn_tstring = NULL;
 	} else {
 		uint_t rbit = dnp->dn_left->dn_flags & DT_NF_REF;
 
@@ -5920,6 +5915,7 @@ dt_cg_subr_bcopy_impl(dt_node_t *dnp, dt_node_t *dst, dt_node_t *src,
 	dt_regset_free(drp, src->dn_reg);
 	dt_regset_free(drp, dst->dn_reg);
 	dt_regset_free(drp, size->dn_reg);
+	dt_cg_tstring_free(yypcb, src);
 
 	TRACE_REGSET("      subr-bcopy-impl:End  ");
 }
@@ -6958,6 +6954,7 @@ dt_cg_node(dt_node_t *dnp, dt_irlist_t *dlp, dt_regset_t *drp)
 		dt_cg_node(dnp->dn_right, dlp, drp);
 		dnp->dn_reg = dnp->dn_right->dn_reg;
 		dt_cg_asgn_op(dnp, dlp, drp);
+		dt_cg_tstring_free(yypcb, dnp->dn_right);
 		break;
 
 	case DT_TOK_ADD_EQ:
@@ -7191,6 +7188,9 @@ dt_cg_node(dt_node_t *dnp, dt_irlist_t *dlp, dt_regset_t *drp)
 		dt_cg_node(dnp->dn_child, dlp, drp);
 		dt_cg_check_notnull(dlp, drp, dnp->dn_child->dn_reg);
 		dnp->dn_reg = dnp->dn_child->dn_reg;
+		/* Move the tstring (if any) to the result. */
+		dnp->dn_tstring = dnp->dn_child->dn_tstring;
+		dnp->dn_child->dn_tstring = NULL;
 		break;
 
 	case DT_TOK_XLATE:
diff --git a/libdtrace/dt_parser.c b/libdtrace/dt_parser.c
index f777a910..7e5bac48 100644
--- a/libdtrace/dt_parser.c
+++ b/libdtrace/dt_parser.c
@@ -1238,6 +1238,7 @@ dt_node_is_tstring(const dt_node_t *dnp)
 	case DT_NODE_OP2:
 	case DT_NODE_OP3:
 	case DT_NODE_DEXPR:
+	case DT_NODE_VAR:
 		return dnp->dn_tstring != NULL;
 	}
 }
diff --git a/libdtrace/dt_parser.h b/libdtrace/dt_parser.h
index ff32a84a..297bf6c9 100644
--- a/libdtrace/dt_parser.h
+++ b/libdtrace/dt_parser.h
@@ -105,7 +105,7 @@ typedef struct dt_node {
 #define	dn_expr		dn_u._nodes._links[2]	/* DT_NODE_OP3, DEXPR */
 #define	dn_aggfun	dn_u._nodes._links[0]	/* DT_NODE_AGG */
 #define	dn_aggtup	dn_u._nodes._links[1]	/* DT_NODE_AGG */
-#define	dn_tstring	dn_u._nodes._links[3]	/* FUNC, OP1, OP2, OP3, DEXPR */
+#define	dn_tstring	dn_u._nodes._links[3]	/* FUNC,OP1,OP2,OP3,DEXPR,VAR */
 #define	dn_pdescs	dn_u._clause._descs	/* DT_NODE_CLAUSE */
 #define	dn_pred		dn_u._clause._pred	/* DT_NODE_CLAUSE */
 #define	dn_acts		dn_u._clause._acts	/* DT_NODE_CLAUSE */
-- 
2.45.2

