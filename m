Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FEC9287250
	for <dtrace@lists.linux.dev>; Tue, 26 Aug 2025 17:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756230043; cv=fail; b=UlFtkz4Qw+P6OLyC0dX3R3KHvsSJ6BuTNeiyK+PyA4XI6xjMLbcQdR4SLfRUpWv75rJnEFVpCFGZCaMh75bvJ7nt13rB+ROHeNTp1MDnqofLBnCcTMrvucr5KuIhJw9MY8BKaklGgHVvMqcNYQZF9If5PEj5tC2EJjVq9Rc6hPM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756230043; c=relaxed/simple;
	bh=76DPB6IBAxglqbiY+1edKxpngYJYJkmDGyD3yFNyRes=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	 Content-Type:MIME-Version; b=U3TWQQjez1poRKmoo6G3fjmQFUabPX4Qm/XLUxwNnOYEJE65uf3p4a/2VmV3IttwX5hU1HDYXgOOTWGbK8DL2jnBKC2EAWKxVYQuHx1DloJlynQYcvmrPcRhZDGd2Qpy3t8aFB74BlyNmSedpO1lu6eo837TSdIELLaW5vGrcnI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=CvdY9UiV; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=LZlSRsVI; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="CvdY9UiV";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="LZlSRsVI"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57QGfsDk017665
	for <dtrace@lists.linux.dev>; Tue, 26 Aug 2025 17:40:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=ozXIppYklNlIiMYUzD
	Db00mGtl7ITMpyNOsoG+NoxHs=; b=CvdY9UiV/vbA5BuKveOYp3qA/eRd8tKlzs
	1b9qET65G4F/kOcIL8Yk0wXGA9vMbjg0Z+hL+0NEEVInp60+IBiO59b4LV1zH1ZO
	AeRPDd06wBmu7u3nnlTqvTRSLl3x87nbi1k3np/YwJVXfqsL4UdQGfB/jM6XULTO
	O3+dVa14ukoYnUSCF+wtFO4sppGpJ4DyO3VqC9s+0EsskQWZPxEOKoN/YD5kfnz9
	qhzyuwuYurscKWf12RCiRvWf7HwLUZSrWEAhNrHtsdouGGHC0MYKRPZtVbb+PDRY
	jyx7ju+y47+CvYVKgnm3u31TtRtJxBbJ2DAL6fwh7Bti+f9Qoupg==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48q678w0t0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 26 Aug 2025 17:40:40 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 57QH0OtN026710
	for <dtrace@lists.linux.dev>; Tue, 26 Aug 2025 17:40:39 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10on2069.outbound.protection.outlook.com [40.107.94.69])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 48q439re65-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 26 Aug 2025 17:40:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n+/kYDrRAmp5+2//ho3Knh3Q87HnhrNdYc8PnXvNwPxk28UKgFLSD9mn+YGvpZitgZSVlAQDZEul0TS8cELuQjiXW5zludouEreYVgkhnQ7XdlvwckJVxTiEFBhf8u1qYJgANLNxQcdRTIcDfeWdTPAKYC50l9IGu+vNB2ADyLsnHkvUcXJ3txULiTAaQb/pd92PWkazULP3DPFQhmsEmoVSDhFsXuG8syvQkMhi4VbgPCe5A9/jqa4M6kO6r4tVPdNXUzhHvTmaQTs7lWa+1HSWJNw0WUEx/Nx35pNhBG4f22fASdtjSpyeX7by6+hPuBCHT2YqmEftlbdscSrnig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ozXIppYklNlIiMYUzDDb00mGtl7ITMpyNOsoG+NoxHs=;
 b=QYbQk/emsji28Mar1VsX0Pqio5mkI4uWE+FXpAawZtM0vPatXREteKrNBQStClVmhobwDvFLMzMq6PPihM7qd+z5tCMnh74Jzv9vcQ2NKDAiZPUiaDLNU4WMSlxHucHypgnuoOn/YFCuhMTc6xjm5BA+fbHQYoqxSDhUyV8pnKn3pC+Yd2fzxQbsG5elQlnp+b6MqSEqwscQnrBSRs/DZcD7jS3kHl9DPDBZMT5GjpTAZYqjeM63AkF0SDt9+4kvFShoCoOYGIjypAEgWRjO7FOhjp6AIbbkfxm2+g96ip+FtXtzsNuww6zr5B1VFcUAHbNzk62k9D7EKTjJuS8Axw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ozXIppYklNlIiMYUzDDb00mGtl7ITMpyNOsoG+NoxHs=;
 b=LZlSRsVIngQc95unmDcOO/APN4V22P5oSqtbYwF4jCi6dEj5VJa3Yy3L/28Zw97OjY4ft4roAkOUAG00acuUQqAlOv0vQLufuvB3dDvU9W12OD5iHdROFsXiQ91AYbxDh2mgSKALSWAadf0OYRxLJKGpZJEkQk9qEkCBGOoSOaE=
