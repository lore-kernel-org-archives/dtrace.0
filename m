Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3F4F1DDE9
	for <dtrace@lists.linux.dev>; Thu, 18 Sep 2025 14:45:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758206730; cv=fail; b=RZAgBBSTkX7DR62G7LTEVf55CVuX6hTvZJ25gyKS+0F5+D8gS/QaG/iiyJdcxnI17fTd9fzkgU4LftrrFxZR9NSj/UV2qsERayE7S0MaN4bzV9FdXXF6iqk19wPaaWp1Sp+movIk3tL9AxgV6TTYHRYjLnKQyBpTR43MIteoHpc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758206730; c=relaxed/simple;
	bh=5BC7M+7UMN7gjgkOsRdNKvtewVfAdMoOwaa/Oy5APjo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=k9PpkOsBGUVsE0Ce2LFwuurqC1WpYU5AMn0l/FeBw6QK58NRK1xIZxF9pqCHEd9ELOzioQrjgMEdLoETwhvKjpZYEcaxYO4dT/eVD6fSrk6q0BHRTBBVup1cJxg9m0LgLVAvLiuLZjxMYD0glqKmodj1Uz8AZQqQ5ZZb4oyfA1E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=cjEwkBDI; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=DhXbUK+b; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="cjEwkBDI";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="DhXbUK+b"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58I7fu91021226
	for <dtrace@lists.linux.dev>; Thu, 18 Sep 2025 14:45:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=GsA7Zke5fb4wjHpsRC
	AiBGDKMkpNbDbWN0u1W7FmDk4=; b=cjEwkBDIRFYxcsxfbUWBv8nNHf0sWoqI4g
	uPzBmDmdU7X94H0fo8ZScN3TYVQFg+oChCRGluGRhyI7qbiuvzSnFzYgTzQLfsfr
	inxS2XnlD1Zmm2yHa2BCwCcsco8zYmYL8dm2uazjYYYkTIDlHt7JO0U++N7jWyC4
	/CEDK+S5fYNMURJ383XYBHBYA4pL2WIyley0E9e1UMNEmFAFkBjpb9D7Gifz+w+D
	JbXIj+FmFnKghIfCK/S1gU2EqAdK4lc4RHelYdlg39yG0RMA0V73WaAS09ejn1Lj
	gWdNA0sf+kUPB/oH7xkm40R9Wh9NqMgnRSNm0JHoV+zUW07foaZg==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 497fx9upe2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 18 Sep 2025 14:45:27 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 58IELvtF035313
	for <dtrace@lists.linux.dev>; Thu, 18 Sep 2025 14:45:26 GMT
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011055.outbound.protection.outlook.com [52.101.52.55])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 494y2nhm6u-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 18 Sep 2025 14:45:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H1JtHmHYRd8wslE2b3eJYRcik8SyNH3XLKMNMXmF4d48Dh0dBm1uzR/p05Vk5Tq0Brj1z5oS2YYvDhjJtEcItCcnnK1gV4GXgTBAMxj6VyFITIWZRiDIHnYNOBKIXMEd9uiX8uZ6F7qCHfVOgo7qZAJu+Gh7ULRHVeaGGiPPVdinJqV75NpFtkPj/yKoCcsIWKQR6LDoqun9CfUmLADFkUhvPbGwwUqqbddMH83NuDifhPJhuTIiK+oURscFg9M0DvavkxNsZHCEty0WiO65euQYDm5irm+Eik/1PyaOg/m/WDxkgTfGmX10H8csZwv9xzEAvKv3uQJhDYpfwJQ6sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GsA7Zke5fb4wjHpsRCAiBGDKMkpNbDbWN0u1W7FmDk4=;
 b=r/1jaNlTE2LHzYCvOqUJ0+G8VMX2rkrebluEAZfOvVU8p2PkMlHY8Tz8Yer1ksPI9J/CZDI2P1CwGr+CgYsSDKNoIEnVnaTiUX/es/bYEY/S7q0zDssKCzz2SgrcKCdqe6I/eAWMifJz1PwcTb1JHd2V+DzwBYYaRa8gBnQp+4/xMc6mpzv95WZ4Ev1bUZ3Tz2p354fE3nG9xYMq+HpiUMnIylYxEDNK6CM5BsQxgLPX434xULCRiuXM7pvjZlRwNW2J8LGZG1kdQn1sMA+G3wZpJBDRME+J1r7LaLnznRGiBps5Gc1gfPiZpoYzioRr5e47Vy5dq3NgzZI3iPFndA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GsA7Zke5fb4wjHpsRCAiBGDKMkpNbDbWN0u1W7FmDk4=;
 b=DhXbUK+b51en8siLUI4wqILkhavAUNWJ6CuhijpW6/QaAY/3Bnp0SJ9t/BYcg3eutRVyHmMUfb73pULDfphrm2tqixxxIbnFR9FT/N4X/E9wBzpT/kNrmtoG0TSzFGyiqr8oQtPxaHPTp/TtUznU31/Nc1Jp7MC/W5WHPJyVC9w=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by CY5PR10MB6047.namprd10.prod.outlook.com (2603:10b6:930:3c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.23; Thu, 18 Sep
 2025 14:45:23 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%4]) with mapi id 15.20.9137.012; Thu, 18 Sep 2025
 14:45:23 +0000
