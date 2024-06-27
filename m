Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 020A21A702
	for <dtrace@lists.linux.dev>; Thu, 27 Jun 2024 05:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719466530; cv=fail; b=GRIdIX8OGQnnjn0i7WZa4uOJw/2jSR02hqBPU2Pfk8zsG3UPyGIycIDtY2HyF+XBFYXLNyRfmxyqpPwTxKa3XAdtsgIVUGsczVpRhVywn1oNOafXwPuojFrO5FiGqHsCuN4ZfFaMDttgdj4C7y3g5g6BWkj7CTWZ+Y5RsqhAF5M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719466530; c=relaxed/simple;
	bh=Vt83BE2ywLHDg5lp7p7yJrldKFZXBeDufww0RYAxvj8=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=nmHeg4UpQVW6pIor15kCJoAR1/5MoJK1umu4Hhb46SyAfovj4NMyVKWX2hku5vzI8XYgO4orN3kbZKnne9IYLH+U8xpL1oMNk8d1LPkzbWEwfLOFoJz6inCAyEax8WHqAi8sVa92X/cLGI6uXhL5bZYBTb2mSsuzrquqs2aXvzA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=hh4YcAJ8; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=FffGUwb0; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="hh4YcAJ8";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="FffGUwb0"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45QLMVRu010618
	for <dtrace@lists.linux.dev>; Thu, 27 Jun 2024 05:35:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:subject:date:message-id:in-reply-to:references
	:content-type:mime-version; s=corp-2023-11-20; bh=JIhak1k/G9M5L3
	9HV4Z0bPz9PJXJvldEu5W9KDFMalQ=; b=hh4YcAJ8/1Judf3dROli6d2V+MBXY7
	S9XUeKhs39DuIkfbiaCLxxmfxhFWjGNAQYNPkk/HfGBGB22BVnGfqgtRf6MeR1uq
	y6PYRzRcDqO33Q9VHhgwmDs0oZUHNG6x4PnV0C3xM5GMQdR71/qV7HGBO+jEknem
	calh7vfMAidVtWa0+bLVavL5MPMXX11CgibzB2fxxMX9gnHwH2mi4lYgsaIOC5Za
	/ATcxcU/VWwWeMTMnUXJA5xq+lohmlKqudn6QaqrajjcqNmO85Z5CQO0Ku1WB3OD
	aTTmSYVEN16WGzf2fURFXHioJBg5vDaADDqrBuvc8fwKVFS6QWKhiiDA==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3ywn1d4r4k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 27 Jun 2024 05:35:27 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 45R3v8So023309
	for <dtrace@lists.linux.dev>; Thu, 27 Jun 2024 05:35:27 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2101.outbound.protection.outlook.com [104.47.58.101])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3ywn2gev0b-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 27 Jun 2024 05:35:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ROvTPDV2WvNsJlR/jBujG6FlfpM9euA77k5E5dpWajr6zZ0JKheEnLa2U0uYw8fOC6JfYjVt0DIG8K8Vi26OPsEHggYWp+1Le3QG579QrxhDEz6JfuBTrBX0s9i1ZMYmJmzxP7wUXjJI8q1qndhOpLivWlnlpqtoidnPjIonBr6IStLe76gkJsqUpgCME6SRelpVcM46yXq/Pz5Od7E9fRa7tFh3epX6tPItZTyv/1POfyzIbOGo/H5JTsWXkCe8bVWxRENr5nPP00N/5wZNhcqqXEZburobw/AewN48E2CjiJILUyMr6kLMqOTqpSxZZ3bMkr1Ok8JECeXStP/ZLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JIhak1k/G9M5L39HV4Z0bPz9PJXJvldEu5W9KDFMalQ=;
 b=Oo5/ku6qIBks3e+fPUWAZYigm2QhmWnPK7hitT7tRPUnLxjmS1bCoCZmbt5V8+cDGJiw9ujxAvG+lfNNk0K6matwHYM/AiZJECtiuCWfoBlXMI1O7WNNdG8YcjqO899kpDT93gSWqzA5Ih/dECQuPAOe+9+1yIMbbeBovY7OxusST2kzbV6Xgv7B+tDePI8dMNpdmK2/ckC295RUQjNSOhqTINWQKJhhxP70JSxqA74yjY1T8cHYyB5j10sYwZMptKbjAUXSahsjugwGyLZU9FHTOYI9wLPm4h8uL/jc+A215A6hBwg2cokQEbKf7PQqDMe/wDLyvA2E6fNa+7rG3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JIhak1k/G9M5L39HV4Z0bPz9PJXJvldEu5W9KDFMalQ=;
 b=FffGUwb0Wb2VSuWRSevv8bLqXex4IlUlSbJqFEL6C9u8UnkwoOdRdoEHrXYCr8hSzSnxaToNIC4ry3AwUUqdZwg/9HP5/jooGBwmNvJuSY1j5GD+GvxCFzVoyCVk2tLAvfginFDVlKlDW3u0unPVWDzi64DruESSHUmIr2vWYPQ=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by DS0PR10MB7400.namprd10.prod.outlook.com (2603:10b6:8:138::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.32; Thu, 27 Jun
 2024 05:35:24 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%4]) with mapi id 15.20.7698.025; Thu, 27 Jun 2024
 05:35:24 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 09/38] Fix comments that hardwire DBUF_ offsets
