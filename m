Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69E7C1D0E01
	for <dtrace@lists.linux.dev>; Wed, 30 Oct 2024 12:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730290144; cv=fail; b=Zrk1yhOnv6cI11Ejdj2hUoM77F/ICvtiUGk13zrxVKCMKJUiWZJXmlyl+cg6nTv5wTaU+O6OJjhn4/4Tpl77KORPtyS9IqPp1/Ak0dqCyff+oMPkN7uAHjLZaXITC5tCPmgZSLltNZEmjYHPX3XC7VoRy1VAyyMGVGkqdd9J2WE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730290144; c=relaxed/simple;
	bh=UM+8tVxn8gvw9LaZowUXdEsUxL8pPluIcWOCxnllsDI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=q9qls2RaQN+3h3vb2uDkI3Fpsg1ft6aOnPjzdfDlO+YJGx7VW70nsBv8f0jCrqbd77Bb2erYVtYKkK2UKJppvi2c2/Boq1h+IFW81Abk/0zjeKRuHi4wh7hzaVuVc8B0oT0lHW1qUAsyaS4j0gISkkJQ3YLvWIDb4qr7zm1Fwxw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=GwzPrCUX; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=nTOoOMOS; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="GwzPrCUX";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="nTOoOMOS"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49U1hZTw030122
	for <dtrace@lists.linux.dev>; Wed, 30 Oct 2024 12:09:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=Ic2PjGILgynOFypyZL3rRegAZ8pf9AHYy56Aj4anEAA=; b=
	GwzPrCUX8mA9AIxtsObPXMQeVT+Vv809XRDcARk+jbA5WLw6CwnyMc65K6JUfbdz
	wQAen4TjdivOrNO4AZpPksSvAzdKSVNBFlw1FbL/vgaCNric0hc2RpcnMn61oppt
	gXtOlW5ZT0KN6GHMtOv33bSy0aBtQGuQOdKBuFzfOab2Bedr442EZ4C1YyGrDq0G
	KmxNu8Ba8bYfxrt3Hu/E9zPw/HF23a28NyDJlOn/nvMWbUJ8EkOCB7G1RVvegyZP
	nbyPwarz5U6/dMPk/QW+Vu02W1gYjnO78Knrf8hn49ONEGl+/kpc0Y8+j5aNisz0
	jUMZUT+Lrtzxly4cq8ljmQ==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42grgwfrwu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 30 Oct 2024 12:09:00 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49UB74gB008693
	for <dtrace@lists.linux.dev>; Wed, 30 Oct 2024 12:08:59 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2168.outbound.protection.outlook.com [104.47.55.168])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 42hneb0h27-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 30 Oct 2024 12:08:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WYKvYqsNxYCNFVSaFY0dxYlVpJknb0JmnZCuVz5Mi5lmcii4U8RE9odC8oB7xPU4GNwIJKMYVQ4ECRbUA1murGHmK59yOCCRzJurToK2Lf7cPpIYtJMk/SpUYiEqDZ6Us6PRlcjKb+aNaxh3U6QwbrO5eewAmSi8yFwNDfkIUVKuHugYbeTYcJTfDKuVY/U7rOqiJf/O7+PAaMzNHnC1Ktzf6/X8s6YuQZ/p8r6oMt+VHI5jlWYjtmYGa0oXYfl7L7w9E34kEuQOcg84kN8kmCBifdx2rKAcHSq0bRAYxDK+Lhzo+5CajNtGHN7eMEnTnGl6+An8UzmBAVw40MD7/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ic2PjGILgynOFypyZL3rRegAZ8pf9AHYy56Aj4anEAA=;
 b=MyjXobSLjQNdQSckA89qKj+U2WYUK4PtK8LXtoD+rsdiiOFu3eOA1brELnfIELPqV5RPOZA5B1JRjSsRQzBgN+U9TWJpMpxV46+2nuPO55Ph4OQzGfRvveZWjzf0OmDb6RyiC7FGxOVLOogq2/ofOGLfh4DHNfbRPQ2y4qr4X8hXUX3HNmkpgr3vlGy+LcRsLL76rQANvAd1azUMxfLLAl0w/WlDxvGPMowUtTh1kXBddFy19brYFz83QA6DES+0OQCHtL38WzuCHLcrMtpQolp4v/4Jp/cxOr8ynpYidtov5UafpBWUJeNp2dTy6f6B6r9dCiDmzC52IGz32j7hxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ic2PjGILgynOFypyZL3rRegAZ8pf9AHYy56Aj4anEAA=;
 b=nTOoOMOSYmsc2S1FVQdMNOxHsBUSBVR1BFK9A/pAyuzB1DyM7841stHGasSBhXpFNIeliMVMDfE7zL5m5T59vb+XEU36AUmVXy52p0lj9rtfWmn7pc4l1QU7sevL5Ol2F4bmGE4tGjbaBRlJU9o7UKuUO1Xqs2ajWxNkXSv38cY=
