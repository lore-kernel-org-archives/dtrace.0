Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F560189B80
	for <dtrace@lists.linux.dev>; Fri, 28 Feb 2025 15:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740757690; cv=fail; b=VS0WAQAeXkkbLQp2r3FBZSO6EXqwgyJ2bqtsC/C9u3SsEprFibNF7Y2wMHBgpCprW684At7W1eEyWzlPWTKZR5wJOCeUnV1M38Q0buhoXC6oCEZntpJ2tMpDByKhyY/fONr4eZu7iqsRnp+psRUUOsxpTERskUl33gHE+LXvxoQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740757690; c=relaxed/simple;
	bh=V1KbSo25wIuIsFn215cGFI8HXqva+OCT7YyrtpBEnLs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=LWlEBUr2mdagMsaw1ONefRGrBcHf/2KzgXOT4mKtHgeofzedpkkEHAfebsIoy/STNVChYlpr15vS60FW97dPLix46P4DkoGLwgc12YMQlZYwDScLyI7okqboJrKEmPjcsvj6lLPygnNP3TVcWcpkSavlfdE6+vfi6znb41FohZY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=KN20/clP; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=qyy4cYEH; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="KN20/clP";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="qyy4cYEH"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51SEHEqA002421
	for <dtrace@lists.linux.dev>; Fri, 28 Feb 2025 15:48:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=kzOJfL5Ga8c0OxnPTm
	CgryZUU9NXYXl1h86WGMnKP1k=; b=KN20/clPCXZ5lJR4MZiaBZl/csA/hhYdug
	2lQ2D4ZMfKW9RpJw0dXfaw+oMmI16YXIdvRSxu8wJIaI6hd0CDMYfVsJrxJWxVl9
	+dngj5HocwpELV/zOGg10c1/HA2EcaH89lDhQpeO1bejmN9FdKD8d2UyfuvP2Cqh
	PW4yN1SChwMRbNcGprrXaB4MZUrjpsoeOBWCakGMBXA1Fzjczil56LImOjH4iCtW
	oGx4Sk6LbHjkJBuxk5HtoXbsAokE4Yy+VahMMZqOXwj7LBhkd5Wv02u764ELvibo
	O3ylOsET42KVasjYWjjunV82kAFNGBoVpzBfeMLnza9Pjcli0UWw==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 451psfwst7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 28 Feb 2025 15:48:07 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 51SFapOU025307
	for <dtrace@lists.linux.dev>; Fri, 28 Feb 2025 15:48:05 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02lp2045.outbound.protection.outlook.com [104.47.51.45])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 44y51mctq8-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 28 Feb 2025 15:48:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o8tQyzhWp/jXIWUu28XQ+Ei6uYQpS2AgGAjC1/T6e7I9vMI4kYSP6Tm85kVAuQo/dH/ECK8lapCzGQsZb6cUZLTsmOxusgoBTFYzJ+1Y/0VxE2OFzaXLoaedZX9Q/bHx40+qxN2MFZyPe3xzGuTXOUPsrLf5b8Vz6Bvvuxx9K+wHII5cwXrKp6pomwiUgnVcm32HDuxRbrXCIWkYvdF0KZqZGxzNenokLbmCV70nkjC7uJz7m8Gam6iGYtkMsy6001q2XCDegVeQEZ9L8AcAucZs0hO4ubmThZr9PelQG4eIXkgkCed4nM+//32UqD4uH4VYt94zGnzFM1VuBqafpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kzOJfL5Ga8c0OxnPTmCgryZUU9NXYXl1h86WGMnKP1k=;
 b=sCHzSdiqVGOpKiP06s/gcrJVK3+uHOTOqkAWsuzW9bL6qSA7Ahp9OMOz6otF0kMfUulSAXgrzsT6T8/rNR3/dVc53ZAhvCW6lN15N4DS4GyFe+BfJLl8u4GhGNhUTySyz3xwak76NQxKevKOMylSO+VPSC0THvyCxfkMsJmM0P42gxXYqLoXIc5RV5QnFXrZ94aXq5Cdnlm4kiL7U+HWYhQM0igy1f7I8Ogblunv0wX8uHPyDf0Ce0e+6FWuUAY3ErCcoWRcmvCTXKfg3WbS3jvVXihUanuLsDms0tjyTqt7R2YGNYamUB4hAawcL6fIbpoQ2hvymXRddZD/KBANtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kzOJfL5Ga8c0OxnPTmCgryZUU9NXYXl1h86WGMnKP1k=;
 b=qyy4cYEHh6DAe1EJTmcLo65qILKlPrY4IrCBj9yFc5zQkvhpkB0Hh94SOwaaAD49xbsjR3gWKtyTmq9TKsQvWy3i7Z5wuzJyzX0W3VvtNK4imNJvuFqvdoQnaCjszvMupP0FvUKuYO49MSe626xwiwQI9c40mRoNdUKRBBm6ZLw=
