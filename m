Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C22A1FC0E6
	for <dtrace@lists.linux.dev>; Wed, 30 Jul 2025 22:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753915201; cv=fail; b=TOxv+iCCXgFuRZVp6acP+KhaL0kcrMlRhnbjxyhQulYAmxQSi13NFfXdy9nvOK8YODQUmjrFdRZSX37fvKLckEwnUll80vGowT7F+ALmSVhZzNMv2UVI7Yt8iIz71fd/yQ8l0zOs+IY792CAvfueTxNbDTtKNTYwD1MT1+uM8+8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753915201; c=relaxed/simple;
	bh=ShdmHipmftF6QI/3WQmiMBApPN83LN+Fd7XZSzniY1g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=MSY51YlcNxOTHSVRCmY4ku7FSLF47nN2d7eD40BvbhMGASp9VqNQUMZsrMgtVAzsEdkqgBEM6ZX1kCm8DqlKlFmuZjSFHQssEHDie3GP4hp0iZmDDdOTDpzfCPegG6gojFvZ+mL+zQ+eDuFTB2wcnWEGtZp4YsxVxgprXgKSZUU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=nPpcGlhF; dkim=fail (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=ttW0B5IN reason="signature verification failed"; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="nPpcGlhF";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="ttW0B5IN"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56UJCFxG009472
	for <dtrace@lists.linux.dev>; Wed, 30 Jul 2025 22:39:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=7oF701qeVjjHqKtE1lZx5OyoktNmygQrwcywk6jjsQI=; b=
	nPpcGlhFoKHiMXe0klxAE7hIfXTNwjuVa6E+5YbxISIZ7eWSUHc9EaDtcVJJK19R
	K6MwAmZr/BI9CgxOl2eO2XdG3yW4P8KgmskUswG/Hr7+C2ib32HDGrz4sufho+u5
	yjlQXu14qLCLBnnFV/OdBBi/B5PdVvbTSiw9U9yxXVfkkHxleQGCx/x7l9CWxgE3
	0GX8j+inEY67IAJUknpFOu/gTwcrRaIGhjMeUgdyt8sAbzcCod8RBbe7nUdKr+3s
	fwSHUmc3t5D2aQPqR1MgscUYS6CZffmQ/V7giYPWie3nfPO68RobtQCQrlJ0RDtg
	a/K2CEIec8Gz+hnvexdhUQ==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 484qjwtys2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 30 Jul 2025 22:39:58 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 56ULFIaV016791
	for <dtrace@lists.linux.dev>; Wed, 30 Jul 2025 22:39:57 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02on2086.outbound.protection.outlook.com [40.107.96.86])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 484nfj3aj7-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 30 Jul 2025 22:39:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MWtv7Ewdw3P3jBl8fjHre2UVSDXgZRe7ej+Mwwq6jyFj8J5eNyv8eMULRx90o1rqvemRbVb4qac7jPlKZ3nxvbj6w/FOO7PkqS6igAJtWkpk+xU3W798ANzVdixPDcLiHYfAEZkhUVKEJ7zDAURinBrSNep/iRgyShkgiBiSl1mAZzigwEF/CCUSVjXM5YCFq6ah/+lKZDaMBFFsZVHxSKH7CDmUCkF4VoObil1lctpTQqFysomc4Agk0DdQCJmt53ey2nvxhoB8OBYDZpvrmTLUCTYhR+eFThLOwvSBQkA2CAY2IcfNdfToB+338Kxfrq4kJ1xfvfUNAdOhKPtdQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xd91pu/+iudu++Muu1GgRd4+K9ountJmDOs4Yow1VH4=;
 b=GO9ZXRmUHzPbdTCK5ruuKIl5BkzWcovS6dV8FT0IQ+tFaerR5wTxcWvD1av+yRnNVKypbR+94UV/lLH7K/4MD+R1pquzlIzhS9EzUIOOun2Hp/DOT2loxRDCyLq1Pwqg9sUTUFLfykbjPdvXaB6RDqjLvhIxXklmguEpiQDyMAix6wYjjoiWYkf4Hs59agwnaVsDVEAmqNYm7gvWcvu04dxIjEfPbFeR5KbKG6VKQ8Qa12/sQ8qO0LuTnE0/W/cPjkQW0QAo8MTjEf5zM4py0wm4lSQ0zSxUfxXUr+4mbM8uReKMOlMPxHWZ2BvVk2ztvXVa8u3+V6feV03KvPdo3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xd91pu/+iudu++Muu1GgRd4+K9ountJmDOs4Yow1VH4=;
 b=ttW0B5INzOjOYuj+lX/PqVviL9bOqJjcCX4+2W6HPSaLbE+Lz65A2FikmvjSrFJaGYtT1r2AiABiQoXf8ufBQ/GZhue+u0Lry9hYv0wLE/pZl6kAT3GkDewehxr3DQptWFa51LQFjdWNtx1J7VuRcb33a+vWTGSK+AL1zZZXcVI=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by SJ2PR10MB7670.namprd10.prod.outlook.com (2603:10b6:a03:53b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.26; Wed, 30 Jul
 2025 22:39:51 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%6]) with mapi id 15.20.8964.023; Wed, 30 Jul 2025
 22:39:51 +0000
