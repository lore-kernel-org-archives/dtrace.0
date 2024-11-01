Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6234819AD5C
	for <dtrace@lists.linux.dev>; Fri,  1 Nov 2024 13:42:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730468580; cv=fail; b=Q/rUjjQtniUCsiMpdxgCIVg4U2TwxsJ8yIQg18BZzPQv45vMzxW0+wT+5+DptiPpKslVD6v8AF76RiuSFoWqhljR7HLZStldtujmznnZBCrERneATvPffCjj+Luj0jZmcYx1bf8gB8mVIwrBa0W9v2Mr1hOZtKxeBdRnnIhQiXA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730468580; c=relaxed/simple;
	bh=GSveFoBZjF+l8YmVZ15J0EVr9NU15I1Z/+yepb3ViSE=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	 Content-Type:MIME-Version; b=BmWf3trpfzS5hX046i1gaMmZXquMNOrtW/GpKaCykY8FAPkQn3oxdLzwMcscU/dfa4QpkKKkYWTJXnxbsgDY+CMToERBpt99ZbNs4VmbIZ5ZXVqmJLD5RtAb+p2jwbyf7ubhe2e2CeCJP31haAgCDnZk+yH7IKnizq+ooCvb3WE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=CmHwWhl8; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Z5u0BxAt; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="CmHwWhl8";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Z5u0BxAt"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A1DfgjI023755
	for <dtrace@lists.linux.dev>; Fri, 1 Nov 2024 13:42:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=nZL+1KqsSh/6Xcpv/F
	28MjTNtHVD7Oiku1P3swjmX3g=; b=CmHwWhl8CTHefkk7VDand/Qk1wMuLMYcec
	maLguAG0sTlbY+ciWQxF/PC9DEGmWsxavZTQ++GKHcTrogWb6FMqNafVZU5+maok
	AziHp4wrvZ4Ikx4xRj/4K9OrF7+dJErCi9FqxFijXa8q98wFymajTQSp4eLhTHO/
	GqpRp2rJueLAsP2Gx8h7oTp7ojO4ihKkoIPULF3K3sFjXJi8hQ0035HjrIGQGudi
	f13WIrDrMJ+eS8OfLvokpl+etksN93p45rKEbDsxZHTwGTITjF3UOwxZjLFOW3Ba
	38J1JJXzRdLo9TrkfGUcdT4+x+H9dVqjd9LvgDQ3dcJgWVFieG8g==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42grc949rt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 01 Nov 2024 13:42:57 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4A1AuuTX008435
	for <dtrace@lists.linux.dev>; Fri, 1 Nov 2024 13:42:56 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2045.outbound.protection.outlook.com [104.47.55.45])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 42hnedgpny-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 01 Nov 2024 13:42:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IgR3D8zOJzSsJlNDDsPe/MID/YScH1dT4duqUiT3sKR8e1I68U7q5B7LvzMC0iknZcn8g2SxCdtfq645yYTmz1oVcWCYL8+D7E5EAXT6xgC2X7yZ9qGEuS3TvfF+0UL8P2ZK7GLnp59zXiV7WvpoDSW5tbT7hr/wmFeSQm3FmxJ4OXvvnzRJ17gYcbtu4a0Fyfxs/MOjv4mzVPzTn9lD2pkiz8O3MqpVeQ5xlsZHLd3GgK4oGodRvSsP+DstD3ujJg8EaoiL1nLyrp+2Hvd6tCDHy0xa3VOL0mg9ALsUDmARADkAF4ZA6o11bJcpC8xOUYpgDDX4BDuHnZ82AxQgEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nZL+1KqsSh/6Xcpv/F28MjTNtHVD7Oiku1P3swjmX3g=;
 b=hNAUgZwmm5VsfkW1AgqDdUe0+47oKgEgATLLWrGegOR/Q45t5jfnlTC1BkNsBpFklnWR0ijIiI0NVKvmhF5K9hfOpWA1UYLFNiTunHeuhlgPYf0AQRd+mc4rhqX1UjJD0fX9xl4o8nOjpvlFX61FaXoijBJi9ocV3BDo4b2tqKysB52fQgXI1ysjVole4B5rf6PD0zjVWg8D8Pu68287oGn6d22epeSktI2mwVXRG2uycu4rX79ypuhfgJy/UXPpFJVvNsJ5E8HYcRQElC9cVLITpmoI4U47prm9XPRT0FBk2smwD8Qi+vTsJ3zR1R+m7dcrZXZDQAg/Vqa1kTfRaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nZL+1KqsSh/6Xcpv/F28MjTNtHVD7Oiku1P3swjmX3g=;
 b=Z5u0BxAtlfhDOArl/ZeECnIAracv1Ur+v3+Z7i5hJpjNsn+1Hv56SvOzW9SuyZrZdOAWZ7uLuMSVCHDiRZTdJs5Q/kDpqUw6H3LOQaa8ZLyDeQwe40jf8Ex/LIfPPcmEtlqnldtfXHVavt8o6oe51+v1X2YnGULL3xCVKJRu82I=
