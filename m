Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69FAE19D09C
	for <dtrace@lists.linux.dev>; Tue, 15 Jul 2025 14:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752588888; cv=fail; b=RkUIhlPoRi68wYTetBqP3HOwwEvMwVLuGsg9TMjxQBomdodqeOfTKu6b9E6pEuOuTnKjOrKRkQD8n5yQ+RqjFOpKUFy3mlhDQORmscJ3sqYX/vcrSlAPbOeo5DYcaonb+FStGhmFVXO5GMbGx1jISh0u9XeLPuDaiQYt1CwTcf4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752588888; c=relaxed/simple;
	bh=5jsffusfPt3x2I4lFDa60OkkmTINVV6EwdVxKxeAj8c=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	 Content-Type:MIME-Version; b=BVAzcR04gGQyG2DbfOjtbju/xacTZQ++gqaNa2MSYIW13zO7GgBmYnqs+7pEsllUZiGYaJdGVDBLTJhslt6mPhMDKwqVbcKgbmpQAqnjNbBFuiuR1GNcIE6HE+lawRCCOASitEfmlja7afIeI0EbcwBdWmzVMv/LVJoB4WP6M8c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=RYQAkQeY; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=EEq5QIxL; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="RYQAkQeY";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="EEq5QIxL"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56FDZEh3025913
	for <dtrace@lists.linux.dev>; Tue, 15 Jul 2025 14:14:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=BmiVxhYHmVplw1mMmZ
	F3rwzvIT3CYGORcQ12PpgiNFc=; b=RYQAkQeYHdFMGXFU/ydmi4428eRVe/98Cx
	VukD1qUE63E8bqhPN08S4jz0DRWEstalB0CvFP7lHoctncEJTgcO96hx/4iML/vP
	OYBHrQcjhDbrvzULzZ8ShgaSFN6ky73fQngaYDS3/seZKracKTU8T6s+geSG1738
	KoirLrf/lEBn39utZkbzu/iCDcVFP/wZM5p2j6QHvpeZ4fxm2/gbii2G1Fo/l0kY
	wvqBb2kQOS0WewyB1vyzbfk7UlhPGdaYz61wXVK4GdAKPgEUO7+1kwpmyIkE6IWf
	QczLTrTnfgiNQ5W37IJW6sHGFOTPwfsDYXuD8lLt1tz18O2W/0GA==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47ujr0xpg6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 15 Jul 2025 14:14:45 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 56FDvppY039682
	for <dtrace@lists.linux.dev>; Tue, 15 Jul 2025 14:14:44 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02on2054.outbound.protection.outlook.com [40.107.96.54])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 47ue5a1ux0-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 15 Jul 2025 14:14:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HqKgszZC7ufOsy/ZKkXiv8a56iNOXbwKCenY/3QARR/ow3JoGJBf48+P/bvgQiQMxpB+rSgO2WtJYLUzh4U3/J1hQQPZ1A0rRarYavQuErynZcFuLMRkL1IDpOMp2R9kT29vgBUdkFvzTp9z+zknhFVW9L/4xFo3h8vmzxc6ivHJ+zaXB24Nh+HiLIYSsvVWO6+NQIjLAcEoeoTDEnauAdy1d1CbPNXbC6QnbTpseq9BSObTMt6dUpDuQ+bO3Z2qbt6VU3tfTDDnU0Q665ZKkl9lSYhgfrBhZVa6X845eOlmY2sdlOSTZqDqEoYxNCBQDApvqDr1VpZbU81uUdDW5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BmiVxhYHmVplw1mMmZF3rwzvIT3CYGORcQ12PpgiNFc=;
 b=m1hjKwmkiKTf5+sojo5cWEs82P7kyhKv2ifjeOhj3bIlpwfO/BtwCRwlbAkMnEJatNrYC5ytWaCuNFqGfHxZjFiaCoxOpUcqOkG/y73sGbVywPdZns0TtmJ4VAk7j/HoWEverwMq2iG7wqVdo36vJwh1YeuW7JT4XBUOCmWZdv2FPaP+2QdO2M7l+DLn2IFoGBW8597lyAEWzXiDKj2K1cT8t6UFwMwzHtsxOQ5gXrthsO68ZxO2t+AGsX7SoeZsYNLjH7FrnW4FqqBHWlWs4uGpk4qNrWMz+YKl5nxUAcyLEN0CGv8rJoQ9nvqOV2r5fyWw2Dm+AVrB4ow/TI2qSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BmiVxhYHmVplw1mMmZF3rwzvIT3CYGORcQ12PpgiNFc=;
 b=EEq5QIxL8jdxQ/1YTElA5ADxlgzwq1qwci+ZokaZlj7+95x5/jkqiHER5sJJRr0ze7a+vOYOdwtF3Tc7Dc9R79Ah1j3ABRDJpMigKhYVecIL1A7/HCj5jIVCAt7+7bWkrxvgF3Wssm9oQ4lgSqvmPn6wiKoYgiRAM4dx5sh9cUE=