Received: from DM6PR10MB4091.namprd10.prod.outlook.com (2603:10b6:5:155::28)
 by SA1PR10MB6469.namprd10.prod.outlook.com (2603:10b6:806:29d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.32; Wed, 30 Oct
 2024 12:08:56 +0000
Received: from DM6PR10MB4091.namprd10.prod.outlook.com
 ([fe80::3b9e:5ef0:46b4:6e02]) by DM6PR10MB4091.namprd10.prod.outlook.com
 ([fe80::3b9e:5ef0:46b4:6e02%7]) with mapi id 15.20.8069.027; Wed, 30 Oct 2024
 12:08:56 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Cc: Alan Maguire <alan.maguire@oracle.com>,
        Kris Van Hees <kris.van.hees@oracle.com>
Subject: [PATCH REVIEWED v3 1/6] error: add missing EDT_PRINT entry
Date: Wed, 30 Oct 2024 12:08:45 +0000
Message-ID: <20241030120850.256884-2-nick.alcock@oracle.com>
X-Mailer: git-send-email 2.46.0.278.g36e3a12567
In-Reply-To: <20241030120850.256884-1-nick.alcock@oracle.com>
References: <20241030120850.256884-1-nick.alcock@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0032.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:151::19) To DM6PR10MB4091.namprd10.prod.outlook.com
 (2603:10b6:5:155::28)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR10MB4091:EE_|SA1PR10MB6469:EE_