Received: from PH3PPFA3184E4F2.namprd10.prod.outlook.com
 (2603:10b6:518:1::7bb) by PH7PR10MB6404.namprd10.prod.outlook.com
 (2603:10b6:510:1ae::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.20; Tue, 26 Aug
 2025 17:40:36 +0000
Received: from PH3PPFA3184E4F2.namprd10.prod.outlook.com
 ([fe80::815c:d94d:29c8:ecb3]) by PH3PPFA3184E4F2.namprd10.prod.outlook.com
 ([fe80::815c:d94d:29c8:ecb3%8]) with mapi id 15.20.9052.019; Tue, 26 Aug 2025
 17:40:36 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: Alan Maguire <alan.maguire@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com,
        Eugene Loh
 <eugene.loh@oracle.com>
Subject: Re: [PATCH] cg: fix offset for > 8 bit bitfields in
 dt_cg_ctf_offsetof()
References: <20250826081226.591245-1-alan.maguire@oracle.com>
Emacs: ed  ::  20-megaton hydrogen bomb : firecracker
Date: Tue, 26 Aug 2025 18:40:33 +0100
In-Reply-To: <20250826081226.591245-1-alan.maguire@oracle.com> (Alan Maguire's
	message of "Tue, 26 Aug 2025 09:12:26 +0100")
Message-ID: <87frdegewe.fsf@esperi.org.uk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.3 (gnu/linux)
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0488.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1ab::7) To PH3PPFA3184E4F2.namprd10.prod.outlook.com
 (2603:10b6:518:1::7bb)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH3PPFA3184E4F2:EE_|PH7PR10MB6404:EE_