Received: from DS7PR10MB5037.namprd10.prod.outlook.com (2603:10b6:5:3a9::23)
 by SJ5PPF04D2D7FA7.namprd10.prod.outlook.com (2603:10b6:a0f:fc02::785) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.29; Tue, 15 Jul
 2025 14:14:39 +0000
Received: from DS7PR10MB5037.namprd10.prod.outlook.com
 ([fe80::824a:572e:d9d7:e9f1]) by DS7PR10MB5037.namprd10.prod.outlook.com
 ([fe80::824a:572e:d9d7:e9f1%6]) with mapi id 15.20.8901.021; Tue, 15 Jul 2025
 14:14:39 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 3/3] usdt parser: make sure prbmap is cleaned up in case
 of error
References: <SJ0PR10MB5672A2F843CDC28C7266DB9EC278A@SJ0PR10MB5672.namprd10.prod.outlook.com>
Emacs: featuring the world's first municipal garbage collector!
Date: Tue, 15 Jul 2025 15:14:34 +0100
In-Reply-To: <SJ0PR10MB5672A2F843CDC28C7266DB9EC278A@SJ0PR10MB5672.namprd10.prod.outlook.com>
	(Kris Van Hees's message of "Tue, 24 Jun 2025 17:40:27 -0400")
Message-ID: <87tt3dsfqt.fsf@esperi.org.uk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.3 (gnu/linux)
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0031.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ae::7) To DS7PR10MB5037.namprd10.prod.outlook.com
 (2603:10b6:5:3a9::23)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR10MB5037:EE_|SJ5PPF04D2D7FA7:EE_
