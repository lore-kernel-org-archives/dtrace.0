Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88FA11A0BD6
	for <dtrace@lists.linux.dev>; Thu, 24 Oct 2024 11:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729769918; cv=fail; b=Qqx9K33ReFdoTOJznb14thNKRB9u9vOe+Duo/eJyop4B9Vm8lfgvFyU/PrlR9NBf1306Ijw23EeBvwESq/Oe8+Y0+I0qrcQK9y1QPUcVp40zC8gFYbrHuSe6KcvmQW6WyDhaq+ebjB14XASJ5Bi3h3C1mdwU1QkTdgkufvLzbjU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729769918; c=relaxed/simple;
	bh=22Pisu9Z2gzK0wfQQO34vVZ7HZ1LAy79OMCfP1x7fdA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=bYfGqA657F5HVr35UqPDgC5weo/QVwd4UDClewwoc0CQxk5xa4XpKlMiOS/6XsfiaLeTd1MMA4xbZG8x0rZkShJ156+16/n9oJw5dH7WCeLGf9fdjrNC8qu7a8sPRDdI0Cvizm9KhQmdAkw5j+R6qOzG9bOfenPpuEv7iQOR71I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=mWsX1Ma4; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=HVsbysw9; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="mWsX1Ma4";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="HVsbysw9"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49O2frrt012074;
	Thu, 24 Oct 2024 11:38:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=oiOp0HwYOQVaZw5rVQM8YxywITgqXnaWUukEJhJmUlE=; b=
	mWsX1Ma4QrjJnuqEEYhNpx8OTgKvEvMj6jX1kRYamo0C5FaL1+Y3tM2msNyjgSyz
	GfZhik6i+T/MbHtNh8OXb+riV427QD81Vd7X7LOtZ49651x76TMPz+L0TtXyVJFf
	jk2fP1XNOnW/hVqJAWDe9iu8rMp3uboTLk6s/JjBCYGWEZXUBJrSxdY36vdTeQVF
	c2Ly+dMviG4EIIfZITjZNJBHiBMPXvgkmUisvTgborr6Ktx7cJgHCl0JVRzvYy6s
	Vf4eUH3Iq0ouHID1UslfTdLGE36ug9lBA8gvZ2je/atBRVfgZ7RVtUPCserLvnnv
	Xuc3GSnuomGQm+sizkysJw==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42c53utba5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 24 Oct 2024 11:38:35 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49OB8t8H030951;
	Thu, 24 Oct 2024 11:38:34 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2047.outbound.protection.outlook.com [104.47.55.47])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 42emh2tbb2-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 24 Oct 2024 11:38:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qOWaVesIC2JOAfEkMig6D3uE2yaUBoisheWF9Z5hONkdiV4stDeVsuf3OpkJRCTjjIIpa34Lf3gYFI/YYV0lXwcL5kjJp5CNrkXkn4qjFMmq6kum02vZtJ3ySnzu537KXghCGi0gIrCZW4WNjyTJsWs7aCLnyWkEuVeCiWVTLEo5+6StlJnbs4j2f3CnLd24rO0ZAD4XlwaXrIzJOKyJ0JIrjxpmZyaf9PpYKi1pamVhuqBJEojP6nbjnJK1KIRaT8GIPp+IB/z7i0QE1GX3tvkf3nMnLtOV3HvzJoO08s6JglBhhVaP8oEuNJHCK4y4UXh+ZD08JwZBU3beYmNSUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oiOp0HwYOQVaZw5rVQM8YxywITgqXnaWUukEJhJmUlE=;
 b=FGnTpHwDGuqfjb5tnOJ2Ph1gFfD8p9jm8CXgKptcS1SoVqo2x25kGAWBMe5d2+Olpg5NoeQciqPX298uPNN/1EsORXOytkiI046F4sAzXO/TD/Vg1eV2c4XHSLaEeol/CmYh0JSh4j3l0sDQVcqHLF6u+KPRsoPWBynwJDJpT5zVixA8o6PVeUHbZ9jtqKrTunL9u5OpnOA4nhM06r5e4JCOcHaqtNlWrX3lhiPGluncf+S0bonlIAToh5J9E2xJ9O2CA0oDasGMdTFnGX+A9ebjRrmD6vn1Ra8yhePNfyZRSdeu9kQHI/f46TpJFUMua+wYFPBW8vYszKnzfTgLcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oiOp0HwYOQVaZw5rVQM8YxywITgqXnaWUukEJhJmUlE=;
 b=HVsbysw9iaiHFFbjcYuKk+ke9xklDvUg3Aq7jLLdzng6C7nPJVZQK5dAeyX/dvq818MXfzlZivLvE8h5t3psoCip1mMzRNKsw5A4yhiyrQYoznbWSrr7H9/idA5BKwKyiPBR2pzwbsv8LcrlNVGXoRVBQYhb0M2lh/FZ6ud2eE0=
