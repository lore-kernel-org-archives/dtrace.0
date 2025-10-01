Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4133A2D8788
	for <dtrace@lists.linux.dev>; Wed,  1 Oct 2025 06:24:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759299870; cv=fail; b=SK7kKd+luroe2/9Dhxcf52hUdNNBbX+vfj4F/v6SBhJqaOYbA17s1QCLYqJm185tNeFyU4dNPCyWCsJ3Ke4AgxFNLarg/WNePV9urYqkvKixn/ETsU549tIJcXbiVSI4RrgB5uwTIvz3yShbo57jvQoXJWHMZLIDMVXk8IjcW7E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759299870; c=relaxed/simple;
	bh=azRk1Kr3wW3mplVepjNuEO2LWvxp3hfFsprosNK+S1Y=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=IZqdAL2cOsmqLwvovDbktWM9Z115UjWDFqnojMM8vWJWC/9BjToSm3uUjQsnGjID9iehl9MLNjStne24mwzSbwUBq0IIVpyo9j2wMMWfedzoqr22LxUXSZkQxuRcGG5sj5Ba2LI8Mj1D3nbg3GKTYlUu9/PaxSnFXebM3H88EwE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=OnJKeMM9; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=qEVbb6d4; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="OnJKeMM9";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="qEVbb6d4"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58UKMiuZ028073
	for <dtrace@lists.linux.dev>; Wed, 1 Oct 2025 06:24:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=ke2MF/L5R1t6+npt8KsPxu3UMVBRXDPhtrNaIhLCn44=; b=
	OnJKeMM9Zn6A6QdzN3yhQnQLYMjryjQN7vEDO6zLFHIslmM6/5AQOV/mPgNb+ua0
	Q/YpMnjUvtIxMjpMOrzzDg3IcFh48lFAjk1QnkllvwJibH+2FFCsp1S86y0XpdY+
	Ac5T6xdSKVfME8xbW9Wfhz9twdVA9yxyJaCpQsMjBUZWgvxLuabLWyA0VxcM6rQw
	wuvWcwb45sxMKcDpb0c1fKUFM1e0WaSQAqw9wcKlOwxcc7cGG49PmUs8ihf36nLt
	GzbxO3B7989IDooNzFAdZO9ly+RnHK7Zikw+p55ZUJte4PyO6yuK4ZbqVfNwG4DU
	AikiFQyxQ1hOV3LyvgJgSQ==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 49gmf1rt26-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 01 Oct 2025 06:24:26 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5913G5Xt000671
	for <dtrace@lists.linux.dev>; Wed, 1 Oct 2025 06:24:26 GMT
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012004.outbound.protection.outlook.com [40.107.209.4])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 49e6c8ugec-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 01 Oct 2025 06:24:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HMZnZFOa/5OXKF/4fZhQJeiut4Bl+x81VNbTfnlBJpQFL7Pdrth+3H3KxwW2p+rTj4bBvwGutfRZrL3fGobKXsOwu+qn0ekFm3EjL8dw3ED0Sf33thf3Ng+c5O5o36wit634e4RjiHwcNLxYLxWrSq11IYCeb5ubLrRuetEblueR/LsW0AMIR78XC8F4CGLZpvrrKIff6NGpkcoq6oQI6JcbNaDbPTEfddcnthI8iDVE4DIKFd/XUe4F6M/ZoQC55tuRcHHVQffJLGvP0FRtOBelM9LdBKoF2uO4qP1ikwl6SEUHg5tYdaH0jSq+iasWZxbrGKoqf5HWT4koYIXEdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ke2MF/L5R1t6+npt8KsPxu3UMVBRXDPhtrNaIhLCn44=;
 b=MejPhgoVuuXcHByFbcc+wlCGAZvaKcJu3tEBu3pR/xwD/CUcH/GO+/c2iFnVI3p6gCcQFyujQwbRHsc0n57y/fmQr2B3uNvAPVbPpZZTBva2w+AzD1n9Avd6o0rxLFhNo1/AntSAYqLaBms/66c9Tqq2JO9IMtBx3p+j3Wnys7JHYC5wkAEoW8Ohqquo5Xy1+X9QoN0nrupv4p0Ger4S44r/NEs0Ux+ML07Kq3rUcLIgl0Z9aLM+Zwwf5J76gG3zBRZow1ARdvw0MGc9evq5jD+bJecqrDVUWyAP82TDPSeKr9e8fCKHoVH0SGgBRitQ2mzbIIsUX3s748aAt9bMnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ke2MF/L5R1t6+npt8KsPxu3UMVBRXDPhtrNaIhLCn44=;
 b=qEVbb6d4ZbDXBd8LAhNk8Kct3A7UOK40R1Wrttiafa5E5uhAQ3Nhbe2gGXU3QiUqx1pOZ78mneh9D4S/gOXuMR0bMx67WTFJfjlHwYX4jFbGUdGX5Ezr+QixdtI8GS2U5Iillr+5Q20zAY8/t2pyGHspjO1uAORWe0QmIj8MDBE=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by PH0PR10MB7078.namprd10.prod.outlook.com (2603:10b6:510:288::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.21; Wed, 1 Oct
 2025 06:24:21 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%6]) with mapi id 15.20.9160.017; Wed, 1 Oct 2025
 06:24:20 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 1/5] test: Use a more ubiquitous probe for return()-action tests
