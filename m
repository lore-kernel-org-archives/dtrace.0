Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46F7E194AD6
	for <dtrace@lists.linux.dev>; Tue, 29 Oct 2024 21:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730238705; cv=fail; b=m81f8J4+cXRfGCkqqhVtsPZLlJ9kmH3aqjbe291QW2izpq3YGpz5PyoMax20QTzSj2fNngdcMvyZRtbGrfLMyYsiivZopqBy2X2cqRBWvGhzzH/R10hx+kIVRurzhlqHLi9U5ial7ihqe+eTjmoZPf9uI8K+tJCXR2EpNwL5EKg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730238705; c=relaxed/simple;
	bh=z2roOHbYga0T2kvSSsG7c999QI/LmHCv27Tr6YtSjvk=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	 Content-Type:MIME-Version; b=VJsypoI6FSqTrBxsNHcDuG0R25ehwXoSUiLr5R3saQVwFIR4kV1coTXZ+P8361HlE0LQdNlSfgX1o6rdbOeZVWRM4bLsj4ckCk8O4bINoQXQVCHnc6x9w/AWtDnBe6ky+B6g6tzuE6bPKJwayLASyVxZwaRpllKg8BOJ8Fg9V3g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=TCZRah8z; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=CdU7D859; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="TCZRah8z";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="CdU7D859"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49TGfdZP003425;
	Tue, 29 Oct 2024 21:51:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=CfMavfwCvIqgcveDvC
	JXfD4rkydoR+LwoOYjKrPfzzk=; b=TCZRah8zBejoFsVWMu5oieaT32z8VEnGxc
	qri5uQIXALBUbsMDUFcVVhpG8sS2bruwcvZH5PYCmZPPH4ns4nqLl/X5axkhtgox
	6bdIeEa06BFRKa7pJa/RvaXejynOX5Wx89OVIJEuEjJHzDRs+MNHjPp/AklPF64U
	PNNV7oLa0crDc2pzodJMB7qRu2RUhLP7TBgfQyR4UPL/NFJOV0iSMY7llWxZ5umM
	EOx2PHXDxB/Jda0tJIEx37rAbPLSTq1VKTFiZn6ClZBCLNVII9vOhwwEgcVi/xke
	U6VZwgraTlgvskB6hgyHoMfk1ck6B/GVbkLOAfYOK/B6amX4OD6A==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42grc8xnvt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 29 Oct 2024 21:51:35 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49TK16Sb011917;
	Tue, 29 Oct 2024 21:51:33 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2177.outbound.protection.outlook.com [104.47.56.177])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 42hnad6c49-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 29 Oct 2024 21:51:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S75L71prHK8XIx2b2WKs9NhvRt8YLzTk0w8sou3ao7a975yGQrmbspIr0ni17xqhwGwdo/43zRuS4XNmd+6cuUzqA4/mG6fgWyi2skR2xJeLMvzqhC5muXtvUpRnnBTM0AFNTlFOCp/Y93mMPNePUxSgDpi2Z6yrXsEo8SCXSnQnYOLij+GhdX/3EfllnxuM4FL9+ISFkVa4K09qwvtNPJuxDbx9+hkBUAGUCl4l+9heCax8et2npfLZfO55lxwuPoWDc+Ai5+NYmrNSaFkVItAzfe0sylgonzAADVXligCeQbrf3Isi29RIRIJciekiDlbq3Lig+8w60hrZsYPN0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CfMavfwCvIqgcveDvCJXfD4rkydoR+LwoOYjKrPfzzk=;
 b=j95kLy1kIARqLu7uXtq+JGJ+9ShYE8afMZm7TQpnnMiz75o3vUz3NUBovX/5Z1V56r4hD1yUHZXofuLokBBAxbYKyG31aUYKSrB2rbGLL8MyV7NvjJP90j9pYoZFA7e0jYrmhxGPM0gYgUW021tkHtNDL+c8Fxp1FzP9NXci/GarZCLYKU9God+EBUaCSO14Z47BG7rG0XF+C+6XHLL+IlovZMhb4tUvc78u5Bqa3DEcrpX0eXuFKFPevOJ2/7dCSEu8BJ//1ETWVuWQ8Rzmc5DZaz5kMDRaQXex6K5M5qXAi8CTuhACk2++6broSG5HGiwi/4S/rdPoV7Wbw7Sc9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CfMavfwCvIqgcveDvCJXfD4rkydoR+LwoOYjKrPfzzk=;
 b=CdU7D859pLvnglyz5iYPsKFC4XdUxhoZ7jxJedh60RK3bpMDiWRrBXXc+HH+orU+I4gk1VadrK+NiW7m5dv8gpTCWwE21E+eJ63lTeEWrfgjc+IawQGnJ3KRCQoxz6acd9Cch/BN+62akspdmiBXWTPGXki9nhGpe6ve8Zkk3l4=