X-MS-Office365-Filtering-Correlation-Id: 5023873d-c2f8-4328-ef2a-08dcf8dba12a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|10070799003|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?MGKR/fPdtT+v0xqR5bi0g+B3wsBtUOY39/+rkJZVSdIFsecWi000HECJduUi?=
 =?us-ascii?Q?yxziVNlpl1B9jn2I+bvhd4Xf0XHAX9fAeXeTgzm73wXgRqar0Jg1KtXtENMS?=
 =?us-ascii?Q?x8pwV3iOgSbZkatbbovIEGSEPR/bRf0xT9M7b909l9MAqeFsRapdf2eLyGWS?=
 =?us-ascii?Q?d9UeKPl0uldJqo0Iz4+ChpGwWmdc7W1SAWsqTH10RsP/1BnFW1AvWzFPid+4?=
 =?us-ascii?Q?9kxieXObhM9+aMFa1Zo/0gLm5nbEKnw7Lp1hcqK/FUNXe+c1sRQGg00x7bS+?=
 =?us-ascii?Q?aiTeizwQyeDh3VQ+ohnWncATEQqXCUDoPYzjNvXjiFkx8Sj+/CouxagjSSc+?=
 =?us-ascii?Q?9PZqLyjPbaEFzIYlDw+52a+opRJkQO+2cFCDgTi2nXVncJhvZ116l5VVDyAV?=
 =?us-ascii?Q?gbwRHW2tLj9R8KbDpr0LyNv73bnX+GRn2/8D0IPC9aCnXLJMkrQFQxZoszpr?=
 =?us-ascii?Q?UH+ET+cnGIvoWekBcg0dbdNDCX4svwKmdD/RcLbDxzPGvGdtUASTIR65P5Px?=
 =?us-ascii?Q?aj42eThcY7A0iYgBo42zXImms9jj5yPPhVr+QcWv920tKfG5ZgtbvgZes9Bs?=
 =?us-ascii?Q?Td8Ow1CEzG8asTKGoEmxaVw0cifyV0KR9GFA5aeP4CXiPeTjLlfxETReyTb0?=
 =?us-ascii?Q?r795G6Tz6Cr+qsxZiepeKX5OUnH6GDWZP8MTiQaIQMVmZ2MllHe1Ub0qHKkM?=
 =?us-ascii?Q?FPoNpaxVUAd3wzV+EmjpjTATkxwjmFynJ9Aji5TMCpqLq3uPAS9vsB77T6iZ?=
 =?us-ascii?Q?AZxK4A8dTkid9RB6cQtlJvgumR5YTBvWSkjNQ+P7w5n0/SWIMf7evohAjgGp?=
 =?us-ascii?Q?pgt3L7xv2CbsEXUfs6mrvwZD5ojBREWZ6uI0fP2X15BXR9mEmh6qApdOZreX?=
 =?us-ascii?Q?gwm4Lww06L0Y4RHcR9AP6IRJuGu05neK8kK006sP+mczZM8ZZSF6Oa5QENbl?=
 =?us-ascii?Q?sJD94ptEiSVOu5sVgVQFId154efDFZviQQJrGR66AlELb4q4FwOPpDFJKpDR?=
 =?us-ascii?Q?59mK0m1GNDtoeFzUZV+wo6U5XNmGz6qvh9tEXXTSpUbXOCfrEFX/KevGaZ+l?=
 =?us-ascii?Q?47IWfkLXM405CV9LQyTtqYSBdAteF5Q4PUFP8w2Rh0vkrRmb84qIJ+Fe+qK5?=
 =?us-ascii?Q?4JtctR06RIe4EG17ec15gNI4JkwKOZTEFfcyMij+xnB8RUKVte+GZgBvsnms?=
 =?us-ascii?Q?4XgnqKk7Wri2R0hQDI7hb+NUVAe0lgOJi1Oebf6bNJUZF3FMAgecn93RCX0n?=
 =?us-ascii?Q?NNXNg0xmJj04zWy3dnhy/63JBj6/TwFKRA5mkELrK2ug6R2WXIGvXz9yIPSG?=
 =?us-ascii?Q?VkEihAV5lPyiKFSVPrmjGmTx?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR10MB4091.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?GvEMc8Om0knBVwk/8RKI2LS/8pvlc8S4jHs2+qwBwRTgvuRUXjvKEQpBZT1I?=
 =?us-ascii?Q?kSAsXuC7XgcoewArajm+ficJte9nYpxhVO2/hq+grS0n1sTOw+aAi66z4z6z?=
 =?us-ascii?Q?QQRSXS7OBe/rVypu7G1txDjcEJt4wj3tyKORFmCw2eycoqwXN5FteRO3Ip2y?=
 =?us-ascii?Q?264Vjym4FhEOJGk7CfCz/mnC3dgWAKk94ZfQsg0WYCujM0BOKw3w7hm8gOPs?=
 =?us-ascii?Q?o5FVKfGeQueNrbVlkvymA5CmZ2d19CwkUxWafgJtS5G/xL7jgqhUzACIlKGn?=
 =?us-ascii?Q?C/u2U73/ztw3n1y2HxH18Fo/Qf1CSwlZRBVrEiHEDcmgVzEm9aTiF7VrCCfs?=
 =?us-ascii?Q?1y87L2vqkY7HJAcFD/5ldB43FBvOj6dE1CRtvJcpr0VqFL4EwlWSkjBMSy2D?=
 =?us-ascii?Q?cPo5csKNhn1pokvzz349qLkrsMsqUUSMOFMtPwVJEuSU86Sh7UcLgAjfi8vL?=
 =?us-ascii?Q?CaHVhY1F6qoYKAsNMtXScSOpqn1Of2I1KZE0g2Z+OguuuwiWVWovJjuKeZQx?=
 =?us-ascii?Q?TFCmRcfmazblPfaarMeM8WoSm1jr3ThLxqz6BCkD42i1e5FTMmvaFammLCKs?=
 =?us-ascii?Q?5EivZY1iz2VO94Ph2HyFtM2YMYLKbES5xoZ8pGdz3fSw02VbYJ0GpJA1PJmZ?=
 =?us-ascii?Q?Q4zvQxM+ZRXkn7WZPw5OZUinALXkllR1F5ApTRvRqyb6PdTDlhrIONkRy1Zz?=
 =?us-ascii?Q?Gg2yG9IiBzJLbJk3HlGH1x84Lq4YwVX9zvCoqxj6oVBerO7o8RIWdDSvQET9?=
 =?us-ascii?Q?+Z6TxgfR+KAjH14tNB7IjvYs7mIAXhoOWfBFb8nYO07cX77yGLB8OIaSjGxg?=
 =?us-ascii?Q?LFRsvQzNL0heMi5uuxcuuSA38EiTrdAHzcHpxdVR0hi8Usi1KB4gdwOSK5wo?=
 =?us-ascii?Q?ADdBEe8OllxYxVdBQitkVKbZRzkNV1Svi7+hNS9K6rK2Wcal5M1J5qx6mP12?=
 =?us-ascii?Q?Mz1kTSzug7oQoDiEPMgK4RxtlhppdGLRsD8rZuD+k/g0Lcib7gyKVU22Xz84?=
 =?us-ascii?Q?mKzzla8PwB5MFFNzLgOI9KL8Tq6M3rhnLUTO7Jqko6Gg88ItsEtUx0DVmU+x?=
 =?us-ascii?Q?IN1MAGpE5LTWIudVT8HHRxh4XWBdakd5lqlILZcVv22SOEG0hMQD2toy4cNp?=
 =?us-ascii?Q?UAX3cOfWq1To9a00RHdpbFYF+Y5VLN0s05HLcJBGXjMiG3xwvUGNHzeUaNhK?=
 =?us-ascii?Q?gBhPgjdn0SKN2eWKMTLkvhk5+TI5kNCtgZ6/B0thIRHZQJZBMrCgllGFXnj6?=
 =?us-ascii?Q?fL22+fIS0oTyb4hs24kgMjb0bcDe9igbO23yr5PI/T/NKFEIeY7VobhHpUBY?=
 =?us-ascii?Q?XkdSFj3yKscM2Jd6uQR55f8acfyt0Co3/SeUpU8aolS8SeRhlEZU8LNrHBX3?=
 =?us-ascii?Q?A3PqjxNHuob23S0rNSPasChQZvpTIF+GGbnqy/is+avQee/YUt3wRI8ik5pr?=
 =?us-ascii?Q?BkOqs0C46X8+cnGd05tF0qm3wnAr6amoZuCoKEFvMTFiWCxgud8BVpwZb3Fd?=
 =?us-ascii?Q?kzuKloPmnnhv6G1Cr5Ir7n4RdrvWa8XimtA5crLCfemndj0WQ/q5ciFFY3h9?=
 =?us-ascii?Q?AicI8NhOd/cX7Rk+3VAqH16kOwWv++VRSBXkz4/8gi9ZG84q3AMt8khyj6Nf?=
 =?us-ascii?Q?cw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	gakYbMEE0rfJCUwEwrCVC6iF/60yWbr4Kc+07jg2tB9d8hxw+xm++qCH2Z8C/lTOxF8ephH9EoWM9q5fsAuuKCApyJWcs1fXfc8rPReTAPffnPKp9gpj02OZGLeycQCs9dJsv+y8u3buctzuyeK6Fg/JhOpWZzPPwK/TMrY87STStL9/N6EpsSz+8dcM+2xvmLh6APyY6xxVrY08IUHX8j27bLekvqRVo3x6ievf9vsLvGob/zld+BZo9R96f7RwA1BfiHdcAdShbj/UMf8+GTVl9RPOOsuXx41brTDCKsBSQzZzFth0UOLO8MtrWSQpp0BQvO1/zCsWfppEUCQ0eiXZrZmYQKzEjIM6Qz3lEEOyyRhPDIBcigLRrB4NqwT81G2LCsoOOGxCKIXGTC5JqofFR1wo0Auo+YnpiVWbCdjU4gHjS7I1NQPA9kAfDwI/oSLASeToiO8f0RE61KNDLykccJY9fkUHqaqO3hTujtdlEOlC1VPZk7y9Hg7WKeLmDaq1OJRxFRSWikNP/haSMmQsOxu3UP6Jap4tVzllN7YBJ4TDqPoaYm/NCU2OnBE/5zDldIZulzO/277fYo6bf5ltalfc4ngsR2hY7py5Vyo=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5023873d-c2f8-4328-ef2a-08dcf8dba12a