X-MS-Office365-Filtering-Correlation-Id: 409daa7a-e1cc-4022-ac11-08dde4c7a9ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|10070799003|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?WznS7PdQxAgG/PYA3cFwevQgxQHGlnNdv5zgwULBRwVYsmhZ4SB93xy6XZB/?=
 =?us-ascii?Q?py01Y+b/imlVTK36xyuFLpDUexiuxuMTnGunWQ2QikRgU1n3tbzxxhhugw7d?=
 =?us-ascii?Q?9frfNbDegh934Unuknz0QuY2pttXZLw+//eagbQr1DKHXrW8fIugTA30HI7h?=
 =?us-ascii?Q?NFpoDxX4eQwtWhUEpZYZtvpwP8pyM+jb5wok5ahlSZ0KVDvJl+u7SOzL4lhH?=
 =?us-ascii?Q?Mc6MswicCNdpWwY1scSMNMYA+KncmT9WK8uMwu9wzU/JPPS1/LFmfrrBu7r8?=
 =?us-ascii?Q?9hUq3A+zyJt5IY5LcrmtMy58QFaVT2qm5beGYhG+HJRkHQK2QEA+Bkf68fym?=
 =?us-ascii?Q?//MT5ov0PEQhPX/uAuwL4145fSeByZpH5i6ek1U4xuZPfpN3XXAc2amN426j?=
 =?us-ascii?Q?R+iEBinuNvRFqF/fVb975F6nfE6fL5DnY+U+l/46R/ZdJLkTynXqqguyBL+w?=
 =?us-ascii?Q?yYdzrOdX7Fi3tn0TRErtds/Ir8sqnxib1nALhhN/2gxkNFY8PCik/aJDcxn+?=
 =?us-ascii?Q?rrULctlasnFvDfVPWRBhqsihFM/I+PfKkD/2onSGM7nlVrcVaXo3G+qPu9uu?=
 =?us-ascii?Q?EoPxC2GcJBlDg+eWAG14XvRImRLGmx14Jp8DCYSxMJysbwlzLq+nnZ5Wv5IO?=
 =?us-ascii?Q?hQJp3RRpon5tV19vTeXAC57Oh6agjSkIVHHg8qVoI9TSg5UIfwCH9o66Mgv7?=
 =?us-ascii?Q?QGOceENzrXbHsVccvBUlxzIHJvISYv5ERvvJl+XjfAnLJOOMrRVUFPRrTxN+?=
 =?us-ascii?Q?6flPqvC2y1Kbeu2VrEpiIIv41gwRd1m/CE8hW8yhWXonfW86GkPZ+6mMdITD?=
 =?us-ascii?Q?L+0CtSzfqZ/oCW2QG9XrpTF6uD8Cy7ofE0ZYMscFtbBdCHyaxHQ3fxD+sd1J?=
 =?us-ascii?Q?dnF6mUjfCvET3EWzzm79F7CiwSfg3FuS4gbmdYp9UslxwL/xeqKXBYvIDBsf?=
 =?us-ascii?Q?l0t1Z31462nuG7y0vBPb297F0eGy+hmXMmkLsQWmnMrnqZ5EzIApwSz6By3/?=
 =?us-ascii?Q?WFj4/w7zSTYQd10G4rhdofvJXZlKvcdjRxgYvwMVQj3v03MaovKyalViUIRv?=
 =?us-ascii?Q?N2XqFr3aC3msLqmMIXMYvlA8LuGYxTCdW48nJBdRYfQlRWAEZPHLyvoViQry?=
 =?us-ascii?Q?fEbhljALyCnWTmSu6fN4LEShfQo83IV2UfDW6YZj0lDs3tlObDbtLjhiP6KS?=
 =?us-ascii?Q?IKNQewZ+kqdj3Sxd+O6RUL1sWU/AzFesRVJ5Yua5UtH7J8s7CBgGtHmb9kfK?=
 =?us-ascii?Q?grGy31bj5cQoOtDoIpGPMiqLBKsmYPxfb88gniylHzqqZXn80khj6cd7GLOW?=
 =?us-ascii?Q?ANHXwkgq6gQhG2Q6YUMcdu7i1LseqKZQk/fcXIIWuV33JwKQKIvS9ZG54krE?=
 =?us-ascii?Q?r1sojX7OOlUKPqzHfQCmBpc2EtSZC+VRNFfXirHYMR2zrRMqAQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH3PPFA3184E4F2.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(10070799003)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?AXk/LEozdfHsnYnn87aFmlvnJyhhvJyk1i3rUpLgNgjEt5TseQLG+dMEDvic?=
 =?us-ascii?Q?n0b0C380W8vt5oFD1NcZ06jwY8cIaUKAbMWoBX3qKMaR+KzItf1Tnyr3f7qX?=
 =?us-ascii?Q?NOqAoIqO4vO1nGWSPyCh3WAdihrCPRCulfZa/IrLc9GQUSMSWIRgTvEmcKe9?=
 =?us-ascii?Q?Jh71LWS+ZR/Ivbs7HmU5+J1bD3FIYnfsNsHRGHSGKr3XcbTjF9Z5tOHBueW4?=
 =?us-ascii?Q?5fBsr50wiaZZezspAk+zclVB2a6ZoB7pyGMqgNmZsWZfjDQx0abDXbRHjksq?=
 =?us-ascii?Q?7Cyhptqyxq4WpTaJg0Z98JSzdDEoHfRAZryO2ynOfOafUTLohxqPHAo1HgBI?=
 =?us-ascii?Q?k9CQFPZLwCIeDZeU+hqcZH/F4Z3OWGsyLUV0Wf52/ukWHPZRysDAzHuf4a8f?=
 =?us-ascii?Q?F5e5elEjopKv+xG1sPeBpeIw64c2KwN0YoSGM10mRDDxG66MqqgNiPZGestY?=
 =?us-ascii?Q?izLP4iFj1Ks3BdnspGLjbz/ed3DWNbBxIRmBYy9lOFFEdXmiD8B/CbeY9Jpy?=
 =?us-ascii?Q?gjzNRn99uevNUouqHIJTWW06UwzpsCdWJE2Jt2xO2IBISM01RqDWMqZ1znbc?=
 =?us-ascii?Q?Qo8ty5lV98h+iIxdKPHwd5YZnUGYFRaPr7/AsKDVJ4J+N3DTGirUBKDMgMC5?=
 =?us-ascii?Q?3TXtv53PV1Ri8LdBSRSbl/nV3/+wVyD+y+vSvcLsMAI2fsF/E9SMV/DeR+J1?=
 =?us-ascii?Q?iOnRk3UvaNrleiCWjnMWKysslAJeuSTSvmfdwg3/hsM4sjxSIIKBxpTy+T5m?=
 =?us-ascii?Q?N0TLGu0zqjK3GLia9nz7f5SlhcCDRjBwfUWIh0uhSQx/hXL2GtJJJio0cxdm?=
 =?us-ascii?Q?57M/Ea2RN6QQ0eKQBka11Ew9Y77/UM9fE3vTyTinK6zeXKw3OG4XP07NwNgH?=
 =?us-ascii?Q?hXnxVWK2Unjkm0Itux6LW3mufKPGXBSmC2kcAsmwb3yfQ0ZpqNHg6Jnkh7h4?=
 =?us-ascii?Q?vQcCc2LRHuCpkhHcUY/UZ1dwAk+NcXFjZAkaRx2/8UVZKRSuthbrR6t5dWHU?=
 =?us-ascii?Q?tFry9aaBIB+MdNM52ZBHMUH1TvUCSHSPJxKQp6wJvx0I3eGQD9DYmgXAAziU?=
 =?us-ascii?Q?VPJGmB+NaUFJJW7zg0ZyflvHhZQkuf0E71hLsdo2JGpiNkjE3+gHyOtUztgl?=
 =?us-ascii?Q?CVGshI7Nfh+EOsBrOVD6MjGiESZQCAcilsU9OwvOo0TC1GmC64wZl6yQ4fQJ?=
 =?us-ascii?Q?aovyfWdDocO6fRK4Mfya7ji18xqoov0nJn6m2f3tnGuCg3I6Gt6nBayPQvqa?=
 =?us-ascii?Q?13HkC3xYv70JOiJs2y5QvgV6yKN/Gkiupd9eg8nOx2oRgMmNVdLBbIz+eJUE?=
 =?us-ascii?Q?PRvYevPSB5pDaZb+R2tN3W0OeuU3YFZ0phLqymtO7RlawT9beUkIJscYFR/6?=
 =?us-ascii?Q?fah8PgbKdamTaNLgtABdPhSkQLjm123Y9z5t+ve4ewbxgLF6T2RG2cMEwwwh?=
 =?us-ascii?Q?vpAmAFuw4Z/DT78jRHOoiFRqa0Vkuo1uZHUctBdiIAntiBsuJ3ij3/lXL7/S?=
 =?us-ascii?Q?FVcWxYt3aGEvPPeIXXlEA1go2mjaZrQHzq4c3ZKPi1nLkUk53m7R79CmbRD3?=
 =?us-ascii?Q?pIBssbP5N/BT3o5AoTJaEFpMXyOFs9aqjDRqkyAQCa+GYCxs9lj/vX5Nh6M/?=
 =?us-ascii?Q?jA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	RBUY9hSAp6N+BjFFSxgtQRhUesHwdDsyobT/zcf8jF9pmjI6Pz4eq3IXmQk8sEm53Cm07in0SxDzqH4skkPyIFjTW4HyiHHtwr1d0QMf2lNmYcPQ1Y3Dcq6P0Ahm0DMHr9oe/BxrrPRmX5ZKLYNRgE2UblVKaRwbXbeMMagrgJAVXnyKDzhsu/m04d8cibRz5+9usOfWgy9x4cpPk7VHeReypDTTrSqXlRGSvZYYT5viQIYjEjmXLwoxvG3Pjp7c+KxAuvZLrgnwPnF+QFu1Zf9V26AJLqGzmtk+trss281zM5d+XRlkpuW6iPTdtdnY3mT6IXHTa8Q3q1GrsXTPKcTmUALfIxjgDLvz0v75cpnTMn5UXSGurqlaZCxZM2So2Cp+jUAzwgMYyZ/FDLD0Rl/y3Giq0EMwxrPEuZCmjJ82dWU/2uVbOckj7H5Ok6lsk0DD3iwNxVz9fdN/qSua6JXpQuUjp9FVxN1EBGcNFuHjLNmd1d4yHTPU0rUN7dHdoLfFbabZjYPS3J6NIQQN1QW1bGNqS6x1fUnbsoi09aHMv6cxALX1w6q6hPw5wIAX7X6GTrvju8FtVxRpWRyuTwEvaB1mGsh4Un+iQujDcew=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 409daa7a-e1cc-4022-ac11-08dde4c7a9ef