Date: Wed, 30 Jul 2025 18:39:48 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Eugene Loh <eugene.loh@oracle.com>
Cc: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
Subject: Re: [DTrace-devel] [PATCH v2] test: Wait for output to flush out in
 enable_pid
Message-ID: <aIqfNKgdHaS6R6Nz@oracle.com>
References: <20250628223050.3396-1-eugene.loh@oracle.com>
 <aIopqYJP3yn8DzUf@oracle.com>
 <aIorqcS0sGZ0UuHS@oracle.com>
 <251f2ae1-a884-4a97-49e0-c0fb419a92f3@oracle.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <251f2ae1-a884-4a97-49e0-c0fb419a92f3@oracle.com>
X-ClientProxiedBy: BLAPR05CA0008.namprd05.prod.outlook.com
 (2603:10b6:208:36e::11) To SJ0PR10MB5672.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::21)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|SJ2PR10MB7670:EE_
X-MS-Office365-Filtering-Correlation-Id: fc93cdfc-3a09-4a10-6411-08ddcfb9ff15
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?oOmddQ4WkUXMmTO830uE7En6V2EvF0NsVLnEcU0JsvpcnC52ObcDGAwzoT?=
 =?iso-8859-1?Q?2EyrjNCi7YJyF9mN69hofxgwudlAJS+uZxByC+D2Uqwm86pduVQKleKt3n?=
 =?iso-8859-1?Q?csOjfhdpkgOjsKwbQxxVBMYL4YL/qjkJCU28BMIYCAcrou9moBd4kGFFQj?=
 =?iso-8859-1?Q?dSvv9YExoQcPKy7SrfuKHs7sOzm5gTX9e7YrB3hx/k2d+tDVS0YgPzqTbl?=
 =?iso-8859-1?Q?LGbEueBSBCP+NN1ppFkRSR+H1aF9+L/P7M/ronLL5uyG+178225YE7CVkk?=
 =?iso-8859-1?Q?WKLPDvunkBtnipyZUHb9bbdsh6PdDwUPRMhejNtoCuAH+2Wx9ZyLbDSlZG?=
 =?iso-8859-1?Q?xbggPlTT6q3g05JYyLOJ7OccGpUeCpXQeXjjx938FAJwZ9tS8r93U4PA1h?=
 =?iso-8859-1?Q?YEb4IJnEN6Rxy5e/ymIY9BoAoWh0VMmIoBuQAQUAn41v06ZDBy7CtJrk0Z?=
 =?iso-8859-1?Q?Ca1OuaFwXQr2ZuCXoKcRXuWYR6mhfMGmjtBVhIwB3nEp6ETaXsJemwbgKV?=
 =?iso-8859-1?Q?rK54d4UXF21DC9zn6o8ZsSzcT1kCl56pCzuECKpSqGqRx8yzwB8dpgUzVe?=
 =?iso-8859-1?Q?tQk5Qo6wDsAckamglFnskHZb9ZlRATvPubSxNDZwKS5YpEOLtF0xNp1S1X?=
 =?iso-8859-1?Q?o7W6hl1H6aeOSHLTSXM04OdxSNo/ADNmbtr3c3wr2HqgJAk2h5QVvbeJ4N?=
 =?iso-8859-1?Q?KVmUApznP40G+Cba7SguV5UElDRowSGgRXwBf/2tHf9gzsNR2ahGoLsiT0?=
 =?iso-8859-1?Q?2zy3y5GYqPhdW5BMrCPRP2iNrBzdwONNK+KIN1EJQCHW+eIsKnAEFLTKaN?=
 =?iso-8859-1?Q?iMAE6ptJMrN8AOat4EXs3JQmtOBEVvjI/6bZ/TxvL+BAEBbX1aPb3r/nlZ?=
 =?iso-8859-1?Q?yVrxyNvR09im+ceChQzV5Him5rY5k6p1I03nzgBd8se7CMw7KBekftgduw?=
 =?iso-8859-1?Q?Hap/SzISeJ2XxCeOw2VbV0vgwKcp3J8mACM8mpTj8/9lFwSXcTcxlXpTrt?=
 =?iso-8859-1?Q?JunoVEEoFUqKCbvqXs6gFJdcrd+NPcX2zahJg2NO0e3hfYSIae0IVDWfQI?=
 =?iso-8859-1?Q?2UPRUoLH2Pra+kTEWIyPQA/kYVXPOVZUmTbhmq/m+sbGijAr8fZuOPqWZF?=
 =?iso-8859-1?Q?GkJ1iS36DyfJXSGYrBlvoromfFsOsKEkrWUeATgakApOuwT2P8hMOicVJ8?=
 =?iso-8859-1?Q?3d39fXq7+ipMEnseDIC/mQ3IKX2EmIj6v65Shkl9r+hzmPqEQ/+DPrtKsz?=
 =?iso-8859-1?Q?MubkDi1gi+X09CLG7kgvtYq7kSX8y99nrqUnVwHdzeNH8Wml64xGO9BbYt?=
 =?iso-8859-1?Q?6yzGIj5NH83gNdN2I1tA3SyaG4gcRdvXgi7JQXQdsoDWNIheS9uifyNlM7?=
 =?iso-8859-1?Q?dSavU8OkQwGw71QLfAVKl+PV3sXRYZjm0x6WhtMTLYnzEJX42dtM1skAV8?=
 =?iso-8859-1?Q?wOiAGRsLfnQgORPvtPrrKEwt+t0aUDJi7NJAow=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?cq26UHlOmV/+aRN6ywKT4RNX2nO36wJUEr2P5hMxkAq6iG6X3gYUjW5liG?=
 =?iso-8859-1?Q?lTc58JybOCI3GNdh/RTM78lBEtzGOLMYIGn87y02lHkedyiNkZcPlvDn0W?=
 =?iso-8859-1?Q?Qv4r/+gk9/thZvPUaCrG74/rRRDDQ5b5zTLRFIGiW1r2k0kVvwcDbtG1Th?=
 =?iso-8859-1?Q?1D/CfzxVOqHQ/PADy/t/ito7oxjZ8aN9bGzzrKcTi0WHS/QdP6q1xKESoY?=
 =?iso-8859-1?Q?oD1QD9Blpah6vAMK6WNvkpK6TCl8JzTSMab3l8SOs4FsdBoLGpCAm3CEhV?=
 =?iso-8859-1?Q?6slDNSTaiNfPLPzK+tWjxuRMq87xv/b+CkMx5mhUV1N4J9O3ZSCqq2D/j6?=
 =?iso-8859-1?Q?osC2wjMtuLPeFB8pbsXLhUWqbEwg2aBYLgAXrw+yvmhkgbQLTljVOZhtoW?=
 =?iso-8859-1?Q?4vCssZSTslKTgcD/6UM+O3f5I9dsNUcsouhZEOu4ttMRpJs3Xt/uyiw4FD?=
 =?iso-8859-1?Q?TEbjS1YPbrWXxpef5wPSXMW7yitoJCmtNktmz5JN1zf4lMff8ZCKF4T0/j?=
 =?iso-8859-1?Q?ZDxzGGQUgPgxoZ6f0BaPz8KGjk1ptSqWu8L3gDkAcIxlN93wEEq2KnOhTM?=
 =?iso-8859-1?Q?HnA1POzWgsPGtJE5HH439GT/9GS/+qY8aUJBVHmciHDVfNVRjKiM7zNHhA?=
 =?iso-8859-1?Q?qLOdKx0fcEYIH89RLYb31r4AtlIi//EkOLxftTxBPV7JN0tnWDStVsuLss?=
 =?iso-8859-1?Q?ylRzeSvZSmXpylVX1Gozmv7QJkkII941KZZdAcg0NtV75lmSiOyiom3vZZ?=
 =?iso-8859-1?Q?OUP2kZLhO20fhQDzhgC9QejgAw8zEdc/rFCMlDSVCJenU/Dm4scy5kGEWM?=
 =?iso-8859-1?Q?qr/QtLfAyTXmI/BW/wIbrtAfjtEtI9WXF/s3Id4SOWic22QTcgYUwlTGDM?=
 =?iso-8859-1?Q?2I0c+owElRbxSkUpjbkO0CG/K/8kvTY0XzNud8ja9JbA/rNjRoBWAU992y?=
 =?iso-8859-1?Q?ONHlcTtCCDV4ubByDEjNt6ocTLwcrd+Gjc6P7vLN24vCykTaJDtGUmlJaA?=
 =?iso-8859-1?Q?MwZgcQgO8V7ggfYsLpotckLNRSW65Ee9whoD5jsoq7YiVKlR7syyYEjVDd?=
 =?iso-8859-1?Q?Of3fdzpo18uRkGAmL0DeqV51zLBewJBOJ49kMsJT4osjSKOY/YAKNQpAxa?=
 =?iso-8859-1?Q?X8SZwiVBQgqbNTWXE/FiW48Pz1ZTrIybKfGe2Kbshp2J5k59wucVY774ir?=
 =?iso-8859-1?Q?ARmDNzWUF9/+nm3Hwb1yRyzNLRMZgnFMWFQgKysLS+FvFt+eIO3v1KM0NP?=
 =?iso-8859-1?Q?gzQWkKxTe9Kqus5LPqaOU8BZuPF7VeD3+5ZYDSyV8quGHFa/s40yvYdsDj?=
 =?iso-8859-1?Q?8mVGYJNO1GBfdssvJ16r5636QFcoKGRA5MHOlc6yefwOEJsF3TnecBr1do?=
 =?iso-8859-1?Q?H/hMj4KsL+2Axy/G64nlhRc0cbgca7uOrq92BktjInPRp/yF4BL4jvTT16?=
 =?iso-8859-1?Q?JGt9UwRqtZ5IuJTMCMyV4n+gU2gp+Z3UYyi3/OOrJel5gtOa9eMj83zpFj?=
 =?iso-8859-1?Q?s4h1WxTC5qlpCXNG8IiM5ABWXkpY2au+dMvf41+YlKmaF+yuOKYo6/moN2?=
 =?iso-8859-1?Q?3L5wNQqTBEzvp4O+8ZhUDqaqi+P3zGZbG5j6LhknlPzJXVXBxI07f8apTi?=
 =?iso-8859-1?Q?ZG6MpbxPXmB92/ZENRLlHLsdeT67jL+rjT706p88qhNDdzWV+bW67o9g?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	2yZACcHaZgybmzGU9SIWp3yAzJ0DzItgHnk8X3fxAFj9MSwGcRAZjr1n+pPbtNR7KEu26d0jmeOrsoUinlK27/WVEQx4Vyxs13oPdFTeNUsDtGWAOUSRepbTzsgRK8nTidmnU3M3DisI7VzdOH1QhqIkoHf0QFqVjX9dmF+ehwxMs/oqysF4K4NP9cCEtOw6de1DKMhIdqua1iINSdg6dkiFe/SbVo2tJ6slOf9UbomF55l2qRGG5qhmn5y/jF7SKqxvQpBkyoChUMqw8nORyHo9bMZarMkytPll+by5t9Bgk/zUc2lEBDbGcsTPFXNkirhFYmbJqIrTs3nKAiO360VxraaB4l2s56kd2USQZPN7kJQyOCxKQA26wbuPtXnJ2GPbHi20bFLuO79+Fl8Befmb564e87nHBcqnwNGy7T/3Y++ZQVfsgI6tVibWMaKqElTD0mEUNjMfDfhE3Bdpxks/ZPzTvdHXVxoDAj69cTi7XfbwW1xrXia7cOX+wjfIhPCOg7OK7dlS7OyAds9haMMBBRklYGIpweri+NE6M4dHEyBfAUc7oe18v5qWUG0SQukKpt3GAYiHqwhes2HMRlbut4XMf7/mgIf1IBSCGVI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc93cdfc-3a09-4a10-6411-08ddcfb9ff15
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2025 22:39:51.3403
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aPkAdlXndArYgZvg3pv42N9QHXQcu14Mrufzu0SAA8jvkj2QglcIrzgZs/EVr4HzEekjYHaYW+PX/4/+1E5QE9vL8DaKoh2plC58ui0IzKU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR10MB7670
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-30_06,2025-07-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 spamscore=0 mlxscore=0
 phishscore=0 suspectscore=0 mlxlogscore=999 adultscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2507300168