Date: Thu, 18 Sep 2025 10:45:20 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Nick Alcock <nick.alcock@oracle.com>
Cc: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
Subject: Re: [PATCH v4] trace: print alloca pointers as actual pointer values
Message-ID: <aMwbAODOA4QZ2E6V@oracle.com>
References: <SJ0PR10MB56721752C4BEB7A65080065EC214A@SJ0PR10MB5672.namprd10.prod.outlook.com>
 <87h5x1p1dm.fsf@esperi.org.uk>
 <aMrT3t15+evn9bBR@oracle.com>
 <87zfaroqwz.fsf@esperi.org.uk>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87zfaroqwz.fsf@esperi.org.uk>
X-ClientProxiedBy: BLAPR05CA0013.namprd05.prod.outlook.com
 (2603:10b6:208:36e::28) To SJ0PR10MB5672.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::21)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|CY5PR10MB6047:EE_
X-MS-Office365-Filtering-Correlation-Id: 5687ba8c-a214-4ebc-6348-08ddf6c1ff81
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?RBX88tptcLfysPC67KBn8Ornr09NKbcqdl3vVbSyEGzMaf51JmaLCpvzJ+GB?=
 =?us-ascii?Q?tKF+19LT6QQrBMdJP04XMpHyJkj+T8KZZslQvuJoSDqjCK1jnd5faXull8gr?=
 =?us-ascii?Q?NElsjJsw9w8CA0s38yO/x7mlOmaBdqUMQosgs6reN4pkriWB7HlolU8pDUks?=
 =?us-ascii?Q?8dJoe99VfECXyvz45ALJuWdp9key1slR66rrbrIIMDpv6BlL7FNnEgBv+vm/?=
 =?us-ascii?Q?k5i+hWsTmluvb68WYBK5U7H+h+QlD76pjYAbjVzbmJGOipTJDwdtZJzCp9xG?=
 =?us-ascii?Q?/pyYkf9Lz8/deGNdSUDTZeu/TYerr04Wrzcpo5YUbauY5BEobU8qaHqVlYqT?=
 =?us-ascii?Q?GCDsgT1AdOGDtEqRThLsiWAfY2xDHWf+BvjGm2cKcGGtwENVKr7UlStc2zAh?=
 =?us-ascii?Q?CdhhjO4y9aXDRgSZLGFAt7pUTs+I7kEMMjBmCI8AvBc2e2qg4fn6E+Wtuj9u?=
 =?us-ascii?Q?Gu4HDLo+Tf0EtDvIJEvxIOPWgyNEr/Ygk6BUOLaAPgwhVgDrhJoxvJPCGnb1?=
 =?us-ascii?Q?wQH2HAxXZTWHMXiXz5FKBzRd8JL+rexw+DAhY1R7aKuRJW98xxsoTM9YCvYn?=
 =?us-ascii?Q?AB3wJfvJvUQne5ISOklJ7c0NaSiCW+3mbSfzz9roUpKWDJEUWON2+d+BfcEB?=
 =?us-ascii?Q?GsBd4dHXAkZ4/zB3d7p7kxYeKp0BMC1QzHRHJzW/3Ul/JVY+1RHoVT6msLBS?=
 =?us-ascii?Q?y9b8u8yIEjZgBpeVX7LNi1iAW8F4H7+I3tPUUTMB3eDb4LxhB/BKEadksJNg?=
 =?us-ascii?Q?oLxxK+U2i+QCxEJA/ksZyuuVWlc6WpbrS5u0jNTKfXwbVlWELnAtvO/xOq3x?=
 =?us-ascii?Q?WLCXB90O0Olnan5HqdQWPGQxX02sHWZrX1y0FcU8YOsYK5wyDO8qXBIzBy6K?=
 =?us-ascii?Q?byzLZAgVb3cBB8+Tc7zYUYRZueD5U1TKDf9qk/nxdm6h7iznSNrXg9tufADP?=
 =?us-ascii?Q?drHJMtmsBtcGov3SNnhi1stdCrr6xFeoUxIeG3mq+Gqk7S1EJiq5Dys5uW08?=
 =?us-ascii?Q?Kaf4pfZzNk/CXmi0SWiHtdItC1SI1nhzBYeXijAVfV/W1GSr65W11IwvEcoY?=
 =?us-ascii?Q?4sRMYKVQan1CiDTf2h2T13AbT7rNAyla44bWmZhC/DjQuXVSvorFh+qbCZm7?=
 =?us-ascii?Q?rjHP/pdnVqSb8PUHTAOQybAtIiN6+qI+R+XWTX80U4fi7gcT2AX1IUdbse4k?=
 =?us-ascii?Q?BIgJV6BYGBIdn4tx8fOx3aLB1ZyiFZ13Mn14TQQNYV3h6WeNn2O570Lr6SUm?=
 =?us-ascii?Q?sKa/IxX4CjAXQL9AZLZ1VYMQeiTTw69mmtDLMe4fW+FShwczmwsmOeRkLN8v?=
 =?us-ascii?Q?y4wDFjA+FCYEu7FImQgaBComO6Xe9ytVFIE9jQrjrd3fIs+t9TwW6UK/AfpH?=
 =?us-ascii?Q?ipYINqKQzI4UkYkIvvMKsvZT3jpvzLXo8LO+JQpzIKd92yblW+I247/ZP/QQ?=
 =?us-ascii?Q?5Vy6AArTcy8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?tZAf1Zx0veTs7Ajk/QaZtipOBtAbzCqFuHYuqk2/8dnK0QYI1qoLQsYipfkT?=
 =?us-ascii?Q?+4fTtArvywJOBoyI1dXyW9Bpj0kesHERG30d97MpkO/x3wZBR1F/p3z0Oatu?=
 =?us-ascii?Q?gbPrDiSOEQQyIxIQOAid5agYBBhxdvS71yHi8nBKmIsGqiSEHp93ERfS/pQk?=
 =?us-ascii?Q?7zv87wdj90G29NYeSOjdlLky9CYS74cgoqVc3VlfH1O7AUKGp9rl+Dmw1r1Z?=
 =?us-ascii?Q?QhTow7IK12fIKEkoYawA6m6wHq5nImEcFMYkNjN3Fk4XELULB4EI38hn/2Nn?=
 =?us-ascii?Q?qJQjUDK46ZQ+Hl2aLV7Jn50kbzlpjHSQTuYGiSxgxWfBANHxuGwtMhsjliB3?=
 =?us-ascii?Q?1x/unh2YXZ1TCt4e466EIKtQbKoZPx+ncHw9hpQGyLOzt2D6dMEDBBM5MszU?=
 =?us-ascii?Q?yJM7AiVgfm3AQ0NsKM2hkWpKZpqZzT1FQzhO7NEiIxR9Kc5PXU31/VvgwSGg?=
 =?us-ascii?Q?2r/4UEqLtu5rCy8+QxhD6A41oUFtcCavljhpNq663tN154hfRb6JHUOn04Ep?=
 =?us-ascii?Q?Sia1dlmFmY0ccCMg9kVeIEVqMuJ9ongsJuQzsxtY3FwGuvjfUbyUmtKjRQM+?=
 =?us-ascii?Q?WoEhs3L9KgkEUZminA6ybGTH+jfz+WSHWcGuxiYmIFJRkJgxrpJOttFHpAcb?=
 =?us-ascii?Q?Maz3YqvWLvGmakd1HG2DbM8sKqqlzH4hIxbeYgnIVKB2yyBW0LlSEkbnNeOn?=
 =?us-ascii?Q?dkFkAtqwZX2M14Hj7PwyWuu8xkc1zPOvgkc4QgznIM1LaoFW0ACMYXCBaC6b?=
 =?us-ascii?Q?hufNxqQeLdRRkqUv4v+U47DDfzui+gIxrgPc8nC3TbK+c+CyyYuF/KvwcvAj?=
 =?us-ascii?Q?r8cCu3nG5TPME6pioDBcd2qjzYp2XfBtcM2t93hexq+reMi8lOCsaDgs2EpJ?=
 =?us-ascii?Q?WnW14OYuhTxEMCxFx1oDSqJ2wkscxykw1GXhMlrL4ZjmNV2OSEXqnQA7+lQ8?=
 =?us-ascii?Q?7cMXJSKTtrkqLHqOcgB3/0UE7yJBj2S/7BjK8t6w9dzKsnYzwKd8Rvsa2n4K?=
 =?us-ascii?Q?F3gVsm2qtrQzTvAHTu0QHzr80VNVumXcbeN67XfqETI5Xk1f88RzFPXdMueL?=
 =?us-ascii?Q?QIEO8w5PGa7urqPXZ3vVMRyot8p1FAa8hLxRT66cumtUnYbNq+DzudnIdApB?=
 =?us-ascii?Q?5HtovfESa25vbI+WEZbB0M7ZYGcaziCHCLyeTIp5lFte7suLHSdgWNPZyEKn?=
 =?us-ascii?Q?LLceThXNQfD6ogFLy4IxF1nLfijKexp1M26whQcGJ49uAK2mSjNYzqzBHBba?=
 =?us-ascii?Q?XGYV/FUO8+vB3bUHAaXpAGUJzZYyqZ/Bulw3sTZFz3kkH84jTx+WiyzsJF3n?=
 =?us-ascii?Q?FLQcrAkYhFvZ5sp14MInFIp8d+fwydsFEqt0hqlSJ4vK6BcbtM/BIl3EAQti?=
 =?us-ascii?Q?wMERu2SkNwEAWCIlsSW0XIDeLF8r7t2LLpFAXYVcxn3sUCGdrvV6S6xcYFZr?=
 =?us-ascii?Q?cOiYEEy2g4MmvyNKUfCKpGnMIlUbtynhzxVXzfJrQDORs0YhVdHu/4f+ue8d?=
 =?us-ascii?Q?7vMjmXceUcDsD67jG89xqWVYHetlv31ln2kZ+tuEw1Guu2UXeIe3b+K12dG2?=
 =?us-ascii?Q?GXS+4htTbZ+ksx6YO/w0F1KKqI/1dzCR4woMq9HYxasQXeU/dTjZyoaQ1Pm/?=
 =?us-ascii?Q?cw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	+3atd5LaHTRH+np0Adeg7YX0o1Bbg20RkEbxyl+g66jiyPBuJ1t/9XTFJXrX7YGvDmYuUMburwi0xSPvfKng9e+j/bJ7Xe8Nlf/6VQMAIvqLtYTLlmzEgMljGhH/uBCPPHiQHnkeYCz47jN5RZVUyS1vuhJnyH1BtR5NFPuJCuygmCkPyPj1/fWrseAq6G4Zwuihpv0I6vd6/kNgsV27+2/fSnNhhKj6NpqG9kVbpxI+Fw1pZQxh95tktiURFIDkuLAXBGviov+F0n/d4/QhPysuwO5QUj+3H9fV4Nj6Z5oUB/XtOafJtOvHBaKRyQTIP/fbQXkhoo20GqcdmHqq4ma5hpdWuAXoJRTm6ihccBzPX1eUxvApUL3VuTjMOyYghsxU6i7KQHr4dztjwiy1OltTiwhA/gIz5v2gMFFPPH+x8ILnpZM9l86htD9bB1x7FyFBPVL/xxKZK6fZ/0tIAz4++1pw7x4/X25w/jvp7nqSJOro8qTrVzYGQCfC08E/grFgr1O/jEWi8wyAlfc2w5BmUde5CqlLC3nKBmCvpHA2A9JwdybHnGuehhepxS1Cg9UnIWWQPQDqSsIHzAnTsjv1gF2ha55bpjlNuShuLBo=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5687ba8c-a214-4ebc-6348-08ddf6c1ff81
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2025 14:45:23.5102
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xU6NwdNaZg6CDoKSXE7MWIjaCIVy3pKLEwZhQs+g1G8wsSxC9wx8R998b/PmbZRQubfvA9XcjpJaR8C5FaU3LMA9TcI150H6IPwbq8QGThc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR10MB6047
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-18_01,2025-09-18_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 malwarescore=0 mlxscore=0
 adultscore=0 bulkscore=0 suspectscore=0 mlxlogscore=999 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2508110000
 definitions=main-2509180133