Received: from MN2PR10MB4093.namprd10.prod.outlook.com (2603:10b6:208:114::25)
 by CH3PR10MB7986.namprd10.prod.outlook.com (2603:10b6:610:1cc::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.16; Thu, 24 Oct
 2024 11:38:20 +0000
Received: from MN2PR10MB4093.namprd10.prod.outlook.com
 ([fe80::d72e:fa5c:c426:b4b]) by MN2PR10MB4093.namprd10.prod.outlook.com
 ([fe80::d72e:fa5c:c426:b4b%4]) with mapi id 15.20.8069.027; Thu, 24 Oct 2024
 11:38:19 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Cc: sam@gentoo.org
Subject: [PATCH 09/14] man: drop blank lines
Date: Thu, 24 Oct 2024 12:37:53 +0100
Message-ID: <20241024113758.182050-10-nick.alcock@oracle.com>
X-Mailer: git-send-email 2.46.0.278.g36e3a12567
In-Reply-To: <20241024113758.182050-1-nick.alcock@oracle.com>
References: <20241024113758.182050-1-nick.alcock@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO3P123CA0005.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:ba::10) To MN2PR10MB4093.namprd10.prod.outlook.com
 (2603:10b6:208:114::25)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR10MB4093:EE_|CH3PR10MB7986:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a976e69-f648-4cbd-0914-08dcf4205bdf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|10070799003|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?7raSDF6VjneUpGqDGBjelF1JFDp3XyOI4yF7uiqnN7xj9ZCdmaMQiJMXeqIy?=
 =?us-ascii?Q?EmeUFsu5pIzmnjL7kw+VQk1O93qSAmFUTj6sUWcXe4r5ZasuAHamJXA/sJqg?=
 =?us-ascii?Q?7/vHK1jaqUaquApURzrB1ZVIH7UuXVcrC+kR/KLmFT+hFkhNrY1mPVjTDvcF?=
 =?us-ascii?Q?U8AW5p3Vdn355Buk8IVUYwQvJpfcQnSqjpp/YYW2/J5PsxQ9RAahSFTftCcL?=
 =?us-ascii?Q?YVePTT8kodNB0Qe97AVD0odrSSu0UcPE7+SlDScLtWUvLfPfe4rhdXe4vX62?=
 =?us-ascii?Q?s8Cbe3df8e8RUwQbxCfRRCut7YyN0B21T9Lrc81MV6SdIHU/rxeVZL3+86y8?=
 =?us-ascii?Q?N9fD44soUFWoW463gXs2zafvoOALBtwezIiwbX3OoJuH3PAyCSdJVTBSSMoC?=
 =?us-ascii?Q?vkEiNKwYlFFMZipaVE4iC5+laVPtqNRm8bHiNwBDqA1biiSzl5+XjiWJqWKq?=
 =?us-ascii?Q?OY5zBOVHHdpVgmX9q8kypypa2teAC3ZK3RqzUBt7YcPToiB8wP5eSdOUJOxs?=
 =?us-ascii?Q?AoecPXTFocQEbUk/CFsEWevX8V8lyCt6OfMlZ/x0c7KByJigF0QsTBzyW4KR?=
 =?us-ascii?Q?B/K6YZJc3hePrtZQpAqpUOcvI63DVbrgZUZql7iOVDnQ9rWpdpV34zIEN3TU?=
 =?us-ascii?Q?gH+YW9o6UQuY1h/nAHk28GVDw5UN1AKW/fMYKHJtzoKCizINO/DCUxu/Bny5?=
 =?us-ascii?Q?WSBnjXc8PIBOW5K4pZCLP8kuS+O4BmlQmpjGKqs5IX7eLHhT8OR645Kcyu62?=
 =?us-ascii?Q?r4sEwvSmx25MZS9LT4yJIq9TGoNLFjbKDlJUbaIpS4dYQA35l3fVWK9JlSUI?=
 =?us-ascii?Q?YT53FGuPGCyxxojDIf5fD0V1aTUMByuadZrHYBdlHaIua/ZcHlhWS2DBTboV?=
 =?us-ascii?Q?dizniUCfsnH3WUhOVmmiqrU4y1Y3DrCxqCTStGIoyca5AbmKKMNKGNZD6S4u?=
 =?us-ascii?Q?9lyOvTTIJ4+giZJr+Cp8XBKUTncPffrvRPYJT9x04zHwNSvUamvx8Ve1BP+1?=
 =?us-ascii?Q?8h5s+VbHm2T8wRZZB1HpZDlwodKf9zU8h2qAPXbFEie8wRVGPNuq9Ju2+MXn?=
 =?us-ascii?Q?KVlwbx65oOzw9xd10N1DGB8OqWicvSatFH/VG8kb0TSu0uWrE/oXXb3zguw1?=
 =?us-ascii?Q?x9a3WSAc1DfsCvNs3exvVT5ELuSdOoletsOCiliY1/28DZP4gqbBon3cVzP6?=
 =?us-ascii?Q?Tjw37Jg1gMykrOV/Msc1nA0QAwR+gvLAFve9FnTa7hpIHwPh7Bv22/iXQsfV?=
 =?us-ascii?Q?OlJ6oGOe6JiTU7dVyXm4JAlAeEUTxcQNwXDHBQSHonVKRPGMIZkT58HZE4mG?=
 =?us-ascii?Q?jw3ZcHy8z6mkARNuo5VSsXL5?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR10MB4093.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(10070799003)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?nyG06R3jp4Pbo7rTjnaTjEp2f786kZDlubLQbSaCrJmWr6DNR6VxcPDjrPq0?=
 =?us-ascii?Q?gtKUIxTz0nqdm66L5d2vBpnCIMF6D7NnBikUT+x9sCKmB0Af5qHFrKFLOLfE?=
 =?us-ascii?Q?ND4lEPnVzBapxeLwXup619sPHWedKPoekyhJaXZTe4lkTQztxi5HLxE1XL+L?=
 =?us-ascii?Q?C23oS2kO7CKtz2Wb4T3nVZrnPUVBt2IBV5KmzXAl47TdqI0a4XM4BYTJFmjd?=
 =?us-ascii?Q?km+PiUHLrfTfNY0UOUuLQyN3a8d34th13N6yL7SejdZDgUhx3EeDs/bGrexO?=
 =?us-ascii?Q?S6QBa52WZWqRZkNitzCBzmLp3TiWkd3FP3EybGyPOGvw0a+ah0e/qaLnyuQq?=
 =?us-ascii?Q?23HS4g/TbuXhfQpBrP+Fu84l8THXhr6k0OW2I9r+px46dK0n4Q/oRYQtsyHE?=
 =?us-ascii?Q?WjxZzYUaqaWCt7W3rpG9jFVbgtz9wEis4cWpEE5jzKrsG1KqLxQUcXulhBbC?=
 =?us-ascii?Q?CR5/Tilj5Bo8eJTDjGqEp+zg7VoGhh3Iv0LCJIkwbPKnpOpr2Rw3cEIoO1vu?=
 =?us-ascii?Q?QIRDHL9AlyNQAm+0fS6qX+xMuuzMeNKMJLLiNfxbf7jbe7FPETYeHF7mz230?=
 =?us-ascii?Q?2998H430ODz+7Dr2qXbaAs49qNJoX3SSpbj/WFEhf99pWYuBE/R4YgU5SqnD?=
 =?us-ascii?Q?aJzRHdAU6nqqaYFwJrAoSfsdXjmqm4W+kLC9OofXmx7pMiO4Z0Pdbqsf5ciF?=
 =?us-ascii?Q?eTVT1DtgQuNxucKVdVmsAtT3wv+8aPYr4ieCBGpfC23UkrA2BhBukRSJo/cH?=
 =?us-ascii?Q?GSaL1TjqfygWwPGHFOoHmE5uKANoDB2GouzEAaypU+vaNEbCUPTJssF33oqk?=
 =?us-ascii?Q?CCuTBfHR/qAw5UIleuvRhmBA6XiswO1XxtHmTLGv8fPZSDO/IbEXpn7Zoie7?=
 =?us-ascii?Q?g542NRo4ZvkFtaBoVoANyCfSsIVOqoPIEMWYH+RnsAVvWeXx12kUuseq7R4Z?=
 =?us-ascii?Q?wLpCygtmI4oZcMQ8J6srpwQZQ/OafInWWF3RJMNLsyV+jVun+9GCjSvNpk5Z?=
 =?us-ascii?Q?jWVSXOQNwYLuQ2gtV88+jb2wQEqkldXjWhggyoSQZV24exyf40Pu2o1zwKlp?=
 =?us-ascii?Q?bmVPPngcpOOzgnmdZzX/mBnSwZyHhVSUYD3NAdziCq9lkNIZQERjXpTpdfZl?=
 =?us-ascii?Q?OOR8pJXeKPjNDwLG0xIVCN+3PGcI1qYhXpsFONRXWBcoz/9jv3+UgjcFeJZ3?=
 =?us-ascii?Q?C1sKUG9o76JgnINEvhi29UIh63pc5pBhiyeslZJZMMvylfDLF75z5KFsfrgj?=
 =?us-ascii?Q?BEf4wSQhH45E4XW5vENH4Z791zK2SeQQPJUjgNIrVuNSHzvwqH43qvXHEwUG?=
 =?us-ascii?Q?qt6y4cuEhIAXdIBr/Tu27jnUtwHmWik8ZTjiqUlfDpdMEWBvcgWe+shL8h9g?=
 =?us-ascii?Q?jiLqPCiQDhkaNF8UJrIngvvXSVa4zZjOBPBzc7g15i9ezGPE4N67lkKKFhVS?=
 =?us-ascii?Q?KYB7ytYpLfFU8+BqDU8l+BEB6Yl6zCJ47Ppl1ZwIC9oGIhNunfFc6+NBXC2+?=
 =?us-ascii?Q?MIdkzD4CB14C0kq3XRgc1zbLQsHVRBf3SSCCKfggUzL6FtltWlL2oE+JDo9X?=
 =?us-ascii?Q?6DRsyRDJLy6ZyLduIAQ5m0VbYYPpHuXi9T3ILQuIM84t0VlDuCnxjlxgV1NF?=
 =?us-ascii?Q?bQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	5+Ir4enIAeLsoQT2B/M3Oep/f+f8JTwHqypgpzjKxkdtVR5TL37fWRAde661ROS5mWUCpuzvznfdJ2/04aZ5bycp5nE3TODZfhW0CHpoc8Y8QKgJibMr3KEsz4oKkOSSTpuFhaPrRUdavcnzqiPojfBhirFUZXSrx9im2eYQ4KBeLTH3r5J3ukuPFm2tt+TU9EiPMi08vrRf2sdKvgJmxf1mlAtCJnKl1h8AyMYJKg/0YcEZyYWRs2TFolgoFbdcme68Qlq9gmMQr5GWfKKX+6KJTK9kKbXFMStrqdH43VxaBnfHfPH6p8xpYEAz8IWXbr4UnylP5qNO4PRt0Ze0cBSXBuh4OgbOfkJ/hQMyMbGmn+ufc/8hMAsC5bdgnyFIakkoVL/VZ4haoJcnq2czRnatXzQz3N4wGHohp6z1wygOV6BZ7vegdB1SYr3i41Z1HT/pScgnwED7d8pzpdPTIEHU9eauKkJBxRp6tuT4wb6cjC+eQ75mhloezbGIzNa2OO7vJzPsb7kH/eCmer7ghMix4zUVuDjR8TK8djvrMAhRln2WMmcisSe7PoEDLRdxY/JgwpgB4Xt32d/ujiQqcelQThOXz89U/FL9Z8BHvMw=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a976e69-f648-4cbd-0914-08dcf4205bdf
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4093.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2024 11:38:19.8681
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EfKGyYQZO+R3+0S6t4w044IaOWXfkZkd7Tv3rAcKYpfVLJKa0/FXtA/5KUlF9f0m6sadjTVZa3jiiZrAQv2sxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7986
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-24_11,2024-10-24_02,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxlogscore=999
 phishscore=0 suspectscore=0 mlxscore=0 spamscore=0 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2409260000 definitions=main-2410240095