Received: from MN2PR10MB4093.namprd10.prod.outlook.com (2603:10b6:208:114::25)
 by IA1PR10MB6074.namprd10.prod.outlook.com (2603:10b6:208:3ae::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.23; Fri, 1 Nov
 2024 13:42:52 +0000
Received: from MN2PR10MB4093.namprd10.prod.outlook.com
 ([fe80::d72e:fa5c:c426:b4b]) by MN2PR10MB4093.namprd10.prod.outlook.com
 ([fe80::d72e:fa5c:c426:b4b%5]) with mapi id 15.20.8114.015; Fri, 1 Nov 2024
 13:42:52 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH v2] test: Disown child pid for cleaner stderr
References: <20241031044906.15804-1-eugene.loh@oracle.com>
Emacs: it's like swatting a fly with a supernova.
Date: Fri, 01 Nov 2024 13:42:47 +0000
In-Reply-To: <20241031044906.15804-1-eugene.loh@oracle.com> (eugene loh's
	message of "Thu, 31 Oct 2024 00:49:06 -0400")
Message-ID: <87jzdnkr3c.fsf@esperi.org.uk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.3 (gnu/linux)
Content-Type: text/plain
X-ClientProxiedBy: LO4P302CA0033.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:317::8) To MN2PR10MB4093.namprd10.prod.outlook.com
 (2603:10b6:208:114::25)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR10MB4093:EE_|IA1PR10MB6074:EE_