X-MS-Exchange-CrossTenant-AuthSource: PH3PPFA3184E4F2.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2025 17:40:35.9724
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KbV+A7UBBO0BdqUpcmu531UQpNggXYmQ0/+LS+TchYsj+uoIVJp1Ucm1vVEzXy6yw9SbXSpm+zTmbhDZll33aQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6404
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-26_02,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 bulkscore=0 malwarescore=0
 adultscore=0 phishscore=0 suspectscore=0 mlxlogscore=713 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2508110000
 definitions=main-2508260155
X-Proofpoint-GUID: JuoRNyasVLnFCdjrNYUjkzseXdeVwZH0
X-Proofpoint-ORIG-GUID: JuoRNyasVLnFCdjrNYUjkzseXdeVwZH0
X-Authority-Analysis: v=2.4 cv=NrLRc9dJ c=1 sm=1 tr=0 ts=68adf198 cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=2OwXVqhp2XgA:10
 a=GoEa3M9JfhUA:10 a=3E-oB-c6KiO5lmiqcC8A:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzNSBTYWx0ZWRfX1K7gZqhlS6wN
 ZNGU+e+p+VkdvtvoU1D6FYOZqKZoM2YfyzkwakJ2taknPBZftQ8/nrIATpXfHMZVcuRJeFRxuhQ
 HeahSWkWZcdzdTlD8AZzmpm2vfztmNXUM1/w87ez7HVH5B8uDxexEh3k0WGaR4pFnQ86yd6fHW8
 ZQoTsiZYyNdUKLzcl+ELzJhzSznx8ZgqskhF4gZGG1I2vz10GWaBlVF2k9KJ8YXpVhIELcj7b5n
 4mtXkTQnsl3lByGEJGHhHp7RnpAnyhvF8XOJuPdcgKdTyzvX5XOT0sRmeJnt6g+yPEwkaGKCUxJ
 CB7ydBbcfU/u1Pih8apORb1uJuKsDD+DZS022yIR8UyjzsRogH8uBT0LEz/iJJOIkGNQx3QM7nh
 37UU9psf