X-Proofpoint-ORIG-GUID: nwxhZDqMzdwTFRamBwhj5kN43SVHPaN2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfXzu0MXDn9a4X8
 CTpzwmdPJYyt7gxllbkf3T3CbUDf4zNhYYNMy36WH2mtORCA8sudNvtmpZG7DM8p+bduel0/O5O
 mS5YLXie9F7w75dHgAaUX41uXrK+9PVQLs9Zpk82TeBfzG27HnE0aHMoeKtZa3V6OWab6EbqQin
 2gqs3QdI4jjFDAmxqUaeJG87NpK7pAKPzmGMV3dnIrDIR4UWCm87/jIzxPoe6hPr06BAXZWc5zl
 R/MJiGb5CPO4cVc3agYyRZ9rOovj4A4rEzh3SmTmMteCyT3SW7MPMU+hG8eXt+bJLIqTMS1vUuJ
 CYMl8C3l0h2oJ1zkW+lY6ugs7+/7xpppiDVMg6FblG81Hn/fH8qlhZQ6Dq3JKR9vJ97ZeaqUnyD
 HW3sZJOTSROaer0qp68NNsmSbV7rFg==
X-Proofpoint-GUID: nwxhZDqMzdwTFRamBwhj5kN43SVHPaN2
X-Authority-Analysis: v=2.4 cv=C7vpyRP+ c=1 sm=1 tr=0 ts=68cc1b07 b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=6iKgTlQiVcvIgMSgmQ4A:9
 a=CjuIK1q_8ugA:10 cc=ntf awl=host:13614