X-Authority-Analysis: v=2.4 cv=OvdPyz/t c=1 sm=1 tr=0 ts=688a9f3e b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10 a=szhP0kV4gH2EH5kjxCEA:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 cc=ntf awl=host:12070
X-Proofpoint-GUID: P2YP0feaKQRXiSAaGH4hgMnoFEqVzDLI
X-Proofpoint-ORIG-GUID: P2YP0feaKQRXiSAaGH4hgMnoFEqVzDLI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzMwMDE2NyBTYWx0ZWRfX1KbPo7ZYAyi7
 wXuhZxc8Y0v9gSseOuHnuRnu/Q+QbPu/pCpkgA19FXzsiBihu9fEbt8/bSL5UNYhhOZDO6Uwqv1
 fHPPu0KOHmLBMK1nikZaRVaq92+FyEnRtrVyhKXu+hlTgQVzoU4ZDIIkMoIu/msumcisBfDc98m
 W+BYhPcuOt7LXFeF6dTqP+IqOgiUyhSD0DpDHDJ8sWGNNGq7MOMxbiZQ1Svmhlz5GhNPpgDbJN8
 6ps5k5gqN/B5hyQiFuIyP88lgQZJ0XV+WA+oo9SQe01DaAOmn0mC2thWPxu1Z9H/NPPIV4U2nbq
 IWfW0JvoIuDQ9bat0ITjIGfXJTHIlrhdzcnf94FTKqy/j1rAMS3tR0HowpuZdnDv/yHDE2vaCy6
 UrMNhZghmFN6d/hrpiKWsaXxKXyNEdX2lmNFQfjeRgvTzFn1484R0KcDiNCZh15XqmoU5/9t