X-MS-Office365-Filtering-Correlation-Id: b3b55394-7958-436c-82e0-08ddc3a9efb4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|10070799003|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?OOracQWG7KZVeymcNZ+JKm3OqHG6pTHIhp5AJXG2Qyt3yqSqFg82+FgA8E4D?=
 =?us-ascii?Q?pkJsB581rkr3GZ6+ctVMtEotVoD8/vCQgx5rWmdO6HJS/Wh5BAkRxq2S+H18?=
 =?us-ascii?Q?Ru8vaJih5dhTWoVEurLO9cI5+vCd+jMO+YAgTdwv7q64vMIF+A5FsIjUlLC2?=
 =?us-ascii?Q?NKSU+Yg9Qxj36NIjo0SOBcsiTcD3b24S/P+8twvhaTyqHPd7GI+2mvN7yZaI?=
 =?us-ascii?Q?TCTipWdd17oeB9MQJYbVQO0WVEwVMcNbh6bzd1Upeo+Xbmclz8rt5HRxdAlT?=
 =?us-ascii?Q?fzqiKSPJcoIAjdX1GJ1PeOboXz8MbHqCyepBRjM3IUsWLDQfa4TRQxc0QHwa?=
 =?us-ascii?Q?1vkRpo26PH+CjuDRQWlAWKW+b2SkQFN6RCLNGcweFBBzIO19hu2zfBX0moes?=
 =?us-ascii?Q?hSOeO6K6hB2/SvRImapOlr3Jq7cCgu6twcgwfU33nT2FISDf0za6IV5vOlhB?=
 =?us-ascii?Q?2d7MQSquSPJDU7JTtWnNeQzUnBew/pEGLh9r7UZrjqs7NFMa7WimYsCOCnbs?=
 =?us-ascii?Q?NqnT5J042hLNFnFkJGJxCVkyi2mHNv/OVXGk6KyuhfHQ9EM2oWrKwHdr4yXg?=
 =?us-ascii?Q?BDc9GkDtPt0JfE4iqD2fFcRgn4rnrB89UfESTE2ZK9ZNG/HkeDYZSoadINwq?=
 =?us-ascii?Q?tzjCGXU3V9CRUuChjbSd+VrATG9xbn2Ou+bsJOgZcOslQ0Y2ecFcgwkrOo/M?=
 =?us-ascii?Q?zNEizunnfg6D2eOk4TYjoSnzQf8Q1njGUBi7+BvOf+zyt4g555PqenlYLvSX?=
 =?us-ascii?Q?bGjjgbeBaOrSgoEEK301KKnaQzb7QR8Jshvcw2ATRg50PmIFJgXNggweSIAh?=
 =?us-ascii?Q?p/im6Ss2Lp3YHBzziMDcrQzshlrIQFT/STCZE+ciI1VR5LNOetnrCgnfpfZl?=
 =?us-ascii?Q?hmM7KHT78GLm83IF00cGTFKutLM+72PaRLOAdUpg1b/9Kog/3P4fU2ihBDUp?=
 =?us-ascii?Q?5lqgGkrxLmdCXVq/O6AY47foo+z3Ruu6WEfE7Q3TDReTxXL70rMEqDa0tkdb?=
 =?us-ascii?Q?OdLB6UHzCLWg+yGpG5U2NwLqHWSHVCWXXRQsEmE+ThYvEdL8+DKcIFpV6PVe?=
 =?us-ascii?Q?HWpTGdUYSqha7ilal9Zj9/hMNlqC07bTq1+anbIAUPDhG7HGwQPzFQXKIuwQ?=
 =?us-ascii?Q?jkHHymJlJetYHVvNtTsglTuhFebak/6nQFiKQOgVjY4khkB+Ljz8Nx7VFRU/?=
 =?us-ascii?Q?p6oINiuQsTN10z7o9sHPrELdSbZse4L7/dgEDcDk3eOTUE5jJnemSEbDZ7QG?=
 =?us-ascii?Q?wLq+NLXhP03m91n69Qm6yi6o0WvZrtTv8wBcukEzC5sZkuQeOk6at0nk5zY2?=
 =?us-ascii?Q?4BOgfEs6Ok9LKyUBRtmWgJSgOTpP89k7fsDe3Ofe+mTp5OKju+JOAZEcjyeB?=
 =?us-ascii?Q?ke0fcHiF93uEdrO7Mkm6ZonplpCOqckjaeq+7VKjo8Tp+RSFjc27hcDXFWkQ?=
 =?us-ascii?Q?zfLbqdoTBIE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR10MB5037.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(10070799003)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+X4Kbkil/o2QtTD1egxjJd0sbnSFrmJPPP8OjKzBXtsFTgZP7NlT4vkuW3Ds?=
 =?us-ascii?Q?iQyRwJJMQ+5u48o2iUdVM5JbPhAB363vwKbvbGewspJesZ4T9oThpYe7jX3C?=
 =?us-ascii?Q?4FHeIoSPAot0/mO4o5HnrwgwD3fKlsTz+Oro/+IMp3fafpexPMo0Lf1FBEpn?=
 =?us-ascii?Q?wDnLTp1h6qpbYkfQbcNogyyVGJU4zYiNL0nbPKbESqhxVwfcN8ZGC8vhcXJB?=
 =?us-ascii?Q?o0205mRVDpu6SVIJZnhmFHIrUOK7PAZTkMsYiJIAVag3qyi0hr2pEyLu+cs4?=
 =?us-ascii?Q?+qDCuhswxOZbBAf6HSjoeGSeRyb5zgmUYvCBdxCHBhTC85wrfdklcMQa6Cor?=
 =?us-ascii?Q?UmhzYCkGeofteELqzlGQIFIGNvgz8QV8bi3REW/fyCZdfpnB0iAPF5EljlIh?=
 =?us-ascii?Q?wTZON44laWcwVLMH0s0ypFWRT6ksI1KLUdmX82xppXFnXziMYIyctP7kJvAB?=
 =?us-ascii?Q?bOgK2Vnxv/vyBxY9WQH8zej1Up+1F3dB/Tcp7L43pIDixk/QwOpQwQ7//L+1?=
 =?us-ascii?Q?skfB8teh4XTGNpViUTmmZLA6BJo3OGd5lLoAei5C6meWcLpNZuifq3lkcfrq?=
 =?us-ascii?Q?gYNmka8HFXZubpyifhKsj/iXytpa6PH+2I/PteoE8xpT5slaKgTn5vd44G1y?=
 =?us-ascii?Q?PoiilGO0oA0vLQA4QQQnCZmqLOVm2lUPKQqSzq7QFQZTb3Saw0UcSjdp88O6?=
 =?us-ascii?Q?rk7aEECd/6KC4Rdsk+JJOSNebEVfWyGUsJ/ZrfeZosKbThXAftAup5DL4KXU?=
 =?us-ascii?Q?FQhuVBogyMdwCYRVJvn+FHtGQjh98OgMwokOMTm+pD/6Z0ozk+8aMr+J2RuW?=
 =?us-ascii?Q?4gkTs8Kx5Z/9pZDZOHSZtEdg2oyQXpVNpImubaVPKg9yVqkxIZNyYdq7q8XJ?=
 =?us-ascii?Q?Wi4hOlOlOtcj33g671xCMjNhWacluvM+Q2+mVXEOLJHveCENZttHdNtNyRLA?=
 =?us-ascii?Q?pDuLFNKxxg8z/7fLhLPz6R/hii3wQWb/1IoeGsUYIPY8TMFy59vmgx11e21o?=
 =?us-ascii?Q?MU9z/l42VxvNcX6Csdloh/AykfKlYwt504TAeURKIxdoQWM4qd2FOY4woNTN?=
 =?us-ascii?Q?F3fe1AtycdvTYOMUY2QpHoS6Lj8cKL+CSzzssuRfJ8valQx2RycQNntsgQ/8?=
 =?us-ascii?Q?9kB+4l/zlYryGctjyLvtLrEUAb3mxOWz06hSNWrNvBv9cY7jZz9cJUUZ04VQ?=
 =?us-ascii?Q?LTfzjwSSqvQvpREC+C75mlzyxK3u5KWjOUq55tltTnGPRzJ9lDAfp8y6/AwZ?=
 =?us-ascii?Q?873a127EUEh8ioc39ovLTuyLr4DjGbRBkZSEuE5r4e62v5KffRhYErxw1rgj?=
 =?us-ascii?Q?m3OP+dLG1uWZNGUiTPAIUn+434b9hW8F3RQK+MIadqGx2yrRn5ieqBq6ns1A?=
 =?us-ascii?Q?RmK+RlL19BJziRVmTFvDJz+9TqHq3rhrvzqx7i3j/wCfGZtlr0az01lZDtk8?=
 =?us-ascii?Q?LdeApsJf0rojG4sr1ppSmnl9QJnnIG3nRj/KQZ5EYPJ2MCKSsiDnoq4zsP0/?=
 =?us-ascii?Q?wt7Y+kVRng3fKwCkppA5Gd1Dnf33+XAmh2U68MidD80xHv9zEW25ZvAKZns3?=
 =?us-ascii?Q?4oIMw4j0LyqjfQFbEoHWg3De5HMa81Es9WjUPQXSSFOZG/sQBotmBW+miJhY?=
 =?us-ascii?Q?vg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	X/g/QmcyWdzIRUnWYwUjCtEMTV1bIxjyqjg1wBCQPxQilkLyd597rwohHGeqhsx+vDG9A8VjjhjYc7AoDv9qw/NRbLX0YY5vF7ZyhJWm9pEzrOoXAHxhKoy+15l/gNM36piPKO5NI7bNORIHafmerV148AybekgtZWVqmAe/jSmxzmYuDkynBROMqMgx6pl8bfFTrLoSRH/vqDj7zxx6cgMrEmPcKZgP8b1Yp8wLAhVpMF+W2ENyvgMpognC2vXyab1WM4nCmBqysNq0pcih+T5Z+UaeiZ1L96GR9ou4rIC6lVWuwa+Inv5v6idl1jJLukF0jTbgPfrnqJXumCoXT+GW7cwtaVoV+c0EyOBxkXF7pF0o9F/vh36gZMrN+H4LV09QaarahVVYrfodmC6E38TmjQyvbaoKU+jKU0HPTUR7htGRd81ng/0camqll3J1NdZnzKoQWtNt0dkkDVlvLXY/NNGypnzIgWf35N4BiQyIHJOf/QD4Y35i2Zk2unjLRNLmBQ8SfczPhBgu4cXYQaDJkalPph62qSDoXUz6PoxB9BaNpjNt6P9E+i7d5ecdJEGsWGKkRrDgsCL8uEB6XSJ7x0nSun5OxH/ntarwu+c=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3b55394-7958-436c-82e0-08ddc3a9efb4
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB5037.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2025 14:14:39.7639
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q88aKFSRYUY2TCp1VgZpo/9n00Fvx7wQlHa7UoRVQGDmbdquJ7N/W+4pcDYcn2E+WYyhMmVusVQieHPKrROO/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF04D2D7FA7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-15_03,2025-07-15_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxscore=0 adultscore=0
 spamscore=0 suspectscore=0 phishscore=0 mlxlogscore=999 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2507150130
