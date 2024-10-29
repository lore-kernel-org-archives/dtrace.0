Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91F39206E92
	for <dtrace@lists.linux.dev>; Tue, 29 Oct 2024 21:58:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730239088; cv=fail; b=QSkXaEgmgQms8WcT6ZDN/5weO+3zPRgLis9fwvrK71/ljxpd/kZK/zUhmqMDZenXD7+GBIvMn74UH4965KHujHfp3NZ9CtcdgjNUkvCnl4YA3GEMpxq3P4zwD3VrCpyeH1nOJdffLMaOT78w7Q+aEyfe5ok0C1+U6VMtwpEszVM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730239088; c=relaxed/simple;
	bh=qJg1abotOqEXPia0xTKQaX+mtEhngne/L80kYW0/UG4=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	 Content-Type:MIME-Version; b=tcjfIydz9sSvl6CqZwjxpZqpYPvMd2dg+2MU9qm1BzD862us8fRUDC2bN2DrnIgcSQrGahpSwa6OueRF7a20vRESl21JitibmO32xEUO8o6EDOUYqXyZKAaDDrRP4euuwMQgbQGBlsrW6NrIp4QVJOq3jCPCSmqTjw+4jZ3xumA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=ZBwF4ooO; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=nNiUl/nJ; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ZBwF4ooO";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="nNiUl/nJ"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49TGfYS9004067
	for <dtrace@lists.linux.dev>; Tue, 29 Oct 2024 21:58:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=nmHIAgmCpnEOtoq2Cu
	v1qWhXMqSBI0gsDdYCg1lPjSo=; b=ZBwF4ooOYuOefqer05JNFOYscdRYjU5Yfm
	EHle0tU2r0ZhniEJc3+WUOQB5jI15pkmtwbmLQ0zHEAjgieQzRm+K/V7uucL7w5k
	08uQf5Rbw+yOVLpkVUusNnx9tN4Q8q1JbVQtUbWzQVRrna/6nOrca2PXVCOLyf91
	CsjJlB1kk2jIp12Wx81CqOqWtHLXJEJCuObARiHkXeyzEMABx3ZojrQtENLynWRJ
	vVmYOhLQPB5L0YVthkf+JEsdRMkX1HRKyQ/HpcfLJ4S5mnTrMsGXdEG1ocJ3tMaB
	f2TXudSZ8Fzw081HkHYqn3U1HTXVT0lhWYh3YmL1rvXmvfRlOw0g==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42grgmerct-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 29 Oct 2024 21:58:05 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49TKnZbQ035542
	for <dtrace@lists.linux.dev>; Tue, 29 Oct 2024 21:58:04 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2049.outbound.protection.outlook.com [104.47.66.49])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 42hnd8a7yf-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 29 Oct 2024 21:58:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bz4/z0snI7CEem7vr2zGEBbk+ZFatbSw7ASghp4uG/oFu5bdesgSE2004DjQ4kDSdJhZB/dNOl+0aJL4rhrbgg/w42Kj0ZS+S0op3FbYDlnIivWsB1FpIM0+ukO8a9qkXcSpoCpqS4QGDOXJk2wiEK0F77Kl5RyGyXUr11SXtlTLgooIfqupj8EzxDtPRq6xXG8PBLF893Sq1u3Cmzf0dJ/zRHL8vnez5XHohR76sQ0mJ3JRiwNkJWyUqFxRkFrwf/uO+gfqgCHgbYPjTCePjXi4cUzU9GjKGwWfoj5QWw7oVjTqV5jWfIrvaIYDF7D0Yiei9Sq/W5UjJzwC9nmhiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nmHIAgmCpnEOtoq2Cuv1qWhXMqSBI0gsDdYCg1lPjSo=;
 b=qOB1rNB8Wbo0fDGTQ/yVeDfvfh/BuBl8nsJjCeelRHQa3XKQ4k0i64r6HYR1oCOOIVoCZW4SUALdF2imUOnrCIgTXPRM5ruHXJfLvT858cFwLNMajAzzeuP8ibl5K+GS1IbhIcy/sD8MAOLOpKmoDgw7iScYdWnwbA2/xSFLCvtwHhfrlkylwNVM38qi8ZxdXEDjuxNO2HR/O27xAZqBQA3aA/6LcCXffMH0kj9St2c1kHsTg+V5lsKctrJvOeMs7XzCWMinfKBvrKaEa15s/+ES1jY6uY5lJ5XDDSodtg01kvqqOtFj52cbP/TLm5OJWqo0Q+9zxEYryYN9wQ1+jA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nmHIAgmCpnEOtoq2Cuv1qWhXMqSBI0gsDdYCg1lPjSo=;
 b=nNiUl/nJaliPb8nkOjjFx80shta/EylvhUpQqfIqYvgoshqXe8m0C0Y2okPUa3kteBXy+WMNoTV0jwunzl4aJAOJkkUpS8eXeZgssH7214DG3Iv/hr95TO4Qfb0DwfEmPXNIwwYOBK+K82EBhBf//GvOh9KPeIx+cfvYJuTzvA4=