On 26 Aug 2025, Alan Maguire verbalised:

> The tcp provider uses dt_cg_tramp_get_member() to retrieve the
> offset of the sk_protocol field in struct sock.  However it
> returns the wrong value on UEK6 since it is an 8-bit bitfield.
> From pahole we see:
>
> 	unsigned int               __sk_flags_offset[0]; /*   560     0 */
> 	unsigned int               sk_padding:1;         /*   560: 0  4 */
> 	unsigned int               sk_kern_sock:1;       /*   560: 1  4 */
> 	unsigned int               sk_no_check_tx:1;     /*   560: 2  4 */
> 	unsigned int               sk_no_check_rx:1;     /*   560: 3  4 */
> 	unsigned int               sk_userlocks:4;       /*   560: 4  4 */
> 	unsigned int               sk_protocol:8;        /*   560: 8  4 */
>
> In other words it is really at offset 561 but because we just
> lookup the member offset and not the member type offset we get the
> wrong value for the sk_protoocol.

Excellent description! It's annoying as hell that BTF still has this
redundant representation :( DTrace literally always got this wrong,
right back to the year dot.

> The fix is to look up the member _type_ offset and add it to the
> bit offset we get for the member itself.  With this in place the
> state-change probes fire, but the local tcp tests still fail due
> to separate issues with the tcp:::accept-established probe.

This is certainly necessary (and your code looks good), but we also need
to ensure that the load is suitably shifted and masked, particularly for
bitfields that cross machine words. DTrace never used to do this
either... e.g. the size returned by dt_cg_ldsize() assumes that the
entire bitfield can be read in one load op, which depending on its
offset may not be true.

It looks like dt_cg_field_get might get this *mostly* right (once you
delete the #if 0'ed stuff -- but I'd be suspicious until I'd tested it
on a big-endian platform), but even that assumes it only needs to do one
load. As soon as a bitfield crosses machine words, I suspect we'll only
get the first half of it :( we might need to do a second load to fetch
the second half of the bitfield, then a shift and | to combine the two,
and DTrace has never had any code for that.