On Wed, Jul 30, 2025 at 06:03:39PM -0400, Eugene Loh wrote:
> On 7/30/25 10:26, Kris Van Hees wrote:
> 
> > On Wed, Jul 30, 2025 at 10:18:17AM -0400, Kris Van Hees via DTrace-devel wrote:
> > > I still see intermittent FAILs.  I wonder whether there is a potentially unsafe
> > > contruct at work (see below).
> > Hm, no that does not fix it either.
> > 
> > Eugene - can you have a closer look at this and see what might be going on?
> 
> I ran 40x on each of my 11 test VMs and am unable to get a FAIL with this
> patch.  I took a look at the test some more, but without a failure it's hard
> to fix.
> 
> Are you saying there is missing output (the motivating problem) or that
> there is a timeout (I thought you may have said this, but I cannot find
> where)?  Those would seem to be two separate problems, the latter being that
> a trigger does not see 4 signals.

Here is the issue:

Diff against expected:
--- test/unittest/usdt/tst.enable_pid.r 2025-06-08 00:17:54.789469056 -0400
+++ /tmp/runtest.18085/test.out 2025-07-30 10:23:48.697293799 -0400
@@ -22,8 +22,6 @@
 === epoch ===
 is not enabled
 is enabled
-is not enabled
-=== epoch ===
 ========== out 2
 is not enabled
 === epoch ===