Received: from MN2PR10MB4093.namprd10.prod.outlook.com (2603:10b6:208:114::25)
 by CH2PR10MB4214.namprd10.prod.outlook.com (2603:10b6:610:a6::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.32; Tue, 29 Oct
 2024 21:58:01 +0000
Received: from MN2PR10MB4093.namprd10.prod.outlook.com
 ([fe80::d72e:fa5c:c426:b4b]) by MN2PR10MB4093.namprd10.prod.outlook.com
 ([fe80::d72e:fa5c:c426:b4b%4]) with mapi id 15.20.8069.027; Tue, 29 Oct 2024
 21:58:01 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [DTrace-devel] [PATCH v2 05/14] probe: improve dt_probe_lookup2()
References: <20241028211803.458685-1-nick.alcock@oracle.com>
	<20241028211803.458685-6-nick.alcock@oracle.com>
	<ZyE8jj3mle7c9NKl@oracle.com>
Emacs: Our Lady of Perpetual Garbage Collection
Date: Tue, 29 Oct 2024 21:57:59 +0000
In-Reply-To: <ZyE8jj3mle7c9NKl@oracle.com> (Kris Van Hees's message of "Tue,
	29 Oct 2024 15:50:38 -0400")
Message-ID: <87plnio9lk.fsf@esperi.org.uk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.3 (gnu/linux)
Content-Type: text/plain
X-ClientProxiedBy: LNXP123CA0024.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:d2::36) To MN2PR10MB4093.namprd10.prod.outlook.com
 (2603:10b6:208:114::25)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR10MB4093:EE_|CH2PR10MB4214:EE_
X-MS-Office365-Filtering-Correlation-Id: bff49494-6366-4f4f-8f6a-08dcf864c199
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|10070799003|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?5/ITAGow03UoWrXmZO1q4THdIeyJX8jFvNXRFUREZ1qHoH6rXdhkGlZOn0dN?=
 =?us-ascii?Q?3lqmpAwF0GdLytDjJGlgX7OG4o0HoiiWTlUc7M88Ne1gZgTbAVgShU4jqD69?=
 =?us-ascii?Q?010G4QxTVF+phvKoMM72aNq1rGoq18g0uL0bm4752yZMSJ2lcQyoY/qAhFaI?=
 =?us-ascii?Q?l4IIlc+knj605YrMmLi4Bmodqz+lk0ieIkHxBlGKXCnMCGsMP5mJbnNhKVZt?=
 =?us-ascii?Q?Wq6LEgyPylwZsU97TuPQ0nYKbGS6DL+wM5HV39Egk0wd8bvuzYMgeP4JwOOG?=
 =?us-ascii?Q?PR3isrpxd8fzwwCKtc+EqsoENWyiq/ZJQTEPh9RmM9QqFPAmYcO9re5sgfYc?=
 =?us-ascii?Q?Tp/K9IArK7emk4wRLIwmxXaBQQVDNYCC635TO1MHj/vjNko6sRcuQ8pJZYbS?=
 =?us-ascii?Q?32rwsNbMPo/3UHNwDyR5K+fMN51HqjoQc5M/onvB2WWGavtMrZSzJjyUc8EN?=
 =?us-ascii?Q?L06T04/wIoSDZbgUJxtYdT29I0pm1+aaOQt4HAcB20fwdWGeoJ099Xk4Zrh6?=
 =?us-ascii?Q?F6cRTZSGljkNgeUTd17Gh8nC0dg1expcWP4etJ5bW/hMbdXTxB9r29Df9iZp?=
 =?us-ascii?Q?oV5GtBm736cw0NHYZ6kv1vAEC3Cwb1JsujWaukyqXahkimVyk4NkBuQAnSUA?=
 =?us-ascii?Q?V91mG43AgEEM6YyYcNJlTXplL14VpU/j2uOYK5BOYnFrTIFwcfIaCXH/oXML?=
 =?us-ascii?Q?h3fD6DPnI7eLsKPfKE9cGGnr2h5mxKnXWgslDQ91JcA2GfbQJ30DAhT58rZV?=
 =?us-ascii?Q?2Z0+rDB0cm1IfWcVgib4DyMteOZdqq5wjRLkdrkR4Tqy+Jc/JqjAPLXCbTcy?=
 =?us-ascii?Q?l7YME3uatDA4X7IPPqLgUogRwqNX5kPZrUxMTzz5U+0FO/NHvIstxi4oUDjq?=
 =?us-ascii?Q?14TEdvUkmvJwvDiMe9Ei0NG70eV0BY1Er4ywRyslCn4g5mJ67itDzM+bkT5i?=
 =?us-ascii?Q?N1wyzXxjqWfV27F+lDSQUJYRtBfGe/Djb8IA7uyom3XHaq4Hy022dR5OQSYr?=
 =?us-ascii?Q?E7IHhz7vIi9HqoKglpHN0qLzIgJOLQCWaFy9gZLg4GZZVGnneDQiqgH5+4D0?=
 =?us-ascii?Q?qwG6eSmxbWy2w4sNtqRZfAupYGWwDkzdS5pSCAmZllSlqTX6VsiP2IxGEjGD?=
 =?us-ascii?Q?UFae24WiY2YklW+g5cz17ArA8PqQng0zBzW4nf0cU3WhOFnMDapoZuz4iFo3?=
 =?us-ascii?Q?CSIqvwACoI93qwm2N7lYwgsSPVIDDFNgKaJ6L3IeLlY1+vUStzzft9hMuO0n?=
 =?us-ascii?Q?DGBC8wVdwHdXfDAAWSVejM7b59E8RGH9QlczHepjtOkgWDtI/zDP6QLcYIar?=
 =?us-ascii?Q?gOCvhybOsZSSddYopZXAORar?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR10MB4093.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?cykctbVdzK+ciT7aqjfSSsg1PRc70EGaChL+fOmfV8M9QtTdpsFSlxiR4zi2?=
 =?us-ascii?Q?mWcazYgJkAI2NtutzBUTX2whmZTIoE2Af9sk87+Ko82CHD1rkSQwx3ZCKy5L?=
 =?us-ascii?Q?bGtim+KgbJWq01SoR58+SmO2pJuigt9LAr+ytXfGfWrWLXkDWT/l+Utnm9XX?=
 =?us-ascii?Q?gDB/pAa5DwaSJ06DUJufvcPi8cAEU/J+3V8f38BB90E3zNslmXZzoJaPERKQ?=
 =?us-ascii?Q?16+iHkiIZI4lY4pv1gqshOY4uDldeACfz8XhYiAiDQRoU3Kw5+GbKfN/T4U6?=
 =?us-ascii?Q?z6RqN3H5UdaVZ/ynJgCFa/zhYIHoJfVxSTxtoaqtz5y/Yhvyl0PeD60tJvms?=
 =?us-ascii?Q?clzXL4AeFNEiAmy3RxViPY1RBvCocGNi0bl5/7W/bNLbvU8r3jajQxwNgHrG?=
 =?us-ascii?Q?Cw3A5T+g5LtkVHsxORB5WqZn8GlOIU8y0T+1E5lLPmfAEUUgpja8dwtjQLjf?=
 =?us-ascii?Q?ucY6Lmxzh9VGoHwmIRFNizn25jLXSxDGRnMQFphf1WGY9cVOfxs97GqSF3/g?=
 =?us-ascii?Q?dFkLAtKg5rHwxn1zIVV3rsNgSjfYbo1oZLFBUmw7DNQW6i0yie2wcf2DQ5FZ?=
 =?us-ascii?Q?kyJJ4mlMMT6d8TqCwMFmWEF/Z2PAYDqKlky0xj6ZBIKb6ZarC98UBMSZYy9e?=
 =?us-ascii?Q?knZxbJ09NRDQbe3+G1SKsYX3SOIW6aVvyJgtvCLlWGJ+P5IPc0S2XLYmAzjH?=
 =?us-ascii?Q?91Jt71qWr/wrzYAwRzFuNO4sbpWj+dHmxkNba2NZzULbsvxXGXoVU/c8w7Hs?=
 =?us-ascii?Q?LogQ8v/HUufY/jM/Shkw+veGwmj9qwXClC4md6Jjf9wH5z+XmiLjF+NizS9B?=
 =?us-ascii?Q?MPu2E8ieMIg+CqSpWIwla4qpPOIkTbMsqPLeyPu2VcvbeCuIynvtTwcWwbeH?=
 =?us-ascii?Q?CFvln5M3pHrSDHGQfHmqCFP0Nzpd522uOBjMIcgQqRrvqJzsgH2h6xe/KhsE?=
 =?us-ascii?Q?IG1KhjxoBM0+YLGA9Xmk8fy6Xn7cAcIIbmsENgQWBODWgz1gpoDt5kOXyzph?=
 =?us-ascii?Q?WG2GCPAiWFU41zFrpSxwu1yGjb8BaFaaKN2jfNdl0IecDQaHzf6Y/sfdVjaN?=
 =?us-ascii?Q?bNoR9faIyAUnYGG5Q4LwZooUTgWOM/0s1cFcpAJKOMIhG0RhxDC1L6GJi4Pz?=
 =?us-ascii?Q?JxqraVzr69X33iP9hzVKm6+zHWCfoeForWfqrPwHpRhZSO10x0zOye+FgxkK?=
 =?us-ascii?Q?7M/7Sa3CoNZdz4NSaTNalrPxbXawxMaEGs1cwtuTipzfSTSmGH+amiVX83J6?=
 =?us-ascii?Q?P0eMhYp3wqdOR8ae3QNQJMSyJd5gujHvSmYyelACDzmop3Wd0DWfbaJfPS/Q?=
 =?us-ascii?Q?Y+dCKU2dhbu3AMc6mW0KwAkbMRsXHYlMHZs5kBvqDJEQnKyRGa6a0ZWN/Luo?=
 =?us-ascii?Q?61fujTxlWmC2OiSWsaWQus+ZS2rvpHK5fPIDT04dIOp4iNmbvHvYr5vAaDnt?=
 =?us-ascii?Q?HjiU22hDXX6ABio7uhH5P9Ahm43/K6kwTpYlvPOR6vWNMm7ekFHqub/kaAPn?=
 =?us-ascii?Q?gwG/vot8SEhc7LAca+ZcdYunbVKnnD1PoCmmvLYNg/Lr4HxRpHrgEzIznvQL?=
 =?us-ascii?Q?oVCqnl4vVIWYOBgTw5EINsoKwp0oryyJgOiUuqbk7xCU4cFFeXll+hmNArms?=
 =?us-ascii?Q?sw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	C+AK1mRIAH5UKQ5mjngmnEDswZx9ERIlWHWFQ5EqaELDS4oYURofnTgY1gY4IgBA/BehMKfUSoW+99Ncbf+qH4kgOIasozeknJEK98bvWi7AeYzWtYtb5591gkk7mms2e4FpmtiOJZN50l5g1rlIeuE37PM4hLkGT4id5URMfm3JBGRsY/48psQg0YmPi61ODeqJWX+x5u/HktXwFmIzD7hWIazX7YQagOFpFzfVx+MDdjlkUF7rYG+uYSLtyJ6fuVpEd2NyduHkkKa1Li1ct2jI6ozDInIUU4xCQrAK3oDUD9VS4zP+aMsKhUBSfekKqIqJVHsR6KjGw4eqlVKc9IfUz9juzO/OdeFQ1HQxJtp+5tHK5SmR5b3pMc2PRKzj36UX4SZrhi401apxB6zNJlC4UmVAOX/ZwCK3oLzgpv53TT0yA4vVJuykOqEM6kepfu5DwA0bQ4+KSFjm++HUDPBHFd+vQUzPu2qKwxgBn4Din1U2RZAfmBLLQRSBzYrPJcA3fKxTYrlv0C7C1GqVM83+Ob/dGs8GhiowBqrfB8Tv37BegGG/FW3I/0bw6XHDp8orMYkX49kHY7IRNgUxTy/rguwxRVoBUkSv63hvIgk=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bff49494-6366-4f4f-8f6a-08dcf864c199
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4093.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2024 21:58:01.0914
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FtQ+nyq0kPWFfoBdRwavS6vi06IeDcmeR9GK70iYaTg9LgpbHLhDGxJD91r0KywLifW1F2uS62lhgNX0tqiNFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR10MB4214
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-29_17,2024-10-29_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 malwarescore=0 spamscore=0
 phishscore=0 mlxscore=0 bulkscore=0 suspectscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2410290165
X-Proofpoint-GUID: 6rDxl44KVUC_7BR9a1kuFr8vRUiuZ2b8
X-Proofpoint-ORIG-GUID: 6rDxl44KVUC_7BR9a1kuFr8vRUiuZ2b8

On 29 Oct 2024, Kris Van Hees outgrape:

> On Mon, Oct 28, 2024 at 09:17:54PM +0000, Nick Alcock via DTrace-devel wrote:
>> diff --git a/libdtrace/dt_impl.h b/libdtrace/dt_impl.h
>> index 340dc1960c5e..d11ad2839f8e 100644
>> --- a/libdtrace/dt_impl.h
>> +++ b/libdtrace/dt_impl.h
>> @@ -759,6 +759,8 @@ extern dtrace_difo_t *dt_difo_copy(dtrace_hdl_t *dtp, const dtrace_difo_t *odp);
>>  extern int dt_consume_init(dtrace_hdl_t *);
>>  extern void dt_consume_fini(dtrace_hdl_t *);
>>  
>> +extern void dt_desc_destroy(dtrace_hdl_t *dtp, dtrace_probedesc_t *);
>
> I think it would be better to let dt_desc_destroy() take a third arg, to
> indicate whether the desc itself should be free'd as well or whether it
> should be left alone.
>
> That avoids calling it and then following it up with a dt_free() on the desc.

... er, OK? Is that really clearer than the alternative?

Implemented, anyway (and made it return straight away if called with a
NULL pdp, for consistency with free(), which lets us drop a conditional
as well).

>> diff --git a/libdtrace/dt_subr.c b/libdtrace/dt_subr.c
>> index d6aad7637fb9..72631b33a0ad 100644
>> --- a/libdtrace/dt_subr.c
>> +++ b/libdtrace/dt_subr.c
>> @@ -175,6 +175,16 @@ dtrace_desc2str(const dtrace_probedesc_t *pdp, char *buf, size_t len)
>>  	return buf;
>>  }
>>  
>> +/* Only use on probedescs derived from dtrace_xstr2desc above. */
>
> Why can't it used on other dtrace_probedesc_t that contain references to
> memory that needs to be free'd?  I don't think that dtrace_xstr2desc() does
> anything to make the desc it populates be special.

I'm a bit worried that some of them might be using pointers to regions
within storage owned by someone else rather than strdup()s (I mean they
*are* const, and that's what that generally means). If that's not true,
why are the pointers const?

-- 
NULL && (void)