X-Authority-Analysis: v=2.4 cv=d9T1yQjE c=1 sm=1 tr=0 ts=68766255 b=1 cx=c_pps a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=SJfOT9DMDMLufBhu:21 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=J3lUr2Ae-0lhG3SsDiYA:9 cc=ntf awl=host:13600
X-Proofpoint-ORIG-GUID: Kt9Z82YiNjQYSL05cLZRJqlB2iPfyO5u
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE1MDEyOSBTYWx0ZWRfX9cGH5ZwuuQ8J 3yi8C0+t6FOFzr2xy4CWZ42JpBPmn0foCa2IhWbLvEtc0ASc82qC0Ls9Dih8Pf7xfifKhjJ+5nQ f5BOEyIeaV7PpN1VZcOlgKjJ0lTckkslCOkpqIYXb4VHAiY5BTU72FdyAuCX+LScjCuxwlFuBbW
 bQfSlkr2zo+fGXDqykTdfnWtaej7eE00RmzsxMaN1+Dp3FSymfVB9J7gZjY/RXwW7cwlMChPvKR kAOR/KxBJiHfYb6bsgqgFERKve+RPLpupIarHSP8MCxiY146KEU5nptcFqoIJLZFfpO+cNBhE4T KXw1JU59mmLB78Xu7OR+xX2dWzE87NcBY/6Hwaqt/q6IC4ERHKZM9Hl7qoBjAYiZ2345hH9xhft
 XpjcXWya0qL4PH8EQxMbqvJ3UzqfpnAd/6k0Zszm+RImwNx96it1bLiBB/lR7tdTOFte2GoJ