Received: from PH8PR10MB6337.namprd10.prod.outlook.com (2603:10b6:510:1cc::10)
 by CY8PR10MB7148.namprd10.prod.outlook.com (2603:10b6:930:71::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.22; Fri, 28 Feb
 2025 15:48:02 +0000
Received: from PH8PR10MB6337.namprd10.prod.outlook.com
 ([fe80::5aad:120e:fe7c:ea88]) by PH8PR10MB6337.namprd10.prod.outlook.com
 ([fe80::5aad:120e:fe7c:ea88%6]) with mapi id 15.20.8489.021; Fri, 28 Feb 2025
 15:48:02 +0000
Date: Fri, 28 Feb 2025 10:47:59 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 1/2] test: Allow more variations in expected fbt kernel
 stacks
Message-ID: <Z8Har-1pjmKghDf6@kvh-deb-bpf.us.oracle.com>
References: <20250208232106.27146-1-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250208232106.27146-1-eugene.loh@oracle.com>
X-ClientProxiedBy: SJ0PR03CA0238.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::33) To PH8PR10MB6337.namprd10.prod.outlook.com
 (2603:10b6:510:1cc::10)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR10MB6337:EE_|CY8PR10MB7148:EE_
X-MS-Office365-Filtering-Correlation-Id: a210dbf2-6ccd-407e-c326-08dd580f4874
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?9iOr2TjaVU/yGXxcreH1vvBnwvB9X+n7fDgaG+CkUDADTSgjSp7e2M7vH7np?=
 =?us-ascii?Q?17sQRbGYQfK9vHCBLyfkgAMuZszpXzoSL1bDqkoq/gEyi0TR6tKUr7T9fn7s?=
 =?us-ascii?Q?YCjyCSN3u7wrsyMaVBYVd7jmg7Eyju+bb2fl0VBtErewRoS8Lmjo5oYOGxNZ?=
 =?us-ascii?Q?tgYqG+LOapm6sjquudOZTTUz1bOjD/4J+r/6EUx/2Nzn+moJ340aRRqZeinw?=
 =?us-ascii?Q?4b9GkFIbhYh1/QzILP2GlW+mxkbe3XqlxyVd6HAWaUQBUrBSWuxjBcR/h4FR?=
 =?us-ascii?Q?Et0SJ4242hrSf9gwf7aTxK46c7XbCN+kwawBHaAhs1oeO/yGwjLDVk0gvvqI?=
 =?us-ascii?Q?JIHezQ5BmFBnql3DLMhxBwGSA9NFKQl8RU0D8xPFENqA4X4v1B2482dhEJi9?=
 =?us-ascii?Q?h6BRxWwHUlQqa0mxCq/So+Ekhuqw3Wf19Th56P/CAAGE5r14r6xtFyMOMx6b?=
 =?us-ascii?Q?aYR3cdVcWwpid1NiJyTMBr9DSIMW/CyeDpB37bPSQbxhJvzLGP9/UopoAQDN?=
 =?us-ascii?Q?I8dxbFNvgnvaSlhYIoX7CaaxknmR43dGCM6uSz3wlJVlriS3wzvu7gY1NstP?=
 =?us-ascii?Q?ItcKXqZaUQgocadEMSj8tHOVp2m/wOlzrLPY2ATdzP64gbuepEvN4eV8C1sV?=
 =?us-ascii?Q?hTNpHX07jTvtC5WlFdfnAPr4H5QdZVx0ERo6+WH7zXtJWecnVVw7V33dxfC4?=
 =?us-ascii?Q?6pKOmjV8iNSHxonZIuHwHfzeveJeiMf1L3aaWsWw6UcKI/sKxJLtiKJEv3ra?=
 =?us-ascii?Q?TRBpuZwD10u20BpanuU/dxypSyCy/4ztndktGINi8mlMYB/gva7hbXsK5mPu?=
 =?us-ascii?Q?t5w36o4LiNeWY/yyrOkciItf+yXuJCqPDfpxhZ2ce2kLOKa+AEp33p8d6TWi?=
 =?us-ascii?Q?rzaQY4PRErPNwuDBxc8UqIlrnHFsskyvaw6+OWDkUFWZTc0aiBj+4Cv6cArS?=
 =?us-ascii?Q?xvMbmB10Ol26s7AmzjPisC+psqXgXRMTza4OK7tSdzV1AKFoHRn7wdfIBAl/?=
 =?us-ascii?Q?FD8WCAW1a9znXcXK7Z+qErJVwywoOyaFCCAY/SJCBHDFHUjXsKIYD6wsRO7o?=
 =?us-ascii?Q?mvE1F4lshwJQLFSrBrZeT+SLw+N3VqPYRMQQuQl5f2pT1fOIs9sRlTVhQhvW?=
 =?us-ascii?Q?s/jrIywShoFzqv/ESQ8gU676AH5J3XBXeSMmGOtvafp10pFnInDiUnfg6M6q?=
 =?us-ascii?Q?dStXCQpXPzxta960Y0s3JsoVOEUu3fKK96uQjKtw6n4Eowej7kUHP0kVUkzf?=
 =?us-ascii?Q?5u6EnYdvTpBed4xj1kQZRdxf7IhOnQ6k1lUZjoZLxUC/0f70RSwOAAzxt4NE?=
 =?us-ascii?Q?X0Ieq5PrArCkPhSFDiG8n81soFuymaQr6QSIK9TYRUUJ0phTzNeY7tLJV8Wx?=
 =?us-ascii?Q?Pa27nRn5ogvDcBlPOWCwmA2KOVgx?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR10MB6337.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?zLCBWyoC/t4Bkz0mSn3NYCYd5p4QWCQkEhTWqLZM6oOn+ar99i7QfROG1397?=
 =?us-ascii?Q?RlNRn1iG00zp5iGA+HoA8kuqgBuS/2MFb/xTGv3cZXHlcpi8+LuGYZy93w/M?=
 =?us-ascii?Q?Emxu5SyWciRB3kSk0S1W2T/odaIdbckJDMHOQk8POhXmQO4DgJav7zHYmq9l?=
 =?us-ascii?Q?FcpQilO3SQOH0LmNa5QuKnTm5z7gOvDWSbQcVt6BLqK4Ufv63nYUYEbC/XTg?=
 =?us-ascii?Q?udQaQWTYZYO0bf1t8omQEO4WSXK80DhUPhSZ+LwFRCjaZfOiWGX51TI6rKgX?=
 =?us-ascii?Q?JHhI+G2Svm+9es60bx3AEHxSnBWZBr+qUfqwjXwLzzAhS7rTNpiu/BrrPsqQ?=
 =?us-ascii?Q?LdMzrZGcsgoVodqXY3kUuln1N3KD705zSMg3LXqSAoCBLKyBGruxTGcQIRU+?=
 =?us-ascii?Q?lbJe8XOkpvFB1VWgygz3cEgrcNNdmsBsCb0iwNemUh1Uqbhm2k7dv2zZbRPn?=
 =?us-ascii?Q?2fYgR39ygxzqm7RCaK99hQA/iiElFljBPAPhQyJZXLgrT5WdaA0A7el/9lcQ?=
 =?us-ascii?Q?n3YwvK0xu34BlqCZRVuHHfZiHR1ASR3EGK8bF0PhkJYbHg8bTRv99DUjEQN6?=
 =?us-ascii?Q?xyfv+mjbWYRUhnqNS6allXFjhIF2ehI7ULU3ZmPyiNZjJNPRtQZpolDtgcEu?=
 =?us-ascii?Q?JcyEwPQLrjJNH6IFEYnmgAyXjD5xymu3+Jqik35YrdgGfohcRxDho+gHWJUh?=
 =?us-ascii?Q?OqNyfdYdANOa/VXIg1euPt1DONFSM8F1R/yx6x3hpRRO9YmQ2F6B5U/TD58p?=
 =?us-ascii?Q?Z//dKehCbXR9MUnaxXpHOums3T8RlUyIZmsJ1JAkEUCwd3xnqXDE9zSpPiw7?=
 =?us-ascii?Q?2o1bm/jObnxqU0SjakXP7xLatYGn2r0x3QyPbau6I61q5P70ceHgRw3iwGWM?=
 =?us-ascii?Q?3G6lP9mRPYIN5QSmb+67t3vOxGePBLT1DTD5Dd0lr6wlL48dUxqICdhn1MRA?=
 =?us-ascii?Q?s1CjCon9r+81skRlUa/UWAxEKhNPgTOxEpmRroaV7KpFfIOEONUnFmn0URMK?=
 =?us-ascii?Q?xc/4+XkrovsMqrASwPM+235/lEl2Uh+0Bxdr8XliZzGV29dv2VDmR0v7pZP2?=
 =?us-ascii?Q?f4Dy1F9N7xzg27oHkzHXy795FkVO+zStethaK3UzxV3S9MPZGEEsu0Tjoj7V?=
 =?us-ascii?Q?KTNGciifCtPvtONeUaEsvzRv5cqgO8k0d9h9oSajLy9MNJyaIiDJtjkYVf7f?=
 =?us-ascii?Q?890PBhQVMvbrKsJSGpSSELelzBgd7AcHTzXXx7unQA08hOLrUDF0ecmuQRng?=
 =?us-ascii?Q?fwvH6bhPFSTdRY6A1u9YwDD0m6jzZXiq2jLaHE4S3XiWfVZAiOeVnXvNt6LU?=
 =?us-ascii?Q?QhsUTHukbzxHGCdOHkGw8Jg4BTHToP9QJlt2pnepxncOe8KmaF1hgqZj+8sf?=
 =?us-ascii?Q?4oZ87HU397wVRIT4Gt3VC7IeX687oxeBuGn3CslR0ErKMsSpq274fRlm9gOD?=
 =?us-ascii?Q?3YNJ05XHCXlLhwWkqUWEt5GMMy//hR98rE8S0aFfEfZKgAu0owN1VczqGTX8?=
 =?us-ascii?Q?Da19I6tOe4anzz0kNWi91OePkVIYUYwtJQsdlLDBjQgzPu3UTHySNwD6f7ti?=
 =?us-ascii?Q?g+aUo6fQvVYo/2e5eocXx8D0WhdwPJYhUXDis4LRC1IztyAEYpk7uw1QXclt?=
 =?us-ascii?Q?9A=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	wBKCOXGMAP5plmeyeYdcdKvXI4CaZj5RX3gkP+3w6q7IJ30K8M+0tyPVXUcjJOBnz6wyufSD3v9M/sh50SXKu7kcKw7p99KdWz6uFKrN8Ztmq2bhb0beOxATUL8rtRFeUaVDqjjymJQ4qQaP4jbJaRvJpQGSQM0lULZDRFrJwEmWcu3HPsptO/rZbsZY+LcfQ81U61rRYp8CCsmT4FFUFyitqCfHSoy8K1gRqHU0QA/v7wgFbHdg8/lDJApHM1BMWSlyvwz9ptGMFoJ5f+KiT6JILxCxyaPCUIz/x47a5E7MJcTcWIFqzcASoPHuwF4/CAd/pk+z+fsfMpJ4Ibu3WhJC8X/Bf/vAF9o/nQ57G11Ase0gYwEIbNqvHeQPVc+PmsLBZDR+1Mx47WqXX2baTfJruPLUOmEWE3tDg60IcCZx+7FqwKvmO756IaUX7uBYrP+3E8uXjrxLZ4WbYqHOGbwmnYHbG1oDj+HFS9aEpMgJJo37wlBFkYh8sutEPrGPKh2ZYKfV7sE3bJmM9kDf8lFGGc3G/EW5o5qFmOvgibnIr7+u9qeth0Ok7pM4Ram+vn11cN6l4V/aaPW4C01dOgA4Ud51LeyiVyjIsWxBOkw=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a210dbf2-6ccd-407e-c326-08dd580f4874