X-MS-Exchange-CrossTenant-AuthSource: DM6PR10MB4091.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2024 12:08:56.6414
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xUwmcWwXFDZVW+Ppws0DzRShwVkip54zxnB639CcENKxZNZEz7D1RN/TMz/qE006Swcl67qbBtCBo5xtLJG2mg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB6469
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-30_10,2024-10-30_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 bulkscore=0 spamscore=0
 mlxlogscore=999 malwarescore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2410300095
X-Proofpoint-ORIG-GUID: HTDOp5Z8dkb9kTyq7Yx4pTRMsVj4J-Zh
X-Proofpoint-GUID: HTDOp5Z8dkb9kTyq7Yx4pTRMsVj4J-Zh

The lack of this made it impossible to print out the last error
in the list (which is EDT_PRINT itself).

Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
Reviewed-by: Alan Maguire <alan.maguire@oracle.com>
Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 libdtrace/dt_error.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/libdtrace/dt_error.c b/libdtrace/dt_error.c
index 82e114a5b292..213f0d9e1385 100644
--- a/libdtrace/dt_error.c
+++ b/libdtrace/dt_error.c
@@ -97,7 +97,8 @@ static const struct {
 	{ EDT_OBJIO, "Cannot read object file or modules.dep" },
 	{ EDT_READMAXSTACK, "Cannot read kernel param perf_event_max_stack" },
 	{ EDT_TRACEMEM, "Missing or corrupt tracemem() record" },
-	{ EDT_PCAP, "Missing or corrupt pcap() record" }
+	{ EDT_PCAP, "Missing or corrupt pcap() record" },
+	{ EDT_PRINT, "Missing or corrupt print() record" }
 };
 
 static const int _dt_nerr = sizeof(_dt_errlist) / sizeof(_dt_errlist[0]);
-- 
2.46.0.278.g36e3a12567