Date: Wed,  1 Oct 2025 02:24:14 -0400
Message-Id: <20251001062418.6902-1-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
Content-Type: text/plain
X-ClientProxiedBy: PH8PR15CA0022.namprd15.prod.outlook.com
 (2603:10b6:510:2d2::19) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|PH0PR10MB7078:EE_
X-MS-Office365-Filtering-Correlation-Id: ab8e64f4-5d20-456c-8e8d-08de00b32828
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?0siAV/lPh+ATAysNJyxFMaz/0eLBdKsedzApoOey3JNakCoz52OjfsAIHdVL?=
 =?us-ascii?Q?Px8Yltk4hKorJgSQSMgHaCd5S/INBG7HwZ/gSkNFuKg5YBjsjIrFmBMuOPmB?=
 =?us-ascii?Q?4e9YTzcqeYq0kNNv3oKNHVYemzVMG6KkYLSUsFbylt/29BPBHQc+BP0W7W0I?=
 =?us-ascii?Q?MegZg1l5EM/w4PlMf5jRCV+OK3WF1Lc9CYiyVpmEtXMKtxoONMrS0uSqilFk?=
 =?us-ascii?Q?FLyWPpUyvHKB79rkYcaxp3tHp083aqdWGZy29nTFFgqpdBGfuFbq7YAJLewK?=
 =?us-ascii?Q?dpYZiwYQxran9Q3qh40w4EBiPLMOw3kegkuPY0YvbZ3QBDFQaFIoUtImKmhl?=
 =?us-ascii?Q?edbgNjuj1WHIG1R3uyYNTu43L5YMDaQAIdDNYdafaKMnPy6ebks/+7w9t1Tu?=
 =?us-ascii?Q?ZMUOv/5rF/bi2f7ZrxionpvyOw5DmSmZUCbEf0GrpcPjg0TkuhFvfCcBWiGy?=
 =?us-ascii?Q?5Zr16NvELC8lK/CaSSix85JJzS1/01X3yPDO/I+40kBVr9LbDn3qHOdv4oBA?=
 =?us-ascii?Q?LyTAHsfpwuhpfMPzkbMjNNY7SQuDhjIi1i32ekGMp5zG4aJsLSR834r7shHq?=
 =?us-ascii?Q?W8aLsjy6qFDUT41DA43AsD8I2QRw1bt85PDu2ooecUmG2difkKSylCJmUlgb?=
 =?us-ascii?Q?1VO8zE42Wp2WvilJQt8afBpgiNvOm5TDhy7k+ev4CuNcmVZ/vEBtjW7RiSom?=
 =?us-ascii?Q?Cwv/IWKdHqC8L26tKp8viZfLwoFjjLZ+jR8I3Ym6PkJBJz2FshPe9+CKG6wU?=
 =?us-ascii?Q?xIRLrh5/GeERbRi8ykJqlbn70nQH53Lf0sFpQMUFjcJqynikeLjAvwrwiJ4z?=
 =?us-ascii?Q?F5uG2BjmJtbbm1lg+I5PkXEcUEFswG2vj9lLp3IBQcFZ9Ih6rvm35YO0Wj6O?=
 =?us-ascii?Q?blYg5PZ9cc0MHEyZa/Gqx/26aX7e4FGlh9Y3F/MKpAqqiDXx1h/1Qk2z3N/w?=
 =?us-ascii?Q?Vh/hH/sR84d0KuUtQy2NdBu7s/lghPnLqw6b2TVwt2egy7asDaTi/6qmEcmd?=
 =?us-ascii?Q?xs5s81nPcn9/h/mFBtyy13EoPceDokU/vdhQejnE8hhMeUq57rC3IjmgAruc?=
 =?us-ascii?Q?0mejmVi9Tq6I7rvZVsx6Ptmnpwycktp5ALa5uISlLueMNbTPJDCPc3XyGPWC?=
 =?us-ascii?Q?9dBlaSxpPQ1nfazaFEAGkm/8H/pcSfoE9bDGMz+rB1fajRIvNIdq8YNLTSvg?=
 =?us-ascii?Q?yoPL0ZFKsb4jYJ0qpO8bvSoqb4ys9gtHchgq7aA2/p+fyyObg5opfO9Raa7S?=
 =?us-ascii?Q?OEmdernhnvnE4YDHKu7mQF5CVtXkSCUJbdcLL6+uent04La3R28VS8f07XMi?=
 =?us-ascii?Q?21wm+njkVodoGNBywQ0+1GXds3tlMDP6/NMYSCIXvpv/G6iJzERBYZ1TBp1X?=
 =?us-ascii?Q?K+ORjasWdrII3eSCC9i3eU6T7+ZXNQBC2DIChXU/Pe+y7UWYaVFzWJ89vBB2?=
 =?us-ascii?Q?sKrYqUJwyOEh1fhJQEOfBKOtJtnxRSk8?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1zl5N0VuiINFgIgaMGhXoZRSndVsyb63yPiMvI0m6FqkWZl8scTrXm0XO2ue?=
 =?us-ascii?Q?ysM9Rwz/qvk2TIj/NXn3bKMFD27Pg8IhLsPpkWz+sxtlHNOQ3vOTyryQA5j4?=
 =?us-ascii?Q?W1t3089/s1tVeSP5GgKZr9hi6gqPxqM2ldMP3rpvGIGAkKctO6CBh1QlXQfb?=
 =?us-ascii?Q?sLJpYOwVxFSeuD30vB04UIx1gMTQuegynTSL53NCqCd0KFsRy9YdZzakSEkS?=
 =?us-ascii?Q?J5UAC1XEQQ/jEEzKD1h7TYRYD36V+ZYmpuxVrgF7UGBdpj0gzKQz3hX+n+Bk?=
 =?us-ascii?Q?In5Cj8j/SmYrsaWF77ajjU+SGTHw22nWah+8oEdncUTHjN/+cje1mYSBiD+5?=
 =?us-ascii?Q?8/URNbEm3IEGbBkt1JdRz7Mq9gQbaHxDwxTYpuiorNBs/R48Vzm+AFbU1XSx?=
 =?us-ascii?Q?azO08MObZA0YP476mJzdXuIi2TxSjz2wytYGHh8UqlVVv/LK8c04C9Mpn6kQ?=
 =?us-ascii?Q?BQ5wFcGDpS9LnnodjusO1w54qQZaM/l8Xge0pMH4GoFMEJBFvOEZMUDJ4WNe?=
 =?us-ascii?Q?OHpFwCUr1CsgklT66EkzjEas/3f4HiXMNNfOSUcaLGLuY7b7dSSbmuUgS9n1?=
 =?us-ascii?Q?tZRXtOvptXzXIp6nU+bgGnRScclF1b6XzgID2Ai4U0iu1B1W76ELumoaUN5P?=
 =?us-ascii?Q?xP7CZPqZM4wjDSuaFGzPGjCzIYI2/DpTC9pIlftdQMkBUvlJuy+azKszY9ru?=
 =?us-ascii?Q?1jh1ywx7yBHp3OsorlkURpobOIx59DUFp4M0wh9HNsZ9T/GOeXV6y3dd9bpr?=
 =?us-ascii?Q?uzWHFxigAQLx/UxmjM9u1n+aNvSS6sN9vv66JHvsn6aBAdcp6hLsPP5f+xcT?=
 =?us-ascii?Q?WuXIsm5TSQlv74BICcD6MoImCiGX1mkl3UAGfG/fjuHKthNmkKGgPuZUpz0y?=
 =?us-ascii?Q?PViKmn6hT1y67DY8QKajSLlYTVTRGQ0eqrZDZ6RCfKhOxphR4eWIdHvGNIuF?=
 =?us-ascii?Q?s12cs8DAifiDGO0vZJS/vodxjt/SDJESstSLV6dZLKox7oR5pw2ViY9e2DPQ?=
 =?us-ascii?Q?+Y/BgHvCsQiHCoUNJCfFN//fmY74sQm2UJgPgcsNeLE1iEsaTk23KzK/gZ9L?=
 =?us-ascii?Q?GVotqWvecP0WIVy03kxjHP6X3Ca+glOhLIFGzIUy4ircMyjGfD15rF1I8N7R?=
 =?us-ascii?Q?h3m8b2BI4XWkqTUynH7t9fSyskBXj01LuNWN29sYJ0k5me6BfX0CKk10SHOv?=
 =?us-ascii?Q?3cWBt6NmiRML9SNnn/Fav9YvdcORWVu1PMP5vtaeOk2rz9j0Aihfq9x3wZOz?=
 =?us-ascii?Q?S0B3JQfQyrAxGqwNBwL89uJi9I2y2okd9hTmsAupzL8v8O3fxggMtFOiRCIX?=
 =?us-ascii?Q?wsFdY/WFsTSTBXllkmNsUSEFkzIjcT5OrszaGFFAvGes0sKRQzSh6UAfYV2U?=
 =?us-ascii?Q?48UO5NYc3yZS8js7E2pQf708azdtdcpFINex8r8cyAhJSxLgpveDt1W11SB7?=
 =?us-ascii?Q?CKnRC23+T3xDdojbo0XfnH2Moznb072oexJiDUkqUa4+/d+6S67vjfd70LjU?=
 =?us-ascii?Q?oFGbjWnnhtKDI3FkIpCghWFgO/tPzhtZ29PlkuCOoEfHW0EtanFI35FqQzMr?=
 =?us-ascii?Q?2z3rTfFCK3QzjijuHA4uZHgWdoEoBdVmB3/JNASs?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	JxrA/l9JSIofXf5zixT7JbP0tOH8MwQJ8Ej67a8622MMySWbBH5X+d4EPm3lTX32eJyII7qiSx3Ph5HcRCgRTQJAdGd8dbdiwoMFcVe/zpkzXiMtqXxzHIeCRs+k+OohiQE6XPjC8U6AbkTESJqJ674YuOV+m5iClclXy+u2T24rMIRDDG6wTFanhhLfhEGGylDwCMQC8VBJWfy99/tiuRrvrQhs2+41BG0E8TKJDtMgmNFEs+tFYWWSYiSwEupvdhJbQaBCNhck/pG/prkwjoJI2x+OK+W264KaL8wXcFL//5uYZ6UAkrH+zXRgPGi3gYYN4DdPNEw6FDpIyFu1NcGkLZeb6qarpWsDrU29LLdd9gNTweB4KolD6ecZ9mkE4aVFsVt2UbvuGFi8cV4/PeHJ86HKeFl5oAX43uJbq02+SMp+mMGFlWopu5Xa7czOJtOk+bKTA0TCaAjzaNTtM23968y8iqmUbFX6C/bh2cbLzIJ0WNOtMTypUAyNdtHybBOlYZDz6eb/u3CmoRfWjH9Z0hasVagTyvDAIY+C3DIUAkSjPTctSb7t2ci0JbHEQiUfiq42upepfauKlU/Al01MDvIOBjT04rCoS4gCASE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab8e64f4-5d20-456c-8e8d-08de00b32828
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2025 06:24:20.8129
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XgD/9p4bzYnwe8HT19QwGZZVME2ekUx6PHDBLbzfehtniMNt5yvLUkh3qmqVnGf8jzHc7iU7j8gLIKLeAX9vyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB7078
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-01_01,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 mlxscore=0
 mlxlogscore=999 malwarescore=0 phishscore=0 bulkscore=0 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2509150000 definitions=main-2510010048
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTMwMDE2NyBTYWx0ZWRfX337ksO6ZNuOj
 yyOzkQqtFM8smCcWj4k6jY0DL64vngplt9iVX87/EZ/WmZ0W7BIijxCfTbiUK1Bq8L9fRVPP2Vd
 EIs6crxxs5Bwfu4YNnYqL0j38jg0MpMq9ca5y0IMjayPmXBLlRHkrpcVSy7FdTulOwEv3+I8uQo
 DdSB3Mb8i4MgTDJIiJEGI4V+tx6UtxfLSwxJFWTNplPONZp8dfTeHV1aA3sURl/DmrFssHCxnMy
 8Xr+PN9gdd19EKanfFzk8Ps2+1dejYPWNC4FuEz7gq+cqoioKBIoNR4g4OjT72AbAG6UHj+h2Ly
 k9IcZdb4rguc213bNM3L5sDfzgldYLF7fi6dcsjRiFIfEhERWxA/AUlubmgadzQ2mh81zvpvXvR
 Ik0JOjoZCA1DNHJpGbTIcFfhdBhnsrTV7FKCOQEr3ejPAHxby1M=