X-Proofpoint-GUID: KooftEE4Zv2WIHo8PgDdf59s-5g5RJB8
X-Proofpoint-ORIG-GUID: KooftEE4Zv2WIHo8PgDdf59s-5g5RJB8

They don't do what you might expect in troff: a leading . is preferable.

Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
---
 cmd/dtrace.8 | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/cmd/dtrace.8 b/cmd/dtrace.8
index a53632949e72..0639db2136a7 100644
--- a/cmd/dtrace.8
+++ b/cmd/dtrace.8
@@ -179,15 +179,15 @@ Print libdtrace debugging output on standard error.
 Print CTF type library debugging output on standard error.
 .IP DTRACE_OPT_*
 Set a given DTrace option.
-
+.
 Options set this way are overridden both by options specified via \fB\-x\fR on the command line, and by \fBsetopt\fR statements.
-
+.
 .SH SEE ALSO
 .BR cpp (1),
 .BR ssh (1)
 .LP
 .I Oracle Linux DTrace Guide
-
+.
 .SH USAGE
 .LP
 When using the \fB\-p\fR flag, \fBdtrace\fR stops the target processes while it is inspecting them and reporting results. A process can do nothing while it is stopped. This means that, if, for example, the X server is inspected by \fBdtrace\fR running in a window under the X server's control, the whole window system can become deadlocked, because the \fBdtrace\fR tool would be attempting to display its results to a window that cannot be refreshed. In such a case, logging in from another system using \fBssh\fR(1) and killing the offending \fBdtrace\fR tool clears the deadlock.
-- 
2.46.0.278.g36e3a12567