X-Proofpoint-GUID: Kt9Z82YiNjQYSL05cLZRJqlB2iPfyO5u

On 24 Jun 2025, Kris Van Hees said:

> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> ---
>  libcommon/usdt_parser_notes.c | 13 +++++++------
>  1 file changed, 7 insertions(+), 6 deletions(-)
>
> diff --git a/libcommon/usdt_parser_notes.c b/libcommon/usdt_parser_notes.c
> index d3d744fb..c98c9fb0 100644
> --- a/libcommon/usdt_parser_notes.c
> +++ b/libcommon/usdt_parser_notes.c
> @@ -829,15 +829,16 @@ usdt_parse_notes(int out, dof_helper_t *dhp, usdt_data_t *data)
>  	goto out;
>  
>  err:
> -	rc = -1;
> -
> -out:
>  	/*
> -	 * All tracepoint probes in prbmap should have been removed during
> -	 * proessing.
> +	 * In case of an error, we don't know whether we can allocate iterators
> +	 * so we have few options to provide cleanup.  Since cleanup is all we
> +	 * do now, we plug the probe cleanup function into the ops for prbmap,
> +	 * and let the hashtable destroy function take care of all cleanup.
>  	 */
> -	assert(dt_htab_entries(prbmap) == 0);
> +	prb_htab_ops.del = (htab_del_fn)prb_del_probe;
> +	rc = -1;
>  
> +out:
>  	dt_htab_destroy(prvmap);
>  	dt_htab_destroy(prbmap);

That seems... better than we had before. I was seeing double-frees all
over the place with what you previously committed: I'll have to see if
this helps.

-- 
NULL && (void)