X-Authority-Analysis: v=2.4 cv=K/cv3iWI c=1 sm=1 tr=0 ts=68dcc91a b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=x6icFKpwvdMA:10
 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=JCjQV6q8clkjFuSjmPMA:9 cc=ntf
 awl=host:12090
X-Proofpoint-GUID: z5psCrCNS37sinrGWUrMmFZ1-mkyplt-
X-Proofpoint-ORIG-GUID: z5psCrCNS37sinrGWUrMmFZ1-mkyplt-

From: Eugene Loh <eugene.loh@oracle.com>

In commit ee2bd3465
("test: Use a more ubiquitous probe for return()-action tests"),
rawfbt probes are named in some tests, but they do not exist for
some kernels.  Switch to more ubiquitous probes, since the details
of the probe largely do not matter.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 test/unittest/actions/return/err.not_allowed-1.d   | 2 +-
 test/unittest/actions/return/err.not_allowed-1.r   | 2 +-
 test/unittest/actions/return/err.not_allowed-1.r.p | 5 +++++
 test/unittest/actions/return/err.not_allowed-2.d   | 2 +-
 test/unittest/actions/return/err.not_allowed-2.r   | 2 +-
 test/unittest/actions/return/err.not_allowed-3.d   | 2 +-
 test/unittest/actions/return/err.not_allowed-3.r   | 2 +-
 7 files changed, 11 insertions(+), 6 deletions(-)
 create mode 100755 test/unittest/actions/return/err.not_allowed-1.r.p

