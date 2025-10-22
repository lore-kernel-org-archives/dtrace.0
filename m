Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 515FC2652A2
	for <dtrace@lists.linux.dev>; Wed, 22 Oct 2025 03:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761103410; cv=fail; b=eF4U7DmcfXyLl3OtQFERsr8kXNrd9PungjcJ8cTW1xiOCviwaG195w8B1Pp1+vc5m/jhq1jZWV55yw/Ac9oGbZbg0e2S+IGB3C18Kxqj2TNpr5lhUv0ZF9qzySO6MLWtuQXGF4HPTK/gmv6UlJP9BnpgQ3/1oPR7T2Lg97ilTEk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761103410; c=relaxed/simple;
	bh=5IDtcO3g4ksQzscjWxy1LgiRrXKwHpP8XUxcz/dKb6k=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=I5WsDFtlMicYcUTKiY78jrs+cbV2/Sl3NKHcOrS+0FABnux0lscL7It79y0p93Bh3dkeq1mfTprBdlaIlYti1sVrvtKPIvnLUFOENLFdRiQTe7sexzSA2QeiuG7E3mfvO9fskLEr8SWTP2D1NL2rvJFG9pvlvtdk8gTt2XetLdg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=IUz7Rb9I; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=ywiqYR4a; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="IUz7Rb9I";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="ywiqYR4a"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59M3NRgS032611
	for <dtrace@lists.linux.dev>; Wed, 22 Oct 2025 03:23:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=RBL8m7/cZdQBr8Ublm
	pxM8id8yfPfZrUKQwlnC1whrs=; b=IUz7Rb9IcHUKIVa0dnGMfP1ezRmh3XFF+N
	1Lwm771KTl12PO3zPAyar/c6BUOpzezLIHnOLlrMYUpdR/OFLkDiYTNFrY+eZPGB
	tQVUhuM5j4nrngAcSOPfggWUkBXO0XVz7nqQWNLk8c5lMPKBVQuhRtutJZBHOouH
	4vGSTzbN7ED16ZfYBJS0AgkTj/FUqzmbTfz+eVak8pk3xtwOy9v46QQxf+0S1RJf
	SwwTgph42BLSiTr7r9TEqDZcLDV73QA5xErCbmO95db7HRSBGgtGC4LfLqNT0qko
	xv8n59a5Nw54RBKHrDWy83dZsX03pAMFEh2mFde8E85WYFLYbCYw==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 49v31d6xxt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 22 Oct 2025 03:23:27 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 59M0mkBt025370
	for <dtrace@lists.linux.dev>; Wed, 22 Oct 2025 03:23:26 GMT
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012024.outbound.protection.outlook.com [52.101.43.24])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 49v1bcmj65-9
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 22 Oct 2025 03:23:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C25Iq3P/fokIaDN6x5WQ/HUF0KRt8B0qkScWx0JUaJjORiMXF9tKBtFo6qLIziXJ4k+PYh2duHZ/XV2bhA9GnnY4CbPfQ0rFdNsJfi558Fv6NtcRKFlHbwzUoUBwl2+uWH01Bsc7mB1mhf03glcFyjbbTmF0p1usrRRE+W0fcpoOlMXbl54joP89ftQvaSYZE4ojvXCpKpBgfk8dAbFbqoyvInQndbOd6cFPBtnw+eNkkvLmv/RSrX3hAMYLK8fOh2iR0qKhaWKwH0wdj7Gqpqp4Y6sn5kKx3jY/BCnLY5IthdLrc6jFhPCttTrJYRYtFaB82YVOS5WHCbVCxN8+/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RBL8m7/cZdQBr8UblmpxM8id8yfPfZrUKQwlnC1whrs=;
 b=s5eK9OixQzMsBlFyuQnZ5zi3ocSO0bQMcfU7K46RcBaiqkQRgK58L5bxYhwBrnFzYxyws9RtDakqE3l7zytbMpsMESik1jh+PoaHMcbwu426JZhNB+cWL6+34Nrk7X9YUE3QY/ny03ijlSD3SkZFNS8qtf13qpnDBAqA/eEGlqeGHTdmh00Ohg+ppMD3XssCWhe1MseA1/G9zxUqLxSztnwB2VirqzEPXlpa8rj4NiNp67qXOVGq571kUAtLGvv4ZhY1gBjd5fqdqNYtpARyiKJRwqCyBXka08CDFY5AKIPvy3hK2bjCIDQ98HxQ4DUlEyjS0wWgld4NtRVJUV1jtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RBL8m7/cZdQBr8UblmpxM8id8yfPfZrUKQwlnC1whrs=;
 b=ywiqYR4ahKHafvjdrbEw0qsE/f8KvIs4KmgI+tECFq2xnv4EcXG5VMPkl61EF3CHpITW+Y+Bd7E+LIvjYYOm584VpNvzCiNUULOz9ZY5o9p4rwH0JxTpYq/kajUzzJQjT1Ik1gkl7DX0TFF0S7Zw6B+PN7OO6clrryz7PaXze68=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by DS0PR10MB6974.namprd10.prod.outlook.com (2603:10b6:8:148::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.16; Wed, 22 Oct
 2025 03:23:14 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%6]) with mapi id 15.20.9253.011; Wed, 22 Oct 2025
 03:23:14 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v2 16/20] doc: Clean up undefined anchor links