X-MS-Exchange-CrossTenant-AuthSource: PH8PR10MB6337.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2025 15:48:02.3310
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VsZucj0SkloLTpJbwc10k0amHRQb+p6G8adXGLKU3fdrMH+BO8IkAT+M9P9GEdlxbm5TtcuP4cjyOBrIkOGTJcH5cHQSqDMMVnLUgbjGlGE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB7148
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-28_04,2025-02-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 spamscore=0 mlxlogscore=999
 phishscore=0 mlxscore=0 suspectscore=0 adultscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502100000
 definitions=main-2502280115
X-Proofpoint-ORIG-GUID: rNDumSs4da-zW6dPp_ngPzZjafTT48o8
X-Proofpoint-GUID: rNDumSs4da-zW6dPp_ngPzZjafTT48o8

On Sat, Feb 08, 2025 at 06:21:05PM -0500, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> This test checks the call stack upon entry to vfs_write().
> Unfortunately, these checks require some maintenance since the call
> stack can vary -- slightly or greatly -- depending on processor or
> kernel.  There is a competition between ease of test maintenance and
> strictness of correctness checks.
> 
> Adapt post processing of output to allow new variations in stacks
> seen in UEK 8 (currently Linux 6.12).
> 
> Orabug: 37459289
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

> ---
>  test/unittest/stack/tst.stack_fbt.sh | 15 ++++++++++++---
>  1 file changed, 12 insertions(+), 3 deletions(-)
> 
> diff --git a/test/unittest/stack/tst.stack_fbt.sh b/test/unittest/stack/tst.stack_fbt.sh
> index c365e14d6..8a0b7999c 100755
> --- a/test/unittest/stack/tst.stack_fbt.sh
> +++ b/test/unittest/stack/tst.stack_fbt.sh
> @@ -37,9 +37,18 @@ if [ $? -ne 0 ]; then
>  	exit 1
>  fi
>  
> -# Strip out blank lines and pointer values.
> -
> -awk 'NF != 0 { sub(/+0x[0-9a-f]*$/, "+{ptr}"); print }' dtrace.out > dtrace.post
> +# Strip out
> +# - blank lines
> +# - "constprop"
> +# - "isra"
> +# - "_after_hwframe"    (x86 starting with UEK8)
> +# - pointer values
> +
> +awk 'NF != 0 { sub("\\.constprop\\.[0-9]", "");
> +               sub("\\.isra\\.[0-9]", "");
> +               sub("_after_hwframe\\+", "+");
> +               sub(/+0x[0-9a-f]*$/, "+{ptr}");
> +               print }' dtrace.out > dtrace.post
>  if [ $? -ne 0 ]; then
>  	echo ERROR: awk failed
>  	cat dtrace.out
> -- 
> 2.43.5
> 