diff --git a/test/unittest/actions/return/err.not_allowed-1.d b/test/unittest/actions/return/err.not_allowed-1.d
index 246a68b18..e32751bf2 100644
--- a/test/unittest/actions/return/err.not_allowed-1.d
+++ b/test/unittest/actions/return/err.not_allowed-1.d
@@ -20,7 +20,7 @@ BEGIN
 	exit(0);
 }
 
-fbt:btrfs:open_ctree:entry
+fbt:vmlinux:__*_sys_getpid:entry
 /ok/
 {
 	return(0);
diff --git a/test/unittest/actions/return/err.not_allowed-1.r b/test/unittest/actions/return/err.not_allowed-1.r
index e3443c301..becd3d4fa 100644
--- a/test/unittest/actions/return/err.not_allowed-1.r
+++ b/test/unittest/actions/return/err.not_allowed-1.r
@@ -1,2 +1,2 @@
 -- @@stderr --
-dtrace: could not enable tracing: return() not allowed for fbt:btrfs:open_ctree:entry
+dtrace: could not enable tracing: return() not allowed for fbt:vmlinux:__*_sys_getpid:entry
diff --git a/test/unittest/actions/return/err.not_allowed-1.r.p b/test/unittest/actions/return/err.not_allowed-1.r.p
new file mode 100755
index 000000000..d356eb0dd
--- /dev/null
+++ b/test/unittest/actions/return/err.not_allowed-1.r.p
@@ -0,0 +1,5 @@
+#!/usr/bin/gawk -f
+{
+        sub("__.*_sys_getpid", "__*_sys_getpid");
+        print;
+}
diff --git a/test/unittest/actions/return/err.not_allowed-2.d b/test/unittest/actions/return/err.not_allowed-2.d
index e0d303c71..4c613065f 100644
--- a/test/unittest/actions/return/err.not_allowed-2.d
+++ b/test/unittest/actions/return/err.not_allowed-2.d
@@ -20,7 +20,7 @@ BEGIN
 	exit(0);
 }
 