Date: Tue, 21 Oct 2025 23:22:46 -0400
Message-Id: <20251022032251.2010-11-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20251022032251.2010-1-eugene.loh@oracle.com>
References: <20251022032251.2010-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: PH8PR07CA0021.namprd07.prod.outlook.com
 (2603:10b6:510:2cd::10) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|DS0PR10MB6974:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e5692e6-7958-48d0-3b93-08de111a558f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Io9zfazSE0l4LEmOwkSy+7rv2oPlA6ePgBdl1zsZLW8ozCaGX/inaGgxgBJp?=
 =?us-ascii?Q?gzPRfE2jpy+iUJbWgLnATrXrqdNWqboeNwn7CkJS+7BRxwNDDB34v0OhJOcF?=
 =?us-ascii?Q?WcSA5rh/gB1A9xX/9fRAjy8zJNVJooUqjhrQurROT/Whe4aJK0EUQQNLzzbh?=
 =?us-ascii?Q?3E2YZYhu01XXVBC3/NrTZjWKWtig1FKqXP2mk4i9sSbo2fy79gXVJX2nai6y?=
 =?us-ascii?Q?gUiKWvemNuz+OkYNVHR3xWAmeQp6GOpeiVWrmSgksenoFWKAjYGWtJEXA8Mm?=
 =?us-ascii?Q?8Z/jSUn42Yb+/TSiLWpWBBFYmL2tj+N1Ag5rr4Cb373ljNEFbH+KOSiQQScQ?=
 =?us-ascii?Q?8P71KgzDYCm9KuNDGwklyAEpGQrx+FGGTgOlL3ABVr5W7FDtNTf5HuepfOfn?=
 =?us-ascii?Q?c1x1TXA7MrmDy5Ny2YBnqOzqxbXoxgfNtgW9QIk7OR38q0ymb3AuojDuYHtW?=
 =?us-ascii?Q?wABaMfWmjk1L5yQ5l07PfXIIilp3wnjb8qFTh+WNG4fLe7JCGfUpFviJ7MFe?=
 =?us-ascii?Q?52CsAmCMwqXpCrcbh3Tnul7bwBovzECal4q0In5AayuQv522PnVPUWzsfHF2?=
 =?us-ascii?Q?ERKVr4Vqe66+fd7GaLliz7MaYftZKu8cFvBENZkYhu8omBISHzC52AUoe8xa?=
 =?us-ascii?Q?tGGGUekcT93lVhuVr6dyOoGu5pJ2YPpoxz0DK3NuE4ykZXGH/qKZN6dDVZWb?=
 =?us-ascii?Q?r4uS6Bf9q+v82f96KpEWWGnyTxtf+jesH1+209A5iVF7qbYW7+zwc/5FAFpW?=
 =?us-ascii?Q?Ol0TpK5LdM/tQrRgttg10Dtmr8IPbrAFijJKanJclRdSl5+0ihfM8c3V8ndG?=
 =?us-ascii?Q?1tw3TShK46N4JUBlf1WVBPPn+jZa41uVydTm9hmjGrAtTELLwlvKzmfgSxyk?=
 =?us-ascii?Q?pO+122OGozUmXKEa6/n91E/KuN+oCUshMhNoPQtDPZSDj6W0kuU4XwCKg/oE?=
 =?us-ascii?Q?sVVhCroGYhDEkMyK8nxvaP+59DxwGeCxyjBmOFk/bsNzlokrMKGZ0sS6EWs+?=
 =?us-ascii?Q?WVQVvm9KQDhFI72wXufpLrRZA4RV+kH1sDWBNqxHqWPCyF9fJT1qus4jTsba?=
 =?us-ascii?Q?SUhm015WWUCxEIeolrw47QC/otCkUDh/KmffHeSHdCJkr/6RO77eUOtcNZUL?=
 =?us-ascii?Q?yuIZhnZWksHhKB1+SLuBUfAYeBTU9fe3/iH26HG59gC6+ExI/FX1bUznLP4h?=
 =?us-ascii?Q?gacNzaw6uZcQIpSozJNBv5CeGLkjaSZbXezQCsib9GiSWXZIUcn60xpiCfJ+?=
 =?us-ascii?Q?pi6MsVJ4jHyP/5SUtX2rHORh94W+Ht1JS+UC5CfY40AewiBvQzpRyo7KkqT3?=
 =?us-ascii?Q?rWa3vL1QwGQzUv5kX3csDLj36eR3WWssZ7UANshetRnFNKlpZ8muxZ9JNBjm?=
 =?us-ascii?Q?1ZPfSu8+hvOiSxviQoNNUqRp7TAzGuNoZUP5fAY1vOOd5UIIFDIp1f3JEnu4?=
 =?us-ascii?Q?LMx3p3Ozmi/ccQVMsHNkfxK4SFwH1AkS?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?cuemDcUwmDUkD+1dTuXFsxLMOlxgWyiF95sG8CxdDTDk4kQRCZ9Wm75P1/qL?=
 =?us-ascii?Q?KIx11MH587CoxwfhHgCHhw2zu5Ggfyv9dJtFqwnmPtfPCmK/9D4I1rpD6V0Q?=
 =?us-ascii?Q?11BUlWCVtRL8Wv9riNBbiqO9hlhmI74VhJ2cu/+Bc6dDW5IHLiMcklW40hT0?=
 =?us-ascii?Q?AG2YgDtKSowKy1U/g/KYZGSG5eRlcMrctSyqE5XKtv1UYpnYbxxZ742/y4He?=
 =?us-ascii?Q?vSrJG5B2Q1nvBaYub6F/JMzngdv2XWL8Q4wag0kgrKjzofLKX2Ddrmq0YuJ4?=
 =?us-ascii?Q?kOpZ0Z7iRVyZL6yZyYqLfMn/luGj3b4yq02khdMAnN4vV/OXKydSEdsKBuJY?=
 =?us-ascii?Q?Z81zZ1rdxJXVgDo5i/ti+7rrfc+RRizTSqXkKaf3cbu0AH8v8HX0Y2ZmR64g?=
 =?us-ascii?Q?v+DUBMT9COxmKDTQDipt9gJI4ax2y+tJBqkVib2PFRGPCoqjGb7PlN1ynA/M?=
 =?us-ascii?Q?iqMNuLvZTqHlNY9x8bbHDK/Z1as4wq/SDUx1A8WLP5i01XFPkfUwwm8MZRLo?=
 =?us-ascii?Q?vsUqf2+vL3KCuO7eYZXLbEZdggRs4f5wydFnZk28g9+fIEITMgKZrBJDg+nP?=
 =?us-ascii?Q?E3Qfghff5moD0SwJbAO9s0rzAqI3HiuVlDxJkWXyfVBi4Qz8TOSDE2POH+XL?=
 =?us-ascii?Q?Eb6DBGBV7DxLe+N1DCNcIzNpQCmAEWFcMLN59tYCD85BTgLw2pVdX/Kh+bBr?=
 =?us-ascii?Q?Ux5auiy4dqqz0YQ1XYOUWAt9KQ1a/m/T0zVayGLsgGliKiQ3ZfoxHnHIjsyf?=
 =?us-ascii?Q?9safjaca8jx2TgwG5T1ggQMwNxbUitedqxJ7lkrf32lccOUf0eeom8i2rO1Z?=
 =?us-ascii?Q?ig8rO49bapaHoXiKcK6wlt1GiwukeDg44OwfJ7/EXIs6eoq+gMsJXDkY3/ib?=
 =?us-ascii?Q?NFb+ZkyZ6uAp1K4JuTrB9ktZHqz4aY3N7aMuiLqGlt46SzFNBwqDTNt11Xii?=
 =?us-ascii?Q?+fLc1QHAfUglzdsTy3+x3O1vpsCUdbtrLKauT1W/wSfFq+/1RfU2Wk4Bg+q7?=
 =?us-ascii?Q?Eibe3YNTx4/tFx7UIGft89m0BM01NRMKr1sSowmisHCJzlZomqq3uZdzhsRP?=
 =?us-ascii?Q?GSA8EfbhdFc0txlNl58SbuFMc3wFDTZr0UfvkMzd9WZxYzFLAQVnS5vkSdcP?=
 =?us-ascii?Q?E77F2GFb1X2oZAajC9KvEM6tZN32CPp7ZPWBxCX+gWyzF89Q9lCmJoh1TgbJ?=
 =?us-ascii?Q?R0kBFTQ2BsjmNDcFZtctY2GBsJYIXU+WLju8/kdCMyWa/WsztbHRRBGWlqz+?=
 =?us-ascii?Q?YhWO/oe3e08WFmy4VetdqZMKUyMG/yTMoY30gbtio6YbLzbwd65FXmeBBcz1?=
 =?us-ascii?Q?tZRpwL8HIFzxCmJ2EiFpp51BGCwSC62QcyeUH+UribAhOs1BJEPC+8R/lZpm?=
 =?us-ascii?Q?g4PdybL2yMyh5xlD/jv6TvJYhey/DxuNvPkNq8Xx7UH50LD2glPQXSx2u6tV?=
 =?us-ascii?Q?X4lFG+LTZT7YU26EC8qKg7t3MKg3vBPUNvxbASOkkUqwHSEwwz+y9HmC9wMQ?=
 =?us-ascii?Q?/acQL7NejQhbNP+3oMvxPbawrbhDFs9XUfwNin12Oh384LP81MeUYnMcjZWt?=
 =?us-ascii?Q?+t2MuMiqHadt9fRd91mjttKtSoW0RVQcfLjdwcgG?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	MU+b8z2lu48WkQto0p3IO6UPURaOOiGc2EVPukadrnPNSHKnMC27PdTVjQef/YYZrYLEoJg3BPTDiIHzhtQOX1TjrN3TfmARXynIDbVkF2jw9qWFmcxnu348y3t74yxGYAN91DnZJ89CJujdFD2kBbjSEDw0MNKi/ed/HDvjWBLd5KxPn3/W3A0wHQrzdBJkZtCqvG6EP3pA5rLsB/0wWzDV7tosoScJ0Gn50akZZ4I5UPF5BaezZaGacn9D1IuOzk2lp5QSVQaKQYFXfNSWsySC8LhISfMN0iHIj2nS0Hp3miL5tnoYtb78X6MNlx9RNVA+B7s5sBYNCzNS9CWT0aviUdps62YAuFHht8gXmu9iKHlBpMeM7ljbhtDzBhKjEWZaCXyz50RBUprd+ZC3Z01OTHEvJ0iabGGhuWQcOHD5wSejMA4uBaXaMIZPkq1Q9N2JImbwIaeaY3xNXRzjTEPvcvtvSRKr6sJ7f7jm1ZMZas2grzvKGXSiav69guxreG50ApqIayL7aZJaDmWEPGSLQe8/+k4fnv6fDS03IdlV/66Qr6ga5X7qcLsgaqAnpY0VbAHg6TL4hlkOMIIPEdbzLACW6zHlIs8MZfA7G/o=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e5692e6-7958-48d0-3b93-08de111a558f
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2025 03:23:13.9265
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FNnBOd5JBXdReQDcMpqVtunB3mtUIEwm4qdMpf+I+9IuaTWpwLtxX3amw7eFIeXntA2jkKPHF8qqCnmZXHM3Vg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6974
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_01,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxscore=0 spamscore=0
 adultscore=0 suspectscore=0 malwarescore=0 mlxlogscore=999 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2510020000
 definitions=main-2510220025
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAyMyBTYWx0ZWRfX7fd4IgBTRiYG
 HHTeppxXpt142Zhvjz/kj6cPz7PKBKwN6sY2WQaM8pq/MdyhPmW4IuY63YAaZkg6BJakuLI0lfr
 DlCb2Wy0VGSPCtE+3wL9qJn5Qf4pew31ziGiskaqsrgJW2qQBUcZIa7jRSPy8oDDqq693NcMzkI
 nJiUf0aLJWRIwuV39wf1LVq2w+OBbCfVgv8tOYzXvqcs2LTvj//P0g0hcBRQZNw0uJ29tLn6GvA
 GzYu0AzS3b7gBkcB82YUYC0LJ2Zl50RcnhnxbHaxqfz0Dna1tk8rdIRrZzWSUESR/RMStPoxxx6
 eBNPJSgRpzkHaSBVitiTsi41Nw8AVA1xRCycpACVVN81mGg492c6Yl/QGe+TX/XZBtwXnHqwDyw
 z9rXTimOEf/6y6i/MrXwTuvqRVMYJg==