Received: from MN2PR10MB4093.namprd10.prod.outlook.com (2603:10b6:208:114::25)
 by MW4PR10MB5839.namprd10.prod.outlook.com (2603:10b6:303:18f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.32; Tue, 29 Oct
 2024 21:51:30 +0000
Received: from MN2PR10MB4093.namprd10.prod.outlook.com
 ([fe80::d72e:fa5c:c426:b4b]) by MN2PR10MB4093.namprd10.prod.outlook.com
 ([fe80::d72e:fa5c:c426:b4b%4]) with mapi id 15.20.8069.027; Tue, 29 Oct 2024
 21:51:30 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com, sam@gentoo.org
Subject: Re: [PATCH v2 01/14] No longer depend on libsystemd
References: <20241028211803.458685-1-nick.alcock@oracle.com>
	<20241028211803.458685-2-nick.alcock@oracle.com>
	<ZyEpHYo6ZeuBaa4W@oracle.com>
Emacs: resistance is futile; you will be assimilated and byte-compiled.
Date: Tue, 29 Oct 2024 21:51:25 +0000
In-Reply-To: <ZyEpHYo6ZeuBaa4W@oracle.com> (Kris Van Hees's message of "Tue,
	29 Oct 2024 14:27:41 -0400")
Message-ID: <87ttcuo9wi.fsf@esperi.org.uk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.3 (gnu/linux)
Content-Type: text/plain
X-ClientProxiedBy: LO2P123CA0074.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:138::7) To MN2PR10MB4093.namprd10.prod.outlook.com
 (2603:10b6:208:114::25)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR10MB4093:EE_|MW4PR10MB5839:EE_
X-MS-Office365-Filtering-Correlation-Id: ab25c5ad-3ca4-4331-33e8-08dcf863d8b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|10070799003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?PJgeIlLgaDng86liBI7bgA4Dd2Rw0BN+EM6X6q0ODTuzK73xsmZZpHJ6nCRV?=
 =?us-ascii?Q?EVebRc753yJiDMZ3vsdQPY44K8RsM32s7vCTvkMrYMepkFfI0sF9r2LFMt0N?=
 =?us-ascii?Q?TT5ddUl/6B98Qoc7Fhuje9URn/Q55fUOx6DnjEIfUdlJREoSTK3gjFwJ6Cq+?=
 =?us-ascii?Q?KqH4TSfXUkRNZcGg0ZqWswcoupO5EKOZ2k+D54S8629vQWx4ZGVGHJRTKLZt?=
 =?us-ascii?Q?nFP6h3kC3iWFTYPOCa3tznqi7eDHe4O+3pLwXdZarvkiOb1YG3DbSnG4wcxB?=
 =?us-ascii?Q?m7TBihhgql+lLAqjJZbYWEsHCiThyxoDPvT/UjfiV2KT73EvhZ/H4jGYJJOK?=
 =?us-ascii?Q?gPPTd2Yb5hYFsvDbCoEmaZxq/6cNdByUTM7SNNyxLqqw6O3nSDsWTjk3sbUq?=
 =?us-ascii?Q?hXhmnfWkN4lqs8RbbugsFtgP7Pl8RTLoA2hxlt9qtYF5KahD1Lo/OULm0jPJ?=
 =?us-ascii?Q?+KxcdkdfQMQqM/N/F61/BXcDijYuHxLrVToFzTkjsKu7IjXE6KV0Wepct4lL?=
 =?us-ascii?Q?uuXWOy0jfxiwX+3NspSBZICmS+rbHYpCixiBvwzQUdfF+iRstQeBKci0d9bk?=
 =?us-ascii?Q?TQ4cq/8v7u1gwNGDjH3/66g7wZ5zXjqFFjbL2LyoouEnayhzQgaC7KSJfOkU?=
 =?us-ascii?Q?wB99PrDQuK2ezdRZJnkaFF9LPt+ZzbPBV5ef9nF19lS2330zQ2zOdj2XpHAD?=
 =?us-ascii?Q?yJghL5wudG4flSOEgUvED1iVLoMYuxNNx3xSxPvoYKgButCI/qyzqjhvuwn+?=
 =?us-ascii?Q?7kCEsr8RCsx8j42ePUNJpIlp6TdLcyE3g2b3LGkYXZ/zn5FI5RpTNQReq+pb?=
 =?us-ascii?Q?xtn9X3wVnqrSlv0WV92bvKYI2FatjQ0bkEQRqQxN+vq6CCD5DOVfWaOROfDP?=
 =?us-ascii?Q?IG4/Mz50tjVoW0/8fsDEw7WH2RRv2sy0cmWSRaPPsqh7JHOJgzVXfRtG5t60?=
 =?us-ascii?Q?uJ1kKGKnGHFsWRGdOd/7U9v5c031OTm+TKYvXcz+3rdSpdHVr+4VLxj6aYkj?=
 =?us-ascii?Q?DHOuMaHQjbu28bVEAwLgpyZWd6Imoe4YeCgYtNxNi01fyQlfyHln1EUU5y86?=
 =?us-ascii?Q?pPjvldcnjzB0tv8vbMl2tjHCSkdFuPr4E/e7FvIk4CoX2zWZmQ/O+U3HJO7z?=
 =?us-ascii?Q?bWx9Flz9tdzNQEgZTiYzdtY5NhlqM6WsZbC701cg/3feIxUSzzNglGBZyFtk?=
 =?us-ascii?Q?YKjo0vw4KLf7fIkZ+r5uK4BtOgB44iwMjbkUqCMpZJGT3JLUUjNZBLmOFh6U?=
 =?us-ascii?Q?e7IxvOqR4ag+QPZ4SLDA/+OO1Ys75Fh/uIme5STFYZeN/7+5Mp0Jrag2dn4w?=
 =?us-ascii?Q?DnCXSkVuL/rOqwCK6AC87gwS?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR10MB4093.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?RDSjcROi7Ua8XzfFa8OZzwdDzc7mNBcI6p08zVZJuKCTKOu1rCZ0ea3VaYI5?=
 =?us-ascii?Q?3GE8s+yt+tVF6DuPTwdcP/lKf7QYYtB4tFW/nllHe836iBADVBSFVD0pvb8a?=
 =?us-ascii?Q?4m9w1qoXtiSIZPlYzOA+Zi73RI2hG1kfvuvwMuIb6n0bvHeT2jUQNVXfxNj8?=
 =?us-ascii?Q?/Zt4TdLog5Nvhnq87aRJUmgEgVKvCQ6I5bQspGxSi/TaWMo/2DkKa4XOGasg?=
 =?us-ascii?Q?jG/GyZSlFXUBcXO3q6zfy+qxCa22OrBgS+HAA9UGJ3bT575XwA5MGehDiyEE?=
 =?us-ascii?Q?73Aj8qvPizTRIDyyXxJoFhGVK+4tMrJk68wKqGqlDpWiwBB9SVCJWXY81GgZ?=
 =?us-ascii?Q?Tx5zVnldZyQkSzTd+UV++YSLrqrFgbryj3kJhW0mzYkRvfB4lw1ylMxLKUaO?=
 =?us-ascii?Q?R17KY2jYU6mE7MhvSKDpKFioUdoZO6auqVxT8hxxZxXkaVdr59auYocPQVGg?=
 =?us-ascii?Q?WtYJ0/elGKgW5Fvr8hCP0xf0sHcRMAowLcl3ioGQ178VYhvvbbYGfxDs5xiA?=
 =?us-ascii?Q?G5SnItoBI3L2ARDtpWV9qJmG3lPE/1hIEYWKMEfzB3SlH4SC+YJPkXobXTp6?=
 =?us-ascii?Q?jy2MDs+JKlvuVISqzqwz/SaOu+HlyoIcoi+S9QMxdlxDhJaKOH7SuL0cWE5y?=
 =?us-ascii?Q?rFav+eFaC3B+cHAHYDNINexnGXXibWlZ+UkYQHlaMfj+sm0dxSq5ev/cINuc?=
 =?us-ascii?Q?pjUc13wpHN4DMFrtRC22Okg4OqhHj1hzbE8YOqZH56prcJkOIfI6hKhHHpVB?=
 =?us-ascii?Q?bQ3QfIOB9q4HainW48rsx4b5+xikEw3qAfMkOb7yvvjOwffMFVHAc+4PuGPg?=
 =?us-ascii?Q?qjdn7fCIqZWdO7bqdYk1da+FM+IRXsBio+9H7PqhPfcZMhcQcb3n0d7HkfD+?=
 =?us-ascii?Q?2t+wogQhla6s+KEEIva9bLw4S7LNJ3FKJdfwGQY7VAW0934unWcn2s7Ne0ZG?=
 =?us-ascii?Q?+YRCTCweC9BULlkuAGevOCRKbqN6lFo7fNkYPvMiJGEYUAcI1Bgw/+3BQMd8?=
 =?us-ascii?Q?oujxsHygDSxaJJckDgXg4faNsHeBB1fdoNq+h8AFHVgtZEQHwraqq6v6Tl85?=
 =?us-ascii?Q?9Gy88+7stXvlTplkUam/bLI9zGikj9OIyG3bRwSpfxkzUlUOW+PNIMV73bSf?=
 =?us-ascii?Q?tRTudsOyhvYAmughotaZ021GM6oTUv/10LwBcMnK0X7N7nG3RxFsxqQ4M0sy?=
 =?us-ascii?Q?B/z9vGHLtaUF1jfwYMHKHOecEYZIh8JhtvZW09aFaKJHL6xH5uYKzPn/fn6F?=
 =?us-ascii?Q?Wk8bH4EbLpStWdbk8+iKFKFO5h05xnXHFljHIWyFuUfnr/pEPDBHpxW/HHbe?=
 =?us-ascii?Q?s199c+W6XIh+N2FxATVh4rKSurEmf1TnLbd4/iakj5fLVHWnOZUKOoO5H6NK?=
 =?us-ascii?Q?T5+GcicszOGOo3sxMHhUDtgUmXUXnOneS00ESYgQUjzRyMELDsoJC2Olm5pr?=
 =?us-ascii?Q?xBoGEJpr+Y/74Nd/zgLi/vMr6t+XiYUgFoMUXBkXvkIU3OP/atFRDtMuly1M?=
 =?us-ascii?Q?ASBlRWEdc+FqUqKNfbnKCjEuxVeeMUS1uA6kVLLQV3LV8ydNfpS3NGwFgx7L?=
 =?us-ascii?Q?2NPa2K1IAprS/mhjS7F8OzwVGOtP34rX2uox/Dqevq+aY754G1mVztFWwBIc?=
 =?us-ascii?Q?9Q=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	4m6XeyUYhqSyw+yXoe6J9nMvA4Cn2xBXxqLtzov89X/+t84et80/FPdHKpWPfJZVbN6J3hBxzkchG1XcneAI/9wRgySglUghddlWSz16KlP1DgoJSsKeaT2k2LK2ORWw4vIEuywngzROC2rKmbiXphxiXZXMbbjfOBjTz8QPyGXpVO3g+SFqDUDpQQPUv5DEN3Y2dlSsOrqebzfNSORR/3bYvoVeFqiznX2zeL4++7vpDIV/1Wa7SyLCIWrA8/E3mLmNmfO1hCDFqsGze66nqcP02lScyqZoQL2J/oON2/BOeJKEguWgL7PyX3SgqhOWfmO3rwOhlsXo8P1Rk7Uh5KcQTOjAtmrF+vpGO1NMNmb/KDbjvUSk6gspZNij8/ryU7bBHoy8lm/54Vf6KVtVNZgDkPi+VltuY2zNeExdzDve6CB+3dujYadzLHKh0ZBTepOM+ppT5UvfE9YgVVVFgPPeuptkTYdgsYGReomXE41+vcXhF9zzTPY9lDyBIrga4DqN+VpLn5kxIMy8nsPs/fayuAFCpzHfR5aqOtl2CwOV2dPAAwwMgskzkGtRIXLybkvO3QPqbsWJIoNlDr+67mUR9otCIDPMZePNjrnCz/0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab25c5ad-3ca4-4331-33e8-08dcf863d8b5
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4093.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2024 21:51:30.4859
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0zHW7IhcAiZKBNlOgE1qv1enea2j54DaLeGrKRg2xnhhL9yx9S3o4cDc5myQnJjF3ixeEKWwzNyOKtaBoOhZgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB5839
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-29_16,2024-10-29_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 malwarescore=0 spamscore=0
 bulkscore=0 mlxscore=0 suspectscore=0 mlxlogscore=999 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2410290164
X-Proofpoint-GUID: E-6OK814IHGO29Jm7WmY_h85k73aL7op
X-Proofpoint-ORIG-GUID: E-6OK814IHGO29Jm7WmY_h85k73aL7op

On 29 Oct 2024, Kris Van Hees told this:

> You are your own enemy :)  Since you chose to use all spaces for indentation
> in your configure script, you now introduced inconsistency by adding lines
> with tabs!  See below...

AUGH

Maybe I should just arrange for my emacs to just fight itself all day
long.

(Of course git log --check can't simultaneously diagnose this and the
opposite problem...)

> On Mon, Oct 28, 2024 at 09:17:50PM +0000, Nick Alcock wrote:
>> diff --git a/configure b/configure
>> index 4026a3eafcd3..72eb734a8380 100755
>> --- a/configure
>> +++ b/configure
>> @@ -93,9 +93,13 @@ built locally, none of these should be needed):
>>  
>>  EOF
>>  	make help-overrides-header help-overrides-option
>> +	cat >&2 <<'EOF'
>
> Leading tab whereas all other lines use spaces.

An audit reveals several such lines, actually (not all introduced by
this patch, though most were). Fixed the lot because why not.  This
means we have a few extra "spurious" whitespace changes in this patch
now, e.g.

-	--prefix=*) write_make_var prefix "$option";;
+        --prefix=*) write_make_var prefix "$option";;

but only a very few.

-- 
NULL && (void)