On Thu, Sep 18, 2025 at 02:01:48PM +0100, Nick Alcock wrote:
> On 17 Sep 2025, Kris Van Hees spake thusly:
> 
> > On Wed, Sep 17, 2025 at 04:03:33PM +0100, Nick Alcock wrote:
> >> On 16 Sep 2025, Kris Van Hees verbalised:
> >> 
> >> > Because alloca pointers are stored internally as offsets into the
> >> > scratchmem area, they were printed as small integers.  They are
> >> > now printed as actual pointer values into kernel space.
> >> >
> >> > Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> >> 
> >> So... the change is to generate real pointers for children of alloca
> >> nodes too, and scalarize more aggressively? I don't really see what the
> >> second part has to do with this change (and more specifically why it
> >> didn't cause problems before now).
> >
> > It doesn't cause problems - it is just not what should happen.  Since an alloca
> > pointer is a pointer into kernel space one would expect (and legacy behaviour
> > shows this) that printing it would give us an address value in kernel space.
> > Without this patchm we print the *offset* into the scratch memory area, which
> > is certainly not a valid pointer in kernel space.
> 
> Ooh true!
> 
> > Because of how code generation is done, it unfortunately requires slightly more
> > complex logic to know which values to convert into actual pointer values in
> > order to store them in the trace output buffer.  An extra complication is that,
> > if we are storing the pointer value into the trace event buffer, some versions
> > of the verifier will complain if it is a value that is marked as an address
> > into a BPF map.  That is why it needs to be scalarized.
> 
> Aha, this is saying "if this is not being dereferenced, but instead we
> want its literal value" (e.g. for pointer printing) "scalarize it to
> lose its mapdom". Presumably we know that the result of such a REF
> operation will never be dereferenced, since after scalarization we can't
> dereference it?

Yes.