Date: Thu, 27 Jun 2024 01:34:26 -0400
Message-Id: <20240627053455.21567-10-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20240627053455.21567-1-eugene.loh@oracle.com>
References: <20240627053455.21567-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: BY5PR03CA0029.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::39) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|DS0PR10MB7400:EE_
X-MS-Office365-Filtering-Correlation-Id: 385a4617-55fa-41d9-f1a2-08dc966af14f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?T+U7VS8US+ZWZdVwgFkkASwxG3enHjzY2QjrnxFv69tig08AjdMm3CsSrnZI?=
 =?us-ascii?Q?GmvJNBhaDbeF8c6TaTmFQitpbVGsUjS3P/DAOB/GwhfQKbGXAkzSRnXrU1Gn?=
 =?us-ascii?Q?VzqFpW2P5pPdWdjq8f1Aoa3X8rzZnu0uZ2xoTZMbZy8IZeCzz3oT7qCNW+Zv?=
 =?us-ascii?Q?8Gb9QT5yzQHWy+BQi+e8V5CdeJp/uAupmR9WPtPgcQnMm3ca6OgUxOzLY4KE?=
 =?us-ascii?Q?JUmZ5Ult5AK21zNet92Dd1+gUE/+Ejg07dHSVCAgemC81T7OxoMQHh3pojGp?=
 =?us-ascii?Q?CdONaF4fyEymLYlkJ3Ga1ex1kqZsUIlTrY3MJfacSIAuW3rJq/vv0wRhfanx?=
 =?us-ascii?Q?GBF3MLH6KQjFewWLGBfxEz7BJt6CWVlRqpe1Fz4qzwJ2G6RIHURch02OSou0?=
 =?us-ascii?Q?WlRX36U6rWiyPpob+JRrEBExqXJyq2TqjFonDGak/ENLMcpmypSUknwfaQWR?=
 =?us-ascii?Q?gAJbJF6u6GFJvpC5i996/97HPNqiLSDzyy+mjlPGn/eX25T0v4tWSmwNl/tg?=
 =?us-ascii?Q?apN8a5gXJitWsMhxBGBY7MvxevB4g5y/SDLndPEVHc0XgFJMUDEBD0TqiVyZ?=
 =?us-ascii?Q?k0npf9mmb2a2Vm8HenrDnGFP8jGkGRAov12Eg8fdOZbxVIJaQB/hTHIlx0IB?=
 =?us-ascii?Q?1QskiDz+cpwpIqkjJf6wqp3FCDzpMK1husDjeFQ0IyX6s3klsB7ozkVFiat0?=
 =?us-ascii?Q?JFdQ1RoVRB6d+o5pWQxy5hnr2oZ1tx1WsphVMh8GXoaK5y3whbo2vQJx11av?=
 =?us-ascii?Q?IBXF8seoOYpOFXIMTnmsmPHKwtL20vkDxyR7rWnkw3MHQEapTaQjeKcn4KX5?=
 =?us-ascii?Q?h3/jUtf8tCdJe19N48l9kAQeu0USS9rqLW7rwOJzG6evImkgOjKYpI0+cZWR?=
 =?us-ascii?Q?4i7eaw1ywBbot3PQu5uEZbLcz+ZxWMkuRDj+J54NKEn3rXlP0WvKmXhduSqZ?=
 =?us-ascii?Q?gAJua7VlASs8AgIkptFX0R9Wyii5Lb4h7MbOQG8nSYQMg7r+Ud/h/IqbTR4a?=
 =?us-ascii?Q?GbYaIFrgaF10F/ju0BOKkYDCuYckUTadew0TQebou1IfsWcwLD5OHG0szb2r?=
 =?us-ascii?Q?SCEW2ri84rmP/JHiiSR8vhFtevplW/bRar/8W+srDFvjAnwQu4IZcr+YGzeQ?=
 =?us-ascii?Q?3deP2CJJ7wYwLOh4A/MzEbMcSKIXnuEZSRFja2SozTBSrhzW2ynj2M7i98yu?=
 =?us-ascii?Q?1BLF9vByAFNqwXT02/UUXB9yJAkkR3WBvJ9EN6wqXeu/VCJfL+ApoYIbZRQc?=
 =?us-ascii?Q?Wku98W5yyYLJpWbUsEmRnn9JsZJZN5sIll7PnBBO2QPJaAsl5xLWR3xH3Jxz?=
 =?us-ascii?Q?8q986+uUCNBm2zPuYOf9VsLu/ekzmDqliHPbqA6oSvtJqA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?s2svGh9gw7hlPvh96wu7wJKBVWZr3WJGqcjaXsc4P46VMW6GbtBth0tbB/LV?=
 =?us-ascii?Q?hfHkDT5fp16kPVafBVVI6TvdVhRcXQT3g85cIrrKtA8hZoFvIjpPrz3zYMmU?=
 =?us-ascii?Q?VZnMjwbeCv5QlGrHgCg6nrRkYoM+VXdjODI9ITRyrab4w1LlHrktLqX86SR0?=
 =?us-ascii?Q?eEIOJzfGZqbSnk0dIdh7arAId3u5etqKDAMrkPvQ+dvKrZ93SxUYUecamZ4u?=
 =?us-ascii?Q?ZgYFcMlZUcV1jZ2a9sMLAfqNxz1cr+ePhOhwPu/G3JmD3eP0jAsupvNBbPdu?=
 =?us-ascii?Q?Io6KN2E5IrItVr451VqiNvkRydRPy+Wtb8ipogG8VWcXSXhqKzXXJAB1BFYo?=
 =?us-ascii?Q?n6+KYsP1SAECgXi28CqZcheti8HdyMJw6NaTlDow+fNt5Ta0EqL3eLmInxYT?=
 =?us-ascii?Q?8CIY1aFoJW4e/55Te6rgKQDq36s/VlraQMTrdFjbO+ZE3P/Wi5Vekt/DB4VG?=
 =?us-ascii?Q?ZXQMIGgoara7jswqdwTgZUythqeb8guCUO76UN7Rt4M3hXZ65twYeC1I4cj4?=
 =?us-ascii?Q?TQC0bpUFvYGV0WpZhrqqetqVzJ95fi6mho8jYf94jJTGfvbdeXeVUU9XScY8?=
 =?us-ascii?Q?Uh0xgZ57M55Dh41CqCBMoTMqNnm1/hkyWzR/ScxW480ETEjGP1KfptCJd8+d?=
 =?us-ascii?Q?6yMDWpyz0g28SXSLD6c+NggVHJasMhg9EqSmgNBvUX4024QgzhKLKlOOpnE5?=
 =?us-ascii?Q?pMssfSgApGfcgrNUGE1q27J3e93XyIx9jmz8lubWJylptASnW2eC+uHEtubm?=
 =?us-ascii?Q?jgsPsM9pQJWpdFuecI+KmT3DDuw7eGfPHSQPGN3agDrNcB201mbLJ2EY5kbt?=
 =?us-ascii?Q?NyWsc1px0il12ppoHmnrpHlv7doBxUsHkUhVuK1fk0HLePiZwoFVw046dbjv?=
 =?us-ascii?Q?jWNONTToHi4gyGDTTBLmhaF8hnXEmsyRG7NHEiKFT+/Nch0juu5Ke9h2erL6?=
 =?us-ascii?Q?UIfTSVWJue6Z1H2F7Kd/N8EQSg0rnv0OFULipxkbXO3O4Wor8OFm6L5HtLLO?=
 =?us-ascii?Q?Sc4hcJ5Jjl33jen1nQVR7Y7+6hi1unCsbtWAVRwpjI+g5aygmvOnn6Fjr8an?=
 =?us-ascii?Q?DjHircUFL12LuDDGSZCm8JOxCTE/sHZhE7Hm3Tu97EjD8J8qBr9Y0GqW8WZ4?=
 =?us-ascii?Q?IihZQ5s+qIn+Az+u7QMR7sXigx9vnX0/Kq1DiJEhg913pBYld5cqlARkcAel?=
 =?us-ascii?Q?m8gXku3pyNTnmSMNvKP06r+xIFNzyP1TQn5bWMCodNlPUMmT/X7mtlppBZ+W?=
 =?us-ascii?Q?RXr83AxFbSG1lM/xrh3l1GBJ2k43gI5Fg4njghxt3yUG3uY7iC7YpcoIefOt?=
 =?us-ascii?Q?xLqhlJI/ESrl4xrGuE0O4jlAXNR7OEWrMyXsv61lpW+ikNRlr4rL0ZLYMGbr?=
 =?us-ascii?Q?KxUvGpmSz0Bg68lz+yL105mP55NmtpxSZHGQzpEoGnTPx3f4u/7gle5Qd4HX?=
 =?us-ascii?Q?LOQniYbuUR6ns+edZJHvo5+huzzmkz0fr0z/OREgSO3uk90s4bxtgqJSkdtz?=
 =?us-ascii?Q?NWsg5aVzSmcR2yqfGRKYBQFNJfSxFMxuY01+253tpIStZnuliIHYkI7WkLfa?=
 =?us-ascii?Q?SyvbgIdm35kLliVSJaH/fxJz9w+q4dN2StY27ul9?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	6Jy0Kh6lnVAcRzsUEhOEB22pW7emAuH51VhIFT7jXqsuywfaqizQVnGnuervamODgwkN8rImc1afYinmZpz1fktuOCPBiuZ8gyZix1FuepbLHK188zx2kNkCip1WzgB0O70HNJrYAFA7ZGP6ScsX1N2yQbgznRQ78PWLTa134lUygqIbHV2Tbr/v/f9dnkzLq7mwBKju8uwWhHzaFh0feB6JnDBJ42/lIpXyE9G4T6wgAQtOCFfgP8Jx5vOeX5SAgNvQRihBVbuWPsMsQZuzr16+nV0V6yrzjna0B3gxh3LMOqBT4LR10tnCyFXgtsO75L1Af6dtUdBLOlcQoSKctJfc0BmYKo9Sn/WfarDnrlepDw+FYqtxLSnU7A+pQluRWQAnUeneQ7HXdf0vIs6cIFi7gKssFt6CVQKzHVd6zMQA0k5kwmQqO1yBp1Xr6nf6jWW+l3ExmZg4igaVGPik5zP3x/yR7WDVoNAPIdDqgWBSD0Jh9ls6uM9TGQl5JOPqJBPhkBtn11X9vNkGZDaJv2ACA1w8WTlLVoI8lRPdNuDiGmnOSZXVKtAHFUbfvgDEHbm77I8jFqmzH4PVQHYZqrUWIQl7wXyWd+WqlZMhACo=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 385a4617-55fa-41d9-f1a2-08dc966af14f
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2024 05:35:24.0286
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +BzfrQMg7HeBANJRh12NXnynsywM4EQluvFntJxi9fJ4IlAkQNCnRBgX0p6LI1m3RqnSlfGoIJQAKNyvI2YFkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7400
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-27_02,2024-06-25_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 bulkscore=0 suspectscore=0
 phishscore=0 adultscore=0 malwarescore=0 mlxscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2406180000
 definitions=main-2406270040
X-Proofpoint-GUID: yzP6EigjJaa98QBOWl2Z71xwolSJvblg
X-Proofpoint-ORIG-GUID: yzP6EigjJaa98QBOWl2Z71xwolSJvblg

From: Eugene Loh <eugene.loh@oracle.com>

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 libdtrace/dt_cg.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/libdtrace/dt_cg.c b/libdtrace/dt_cg.c
index e166d2d8..0977406a 100644
--- a/libdtrace/dt_cg.c
+++ b/libdtrace/dt_cg.c
@@ -1057,8 +1057,8 @@ dt_cg_tramp_error(dt_pcb_t *pcb)
  *
  *	1. Store the base pointer to the output data buffer in %r9.
  *	2. Initialize the machine state (dctx->mst).
- *	3. Store the epid at [%r9 + 0].
- *	4. Store 0 to indicate no active speculation at [%r9 + 4].
+ *	3. Store the epid at [%r9 + DBUF_EPID].
+ *	4. Store 0 to indicate no active speculation at [%r9 + DBUF_SPECID].
  *	5. Evaluate the predicate expression and return if false.
  *
  * The dt_program() function will always return 0.
-- 
2.18.4