X-MS-Office365-Filtering-Correlation-Id: 06d6826e-caec-49a2-d05b-08dcfa7b1551
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|10070799003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?bLWuvktc3605MckpROkrxStpIRAgoELtCvb8h48jkIVd9BgKrKfLCQkc6ERB?=
 =?us-ascii?Q?e1XxBf+r8NWyN9VSGI6omUueYCLOjCTAXOEl09DWxj2YYgf7CelSg/eHYUEb?=
 =?us-ascii?Q?gFRVzrvU2VeuyTF4Mhbzft2LhEhX+YnJI8jSdC8TFGDnSX3wt6Z6m1WsdkIW?=
 =?us-ascii?Q?BtlLy8r8ObQSYyFouT8sLBS5tzqu2B1vkD+Fi1IkXUZCQ3ulVkcc2YU0A/Vw?=
 =?us-ascii?Q?UnSBiL7t3gUYzbr7inGTTQ3RhTfoMvdgxr8vrD43C/G5I55zR9uQHJnWyxu5?=
 =?us-ascii?Q?0CEvopFxk1nyGLd1iuHr26mQKuhpSAe1igpzJoKKEabNO3+80Qukd0nQANMB?=
 =?us-ascii?Q?oDjxqgY5pI4e8ZjxK9YWt5bNv3F5IMPRHVGnMwTDt+xl2gQj1ljt/nfoi2sG?=
 =?us-ascii?Q?Vc4egQgEH7NwrDAdHsVBnwjy4Oc/fW03xQcpfI17rvUmP3jIgaFOahyYXqVc?=
 =?us-ascii?Q?Nq47uDI3qYA8UTarI3E2YE2DfUK6AuTBcnluSdzgJ8DfjwZf51b7GlrBT5R5?=
 =?us-ascii?Q?/ALbvMYOizM/TmDsrgIGqDZUlV69LnMFB2enXFo/1k3mIr/RnMulqCWeZqb+?=
 =?us-ascii?Q?r4e3pvWMeWybianWq+Iot1K0I4FQKZUb9iYm8gxRHW10J0Yi7zEGxUvmeJM9?=
 =?us-ascii?Q?iJ6cQFeaHuB7vJ6If+zikrG7ajnuAZz13S0iL2ngwhOR7t8sLIUpx8hJ98jZ?=
 =?us-ascii?Q?cCV6KIQTBqYfeLm7/jdQNpSiRQJXnf6xhmPmCl7RBYu6jNZ+EFK/Ggt7Leg8?=
 =?us-ascii?Q?HwNxzUiidedM/tULJiayUdXMf5o+pP2uXGV1cOrRnSw3eTFif0aKnJ6PCCfk?=
 =?us-ascii?Q?IApFVZeIjszVYmxbQW9Jyyv6HglAde89P/N9/8QZtxG71pLLzcT0YJh12+Gg?=
 =?us-ascii?Q?GSrgn1UvI9Hhyr7U7uKG1OzBTY6WRHctlC75WQpWKrdtn3jP913eVOnxFLjq?=
 =?us-ascii?Q?b0ZSh5O7Coi58oFxSKVqfDs1UBA55ejApETmcLOFkGnzLVuWLZjf1VTYAWqQ?=
 =?us-ascii?Q?vm1JZ9KjjAK7XVfAY1ShnykJt2FRr0kTwA6VwjtiB/RJnw86K0KUAmrn6x7p?=
 =?us-ascii?Q?EcOvumiEPUDzRyQjzBUPT/Yx7G3hwuCdmbx+6w+l44YqyTNx3AkakhORWwqM?=
 =?us-ascii?Q?Z8uXz8/uT4eRORkiD1X1HFF9QFBFMc37PPRyynZrlHTBBVayszwv5ruzl7pC?=
 =?us-ascii?Q?SWdX6F3LXIaKevNqulnFwNbOZN4Z7S/R12Ehkzq8MYS7ebkYGAELs80dw0qZ?=
 =?us-ascii?Q?u1uaBbyWUMpb1TdGttkku4BzUejjWdXWP6qDjXqUo30x6zvObkoMlRotoKN3?=
 =?us-ascii?Q?Jzg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR10MB4093.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?SycUMW3P0ybZRh3favP+Tw5RmuoLu2DJ3SJj36Z8jpyDn+ggT21gm9IrXwWc?=
 =?us-ascii?Q?KvSs6FxJEV+aWwpQiUHmC+b22IU8sUk9X11Jwhe32V1JVKsjH9ymp4vWjFik?=
 =?us-ascii?Q?jdh/qLtwurLfe0ujzfSIIczmFE9pHkGMyHP5dFIl7bGq0zOmUhWn4/5T53sv?=
 =?us-ascii?Q?r/2v7rq45pV9ZKJZZgSYdFWWWHTHjuTjXAJiXs8ctM/nWD29pe0mNNCKxWEW?=
 =?us-ascii?Q?+tyIJE67Awl/Gs6lqvQ0lgEo4WgHIxbufx/EsNEvaFBKADGYMPM3CR89T7rt?=
 =?us-ascii?Q?//cYnwG1EG3z9/KOF4fys9u4B7MOvEYxh1IxzUN7NZYUZa0CmIyJx27/sYeJ?=
 =?us-ascii?Q?Vj7ZKoFZPTpD2QO2/FBBik2OrB5CZQydcPK9TFbaQvHUMrI4mJB8bTWCxzde?=
 =?us-ascii?Q?kW2Vgkj/9gfFePbjV+sJQWtj1Yk1ckzkxOQQN1W9cRCS4zlF03GCgQIdRSZm?=
 =?us-ascii?Q?85oRegcUu/p6wh5bstV+PEDDjprU4jCi5+0VDXjcIYL1ku2zkoWHxEXw+seD?=
 =?us-ascii?Q?BBh2aRApDv2PLS1aC2Xp6T3R0sEW3POIG2phcOD7RSBApLmdokGMRWKLf3Ws?=
 =?us-ascii?Q?nnaRARqADZzoCe7/XssJFSXOgV7Wj9ECGG/9IYu59qGoTgBmlRZQDBW8nfMJ?=
 =?us-ascii?Q?cHFmr3HlFXnJbe4GlmnJhhYxhj4dlC2gi8B4kTb8Uj7jUSOku/Z/ILNXkec+?=
 =?us-ascii?Q?hyCJGf5z8qflet+rC4klAyYEQmY9leDMmAkrfS5ZLsrbpioHtN0EsTrSsCO/?=
 =?us-ascii?Q?KEqU1OyZN7pzogqfUoJ83vBQAIjKaLPNlL/kOxQTxZr5lJ9C7fMGPmIh8DrE?=
 =?us-ascii?Q?cqIQD+LxzxnDs1LzianS1POfo4EFsNcYACel6TSUdNJq18vYey6k7q5Yu5xo?=
 =?us-ascii?Q?l8p3y3xDsPjni32zZusEjfGkynRqfQpk1eVpL0UETTG1jtfyyDhbStOPSfB+?=
 =?us-ascii?Q?Ew1/owLuwk0eAO7Gkh3gzfpjyZ5l0jW5OlfydRDXwL49EXM4KBauoTeqfFpY?=
 =?us-ascii?Q?6Nd7iEjtjlO2MjO9i/wEEPlojxH0bnz/GkvoktxXsS0fRVo2X1wcTcfcjpar?=
 =?us-ascii?Q?B5cH6UliHTWq1v4I3572InJTLs9Iqg3L46YEQ2k24KknmiHSt9wSfLmjlPZ2?=
 =?us-ascii?Q?3c3IFvGER4murXu5X8XfY5kXP1an5HEUhK2RmQlISfFZV4f1UK8TfurA0X+I?=
 =?us-ascii?Q?LOV9q5bzbpAbCEYYswVVYiVVVqZZdre5+g3d71unVqWkCIha/Jlnn1uph6yn?=
 =?us-ascii?Q?xn4rRTdIozR8np8Cf/PIH+Bd0FoV/6sJRwB587NwO1IDB+9NUQvmQ0s9FtE4?=
 =?us-ascii?Q?U4bxUz+jFMg3D4WD2Y79ZET5Ez8ocdmMRuKvuSpgN36yNTXCBWZGaBojRFUZ?=
 =?us-ascii?Q?HTS0II7OVlZN2UOrfk9o+bcmxwKNuCjLlodvBhL2PSadLCRCLSfyi58okJBm?=
 =?us-ascii?Q?fbiguJL1w8O3rhZi/0AEVusZeh0GK4ho2mfBA/F27GJOKnR8kr2GaP9a4yq8?=
 =?us-ascii?Q?xTI1u8SbA2FFOncwyqK5WLL1+xhUSVozaMbFR9JBgbAOnOz5GwDgyTADoq+U?=
 =?us-ascii?Q?ALdF3nXkD0TwuFEx7BoFA1XvSZMZ2SwYoJ0pEcmu8ZD3lRr6aMu4ObsM5gRs?=
 =?us-ascii?Q?rA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	8Eh4V/TLw4sD/f0lyW5HFNbZXVXLbeA/s6sRixonO1Wfgkdnk4xzpuAYTA3F0gMEscMVfwXE6As3M5LSmc0fwNI60nN1n9xFVzZ9jS5UgmpjneRH2TEYizRm5soHGyDDCwL7gOAGnduu3vVqTl9ey9CDt/qI9NUrQWXvXE8fFOGaFSePURqqklmS6cmwZboFe0g0WPLTYvrXQHCbYR2l5LpmjCeAtb+LsFvhgP6KslWzYZzgRX8fHT7Nvi1AybYoVgB0IMj5WEKIu2n08spfI7lNNbTq+MjbXcRCdHFYmfOQWkIoaPQUo6806LMyHCxaM8+BajpIVMT5lEaom6s+xbXZbt8HCgiKWY2oOI3Yauuy+mIqmZ42f8iXTiULjHxh3MXQ1LPaBqGDrtW85OLcRdqNJgmlZIc7hZOdrCI8Wz5mEQOYF9h///zEjqMBsitCXXQXLkSd8a2fosRhmdDW6Q/qevWXvjrqe0IM+bZdFkVpNh7EsCOgNVBDN+aI48w8x6twwI0PYqMTWY3kk7RkOwEQ+/bIcKNXS05WaMnCtnMCDob4Vx7DUn4wv7ipHH9g4j0iy0AYhplZ9agnlsghV645RbPzSnii7oZnYTFIhkM=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06d6826e-caec-49a2-d05b-08dcfa7b1551
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4093.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2024 13:42:52.6636
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5nclhzqJHvReIy3TatfTvBfdxw6g0mfA3w9jfFSDFMm9oPdB13lE2xFmOmOTZ61okQnACJdZeDef/pE1hDvE4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB6074
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-01_08,2024-11-01_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 bulkscore=0 spamscore=0
 mlxlogscore=999 malwarescore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2411010098
X-Proofpoint-GUID: 5YQd3GZKcGEgm1Qk2znm1V_0NBiq8I4m
X-Proofpoint-ORIG-GUID: 5YQd3GZKcGEgm1Qk2znm1V_0NBiq8I4m

On 31 Oct 2024, eugene loh verbalised:

> From: Eugene Loh <eugene.loh@oracle.com>
>
> The shell can report when a job is killed, potentially
> polluting stderr and thereby mismatching the results file.
>
> When a job is killed at the end of test, appearance of such
> reports may depend on timing details:  does the parent test
> or the child job terminate first?
>
> Many tests deal with this problem by disowning child jobs.
>
> Disown jobs in a few more possibly problematic tests.

> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>

Reviewed-by: Nick Alcock <nick.alcock@oracle.com>

(My only reason for not doing that already was that I mistakenly thought
disown didn't do anything in noninteractive shells.)

-- 
NULL && (void)