-rawfbt:btrfs:close_ctree:entry
+rawfbt:vmlinux:abort:entry
 /ok/
 {
 	return(0);
diff --git a/test/unittest/actions/return/err.not_allowed-2.r b/test/unittest/actions/return/err.not_allowed-2.r
index 758d34770..bd47e2bae 100644
--- a/test/unittest/actions/return/err.not_allowed-2.r
+++ b/test/unittest/actions/return/err.not_allowed-2.r
@@ -1,2 +1,2 @@
 -- @@stderr --
-dtrace: could not enable tracing: return() not allowed for rawfbt:btrfs:close_ctree:entry
+dtrace: could not enable tracing: return() not allowed for rawfbt:vmlinux:abort:entry
diff --git a/test/unittest/actions/return/err.not_allowed-3.d b/test/unittest/actions/return/err.not_allowed-3.d
index 770565c93..87891b7ba 100644
--- a/test/unittest/actions/return/err.not_allowed-3.d
+++ b/test/unittest/actions/return/err.not_allowed-3.d
@@ -20,7 +20,7 @@ BEGIN
 	exit(0);
 }
 
-rawfbt:btrfs:*_ctree:entry
+rawfbt:vmlinux:abo*rt:entry
 /ok/
 {
 	return(0);
diff --git a/test/unittest/actions/return/err.not_allowed-3.r b/test/unittest/actions/return/err.not_allowed-3.r
index 758d34770..bd47e2bae 100644
--- a/test/unittest/actions/return/err.not_allowed-3.r
+++ b/test/unittest/actions/return/err.not_allowed-3.r
@@ -1,2 +1,2 @@
 -- @@stderr --
-dtrace: could not enable tracing: return() not allowed for rawfbt:btrfs:close_ctree:entry
+dtrace: could not enable tracing: return() not allowed for rawfbt:vmlinux:abort:entry
-- 
2.47.3