X-Proofpoint-GUID: z0t7Q-nTrooDxNzJjUbsAKPp6cXpbRUC
X-Authority-Analysis: v=2.4 cv=KoZAGGWN c=1 sm=1 tr=0 ts=68f84e2f cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=x6icFKpwvdMA:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=yPCof4ZbAAAA:8
 a=Bx_a1VBOKUDWyBatW8QA:9
X-Proofpoint-ORIG-GUID: z0t7Q-nTrooDxNzJjUbsAKPp6cXpbRUC

From: Eugene Loh <eugene.loh@oracle.com>

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 doc/userguide/index.md                                      | 2 +-
 .../reference/dtrace_builtin_variable_reference.md          | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/doc/userguide/index.md b/doc/userguide/index.md
index abd1096db..ef1489f5e 100644
--- a/doc/userguide/index.md
+++ b/doc/userguide/index.md
@@ -7,7 +7,7 @@
         -   [Install DTrace on Oracle Linux 9](how-to/dtrace-howto-install-dtrace.md#install_dtrace_oracle_linux_9)
         -   [Install DTrace on Oracle Linux 8](how-to/dtrace-howto-install-dtrace.md#install_dtrace_oracle_linux_8)
         -   [Install DTrace on Oracle Linux 7](how-to/dtrace-howto-install-dtrace.md#install_dtrace_oracle_linux_7)
-        -   [Verify the DTrace Installation](how-to/dtrace-howto-install-_dtrace.md#verify_install)
+        -   [Verify the DTrace Installation](how-to/dtrace-howto-install-dtrace.md#verify_install)
     -   [List and Enable Probes](how-to/dtrace-howto-list-and-enable-probes.md#list_enable_probes)
     -   [Create a DTrace Script](how-to/dtrace-howto-create-a-dtrace-script.md#dt_create_script)
     -   [Use Predicates For Control Flow](how-to/dtrace-howto-use-predicates.md#dt_preds_dlang)
diff --git a/doc/userguide/reference/dtrace_builtin_variable_reference.md b/doc/userguide/reference/dtrace_builtin_variable_reference.md
index aecd2308c..0cbfc4252 100644
--- a/doc/userguide/reference/dtrace_builtin_variable_reference.md
+++ b/doc/userguide/reference/dtrace_builtin_variable_reference.md
@@ -31,7 +31,7 @@ Macro arguments
 
 </td><td>
 
-See [Macro Arguments](dtrace_builtin_variable_reference.md#macro_arguments)
+See [Macro Arguments](dtrace_builtin_variable_reference.md#dt_macroa_scrpt)
 
 </td></tr><tr><td>
 
@@ -127,7 +127,7 @@ Target process ID
 
 </td><td>
 
-See [Target Process ID](dtrace_builtin_variable_reference.md#target_process)
+See [Target Process ID](dtrace_builtin_variable_reference.md#targ_proc_id)
 </td></tr><tr><td>
 
 `$uid`
@@ -231,7 +231,7 @@ regardless of whether they're referenced by using the `$arg` or `$$arg` form of
 If the `defaultargs` option is set,
 unspecified arguments that are referenced with the `$$arg` form have the value of the empty string \(`""`\).
 
-### Target Process ID
+### Target Process ID <a id="targ_proc_id">
 
 Use the `$target` macro variable to create scripts to be applied to the user process of interest that you specify with the `-p` option or that you create by using the `dtrace` command with the `-c` option. The D programs that you specify on the command line or by using the `-s` option are compiled after processes are created or grabbed, and the `$target` variable expands to the integer process ID of the first such process.
 
-- 
2.47.3

