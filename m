Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AE7F13CFB7
	for <dtrace@lists.linux.dev>; Thu, 12 Sep 2024 20:33:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726173199; cv=fail; b=NGhybUx24WJ+oAo31Ro3QMMb5N5fNKp4UuX19xbtE7/hJAVpFwFdPHwabbSTsuGEnlwH0NBQIWI0ySacIEt1OpMf5LkL/UtP2P3FC+YfPkxBPCiP0Ew590gmamvxJwIZq556aQI8MW6pXrwczpZbhwsQIgCdBZLKjUCQ0irNypc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726173199; c=relaxed/simple;
	bh=AA2PizCr6mH5B6S2oqk9MZwtYdEMQfFzpP9tn46em7I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=bJYA2ZhIFysWZlL9nh89a5GRN5zQ6BKP1GvuKyG4oM4+KSSdaYCTDXsbiC0jzTRZnaYtfUUZAlPuthqz3a8AbgEFlzQj5wbOWKLKwdh6j7PdLfx6HaNfazJmg9dQd6oqL12RjnDdUo4wyG9IWceClf22SxGu1g1P9DuNbh0IUcc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=iowayTiS; dkim=fail (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=ctBG7lWh reason="signature verification failed"; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="iowayTiS";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="ctBG7lWh"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48CJQdip017626
	for <dtrace@lists.linux.dev>; Thu, 12 Sep 2024 20:33:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:cc:subject:message-id:references:content-type
	:content-transfer-encoding:in-reply-to:mime-version; s=
	corp-2023-11-20; bh=jl90ICARgFaWV3lZ1uBcxo3XP9d26V+tOZg3pBUQnnw=; b=
	iowayTiSgcW/6Yj23IX+av2DyF9H5mi0P40Fqb6DQgQU59+wmY1UfnGBPT8KiBrb
	gedU7IqTekdNRR0e5vo7O2BdspzyLZpwPRRk2DHuTkwf/VMXcAZF806Rkji9VHVX
	G+uorCjqJMMURPO9kBpLtBuZReMHdF3eMJgA/VFKqD427joNMt2bZMgidTcGrpFT
	ndBvdG652aaIVmpDKztAfmncTRpbkh1dP8j+pxt9Uy/+mu3aAwNH03xKrzseeuqf
	P/hgyZC/Skd0Iyuv9EXITPCaxQsoIUqCq9CwB0NDLe1SG5IpfHpWpt76OHij6CaB
	H7z1ntZxLbs/HG7HqypmZA==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 41geq9usy8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 12 Sep 2024 20:33:15 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 48CJSQp4019817
	for <dtrace@lists.linux.dev>; Thu, 12 Sep 2024 20:33:14 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2045.outbound.protection.outlook.com [104.47.55.45])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 41gd9jbdb9-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 12 Sep 2024 20:33:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NXYzmAIiKTDyIsmT84EpNLTVFmdjjIzhi/YVXjuhfRlOTeF4PD+dVVw8N1h/Ce+2FSGnJNFf17pmqG0hadmY+V45lLvtL52Xvf18zkA/DGOdvnRAJg2tyngyW4UOk3RD3ndIHy4YPkJCFsgi8ca5BllkdovYCSb7tZ1fi+H9AYFeE53AREcuQGBHd5WoAEccGTeT9pYPIJNhl2ZoUlTuW3yymrk9mP/4FIz4GqeEHpTII9+ZbncNSZhU2z1Y0ulk9+D7t3lUJNYd11szhax69Y13pGHnCwgPsG7TcYh5B7iuH1li20KVYW61dOd+YBpEzom2C4mkMxevoXgLqE1WKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VMx4TnHC3DvP5Asg37YSquRYrDNAaUpIRSdAafixIIo=;
 b=kRLUR0XZN+U8AXco6a/0WrEB4EoREQAG6bfUX7ChfjX7hrC/oThEPlrm5a9xS/Grx86HtGmuGGa/Txf7T32bwxDlPUhlBMBTl/699nztMRN++LTMAF4okvMWS9FTLgZk39HJVYOhYGz5ZhDivEB4bfYoUhhyFtCh9rTU/Feje1LvPtRAl9lfT/Pa4FYRMuJ5/7AHKt4lJSj3SKk5i5PQcCH+md6UbxxGoAzfrYAZ3URwC6DpiFEFhWw1r0gxYURa9bXr4DZ8Bd0rTaZFQ3PeaqSCPtvfjbO7409cKGN52I/bPMAcUBvP/wFUveWakILrexuW2bI4bQmjhg9ityqo+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VMx4TnHC3DvP5Asg37YSquRYrDNAaUpIRSdAafixIIo=;
 b=ctBG7lWhiDncZiS0wCUwX8M5uqsojEprHDT2i2TZwo1FRljv0x84Hljqc6szFb5Hhd4/sKVuXgsqR6oBdBjQFSLJ2/vvQ5UKzneDK5gD1jngDAeTo2prGwjj6XmLJz1rnO0kSNSrVj6jFAe0NuykbiHzTr+ut3e+Q/LQsXYh1OY=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by DS0PR10MB8101.namprd10.prod.outlook.com (2603:10b6:8:203::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.16; Thu, 12 Sep
 2024 20:33:10 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%6]) with mapi id 15.20.7982.003; Thu, 12 Sep 2024
 20:33:10 +0000
Date: Thu, 12 Sep 2024 16:33:07 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: Eugene Loh <eugene.loh@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 05/22] Set the ERROR PRID in BPF code
Message-ID: <ZuNQA0MEWvk/mAyt@oracle.com>
References: <20240829052219.3234-1-eugene.loh@oracle.com>
 <20240829052219.3234-5-eugene.loh@oracle.com>
 <ZtucZiRk7G7UVktd@oracle.com>
 <d009801f-28e4-3b69-3f2f-ae99b577c1bd@oracle.com>
 <Ztu0ehrOeHqwIvmG@oracle.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Ztu0ehrOeHqwIvmG@oracle.com>
X-ClientProxiedBy: MN2PR16CA0018.namprd16.prod.outlook.com
 (2603:10b6:208:134::31) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|DS0PR10MB8101:EE_
X-MS-Office365-Filtering-Correlation-Id: cbe97341-91ad-4f88-2f92-08dcd36a1deb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?DjOdDXQPwuvjx0SLtHWbGAGERpRE99p/hU5xH0aUCqQcXY7IxdLBwKYK3t?=
 =?iso-8859-1?Q?l5kVlPRraedWVgIpX8GvWuFqhUNUpLTMdOvS75lB2EnwvQu3yZwLF1S1xk?=
 =?iso-8859-1?Q?cDQgvMcyVnJYNuCL+64fO9xvCww9EQGAp0IQdrR62xNzGyPFdPkcG3EQDU?=
 =?iso-8859-1?Q?N2Vyb9evSzDnONRpeIuwpb/JxU410kz02U/+WTSgkSrLgeehYexrh6ybzD?=
 =?iso-8859-1?Q?7Lknxsd7bA3iUyaLLDGB/vUSLOFoOZapaniKJdIU4cUDB/qRIsmZ45Awse?=
 =?iso-8859-1?Q?PrA3Pgc6JprQ/i53PHuXxHTnVFFRxye7oBhes4Rt4Ub66UWMizGcfLXTSA?=
 =?iso-8859-1?Q?T+y8lKwt2fMpEEORU0zYmZIHswSd0bvHExxzQoYfYP+/e91RPzvPHK6+jL?=
 =?iso-8859-1?Q?dDl09ofV9Juuzk+4omHoVftIw3C0YvtytQU+6d0IHx0acIix7BOYgA95G9?=
 =?iso-8859-1?Q?rhC5GsFwxNCxMBigxXyi5WOGwN5bWPEBQC+HyhUS4zPhaTbG/OzjnRKSKK?=
 =?iso-8859-1?Q?Y5/TpadwV1Lh8mKVLZeCsUDdfHh9WJlzdT7S0pUJUxg1OlkBUDUfpPLSgD?=
 =?iso-8859-1?Q?V5wXJY2vdF37Ecs/Zm2Hj8f4Qys1T4Rn68RVqCngSRKEz0cVdjtYMFN0rf?=
 =?iso-8859-1?Q?xlhL0MFHRRmc32/7a8ml13iKtEFb9aPKCUjD661LSJWdkEQpfdsokKVZBB?=
 =?iso-8859-1?Q?dj96tMgGXytsEgl9lyV5udXplqjSiDpRiWTjykD0cf8TVzoCg1N1WjaDe8?=
 =?iso-8859-1?Q?vVTtzZsy3KT5Lx6UdnhpPCQdPE5roG6gWb9Clss7YFteJ8ZvMIss+FhaBJ?=
 =?iso-8859-1?Q?CO0tr6Q7/oLZIBOVBr1NTo9n5gOY6XmehxdvUtcDa6y8SLKT43jfdBqb4i?=
 =?iso-8859-1?Q?aowzzX2UjzyV1hCdtk4q8+Q+GMYN9ofhwcSxcuSJ0ZoBMR47kLBtNqb8sH?=
 =?iso-8859-1?Q?00TnMVM69Q+nxnDbKlxSh7Ozhl5p1W/o9TuH/MxQ1lUILc4IM/hwmXj31l?=
 =?iso-8859-1?Q?/pKoAigLGHv+FnUZpjMsECSSOFBAlTKeWfrllKuFGGb4So845cUoYkeDzq?=
 =?iso-8859-1?Q?ocSxk5KdYisjtV1FBi/7YTMIIV6jjNwEgf0s6qur7PWKM6/WqGvo4gML2l?=
 =?iso-8859-1?Q?sYZKbLrfYR0ozT2Wg9/FMbOldaPbP6LNyngo1CQ0oXLfUeT+PkfuiCvIj3?=
 =?iso-8859-1?Q?KeLw5GJO8FWBON92rFe/9kh2y7ft2ix3MrmFiBrbF2wzb9EQ4cFPZnjyhW?=
 =?iso-8859-1?Q?vipAonq+BjQLBCBXGnAP3DIb/vSQkPaTCjj47B+2+1xyaYWBWoD/Am2pIO?=
 =?iso-8859-1?Q?9SIcOrv3Gmdexmt40OOPWqMibP5CILiep5ity+YJ3hT8OccSwWH4C6yCoy?=
 =?iso-8859-1?Q?6fnMUQkbK+CVCE/H6yY4sutm6Y84SfHNuv/8X5R3ab/YMjjbhG6F8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?qi1rZdVFu9cNuUeQENbMRbazozDB8yDYz/xSyyY9D71ODKHAuCQUNWOjHf?=
 =?iso-8859-1?Q?L9GuGGpOxhh09E03Yb5IQ+9QfzSm8ckGAfW5lxM6yq9A5EFr1g88OSUqmZ?=
 =?iso-8859-1?Q?5sgrAwUV065+M2Y3Jc14+5WLVPbf6JKaZA7314l/BNe597gdXt1kackat8?=
 =?iso-8859-1?Q?7rH8sg7ClrvI2D2T49hKlvJptml4KywuEL1b0Vv/aa2iiziRkTWI0Rl/+O?=
 =?iso-8859-1?Q?IK3sdlR0Iu9GankrYz3Sh0r646e+ZZdt825RtwRW2+soP9ploivUDtoKJ8?=
 =?iso-8859-1?Q?DbB6hHtq0mvPquC4wAJ/BcIYBokqt+Sv2JnAhz5FFWNPPmC/yJRh+Sfbwr?=
 =?iso-8859-1?Q?5JLdfBTctkl/M5clOBjItiMl3fU1BuVpmqIfPs1kd55rrbs489vFLHfYwx?=
 =?iso-8859-1?Q?smkdBtina2GS6sBNsVosdjrzwoaTXBG83cqW2kk6ATTxLV8k8FMptYwVXk?=
 =?iso-8859-1?Q?XIPcUO6ULzyUJwkkrpl/3gdxAZ8wE5fquc+AgbYzCcpeilEJb766haHihT?=
 =?iso-8859-1?Q?i1ueU+Df1JNoKgV8Q50tkosjkm+LBCFOTw9AZGwI/JNtAhcFG2q782RNhS?=
 =?iso-8859-1?Q?6+Kvx23UZNKDAXTYb+WZU2WF4Hb6WckZ4nr6v+WPVNQkKVH6RQ10a0UILq?=
 =?iso-8859-1?Q?sBjU8BaigifEoAPyz28A2kb8PCMNVyMtOifSi9H/4ny6nKmkTueU58v4+b?=
 =?iso-8859-1?Q?3RZpb7zcNupQ9/nZhEigTprVqbD0b64vDEipdH8CvxI075k4zYwQFDpiRe?=
 =?iso-8859-1?Q?2NMZ1yldsHmW48CZGUP/rNE/EGvqB87ghlkgaSuCizBmjV/b0pmH7D5t2B?=
 =?iso-8859-1?Q?olEFQA1G/sC7uFr4L7po3BDjJkLMyrphnJsl+vsjPIdi4HRwC4cYiheYBy?=
 =?iso-8859-1?Q?P9QK5oI6vJV0fIFUzQ+FnCcVEttZOM2aeGCl07q4I9xU/OT/aSMsFN8oNh?=
 =?iso-8859-1?Q?pnAvMAl/MJc3As0VOzD9Kbxev9YVTWu71tRGVAE6opKO4xbhiH+5Xpp4pP?=
 =?iso-8859-1?Q?b1ZpD++GjPVgjb+W8Xdw1B1FvxfrilbaMoNlcL3fwbKyWzj00rsGSjf7gw?=
 =?iso-8859-1?Q?/KFUQ6Esk4vJushFDrJIZb64JY1j/wkRTQ/QX6TmsjI6oFaI7IbRQLQx16?=
 =?iso-8859-1?Q?KU8wvUGlvoXsIpiY7vXcczrUN/iC63wnIMmX84jXKX81eysUU2rqN9wk49?=
 =?iso-8859-1?Q?ZWAam2l3vUIc7Vj76bdFlpEGh/Ww1CF56PewcpCccr/GcuNC06MSBKKchM?=
 =?iso-8859-1?Q?tVbfWNmYrI1fErap2SnDZBnXyHyHksIqEPwMlyQbImWa2eMKuAdQ3KiDXK?=
 =?iso-8859-1?Q?JerM2Fba8KnHl0YirX0bL/ScC5rScE4VOvPqGXfvnz9/kg0b2Z49yZEy5h?=
 =?iso-8859-1?Q?q0SQnnx2STEzEVHrKIKmuReftKUQpaeCsl8P6bLklr1zPd/aD4d6rYi+PX?=
 =?iso-8859-1?Q?fnD/n9Dk2Qwrhb0DagfbFCErqaqOfuhVUP7+GV1QDDInlVVXeorYVKb7Bw?=
 =?iso-8859-1?Q?w6vVDvEO/05nxTfsRiKwDzX+L21WnStIIEgzRjVsJdmTIKbKGgOBK/UVII?=
 =?iso-8859-1?Q?qJH55740T+nQVUZsKZDeoYdyuk9qbfPz0w0ODlueSi8kugYV3hKYz2NQkj?=
 =?iso-8859-1?Q?Qst9s/pvKN5T/f3/+H9nOzFFLnLSkk+CxRKyCcrmPD88sjhmZEjmkThQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	fDzlCCVXNaPlqkN8qKZyQmUysjJ2juc8SgF6VJtx4GOEcHwNrVrmztv0tlL8VbUpsWzN2Ro8ttaBAqURYrgX7txMC7ZFnDzFNKQFZnOq1jDKHVgOc7FGAIkfObAV2osQpAjIDYtqrLVhl/90UOMWh5RF9D8x3RMYvP6kaZ0kcyBEkWKP2d90tXhkI3XV5JtxFBByducAkS7itO9loVADbxvW+NBHfVA7FZKOdZydGeokxR4LDLl4Hq3dbd3IHcHH/aAN1zS2EXJn7UwZrRXc3jOyJt8Pb9l5g2KKG1qB9J3ZxXQ4PA/Hkjgt5K25Mt+JZtwJL3BjY59Y/MtEBO94Hn6iW0OjEsQxJMbCtpC+ojeyANVxWUxs0+EYGCgU99ZI7dZvJT0VqCLX7bNQg6FPkvkPzjebds2mMC8JfIHWDHrDOoBOJO2S9Hi+8lpl+1UdjD3AFSTJ9HKEjEl7ZHHakwnrgRlSn//jwhMT2tR7ILZeWbV7Gc8e2/4DiVWm6sdDZnm+eDjeRGvBC5QLZS+F6l5xsLna7ZBGrxFBX9HNvj0VyRtsQgwmIj3EAyEmritAQjRs83XX1O39Zd/NwvvvIbxjj1o7K99W7hrZCCHTKWk=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cbe97341-91ad-4f88-2f92-08dcd36a1deb
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2024 20:33:10.3036
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NlzRveuLKfydkq0a0M2vB61Nporn8cKEr5m9T8u3DO0QtdalXL9cGgY08cmhodgabXQ8ksYvKuQBEsH70gOYDgItQq5TjJceLe33yIqarE4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB8101
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-12_07,2024-09-12_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 suspectscore=0
 bulkscore=0 mlxscore=0 phishscore=0 malwarescore=0 adultscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2408220000 definitions=main-2409120149
X-Proofpoint-ORIG-GUID: 4axR2NObT1AU5REHxJwPzFfymo7pRiOL
X-Proofpoint-GUID: 4axR2NObT1AU5REHxJwPzFfymo7pRiOL

In addition, I think that the test should compare the id reported by the
ERROR probe against the id given in dtrace -ln dtrace:::ERROR output.  Yes,
it will be 3 (and I think putting the following three defines in dt_dctx.h
would be helpful with that), but by doing the comparison against the dtrace -l
output avoids having to encode a constant value in the expected output (and
we cannot easily access the defines from the test).

/* Static probe IDs for the dtrace provider. */
#define DTRACE_BEGIN_ID		1
#define DTRACE_END_ID		2
#define DTRACE_ERROR_ID		3

On Fri, Sep 06, 2024 at 10:03:38PM -0400, Kris Van Hees wrote:
> On Fri, Sep 06, 2024 at 09:25:12PM -0400, Eugene Loh wrote:
> > On 9/6/24 20:20, Kris Van Hees wrote:
> > 
> > > On Thu, Aug 29, 2024 at 01:22:02AM -0400, eugene.loh@oracle.com wrote:
> > > > From: Eugene Loh <eugene.loh@oracle.com>
> > > > 
> > > > We use the fact that the ERROR PRID is always 3.
> > > Where do we use it?  We certainly should never override the probe id that is
> > > assigned by dtrace when providers provide probes.  Will it always be 3?  Almost
> > > certainly, yes.  But the right way to do this is to actually make the ERROR
> > > PRID available as a symbol that can be resolved at program load time, so that
> > > the dt_probe_error function can get to its value.
> > 
> > I'm confused?  I thought I did this and you suggested simply hardwiring the
> > value 3. https://oss.oracle.com/pipermail/dtrace-devel/2024-July/004989.html
> 
> True, though I didn't mean to just hardwire the value 3.  At a minimum, I think
> it ought to be a define to set the value of the BEGIN, END, and ERROR probe,
> so that a symbolic name can be used in code.  And that probably would mean that
> it is best to add a check in the dtrace provider to ensure that those are
> indeed the probe ids assigned to BEGIN/END/ERROR (and if not, something is very
> wrong).
> 
> > > Anyway, the need to restore the mst->prid value in this patch also highlights
> > > that there is a much bigger problem...  A fault in one clause contaminates the
> > > first 6 arguments of the probe, and since a fault only interrupts the execution
> > > of the current clause, following clauses will no longer see the correct values
> > > of the first 6 arguments but rather the ones that dt_probe_error() stored in
> > > mst->argv[0 .. 5].  That is a bug for sure!
> > 
> > Good point, but... a separate issue/patch?
> 
> Yes, already written :)
> 
> > > Here is a test that demonstrates this issue:
> > > 
> > > #pragma D option quiet
> > > 
> > > syscall::write*:entry
> > > {
> > > 	self->arg0 = arg0;
> > > 	self->arg1 = arg1;
> > > 	self->arg2 = arg2;
> > > 	self->arg3 = arg3;
> > > 	self->arg4 = arg4;
> > > 	self->arg5 = arg5;
> > > 
> > > 	printf("%d / %d / %d / %d / %d / %d\n",
> > > 	       arg0, arg1, arg2, arg3, arg4, arg5);
> > > }
> > > 
> > > syscall::write*:entry
> > > {
> > > 	trace(*(int *)0);
> > > }
> > > 
> > > syscall::write*:entry,
> > > ERROR {
> > > 	printf("%d / %d / %d / %d / %d / %d\n",
> > > 	       arg0, arg1, arg2, arg3, arg4, arg5);
> > > }
> > > 
> > > syscall::write*:entry
> > > {
> > > 	exit(self->arg0 != arg0 || self->arg1 != arg1 || self->arg2 != arg2 ||
> > > 	     self->arg3 != arg3 || self->arg4 != arg4 || self->arg5 != arg5
> > > 		? 1 : 0);
> > > }
> > > 
> > > So, we need the ERROR prid value exposed as an external symbol so that it can
> > > be used in dt_probe_error(), and a patch that fixes the contamination of the
> > > arg values.
> > > 
> > > > Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
> > > > ---
> > > >   bpf/probe_error.c                         |  3 +++
> > > >   test/unittest/builtinvar/tst.id_ERROR.d   | 32 +++++++++++++++++++++++
> > > >   test/unittest/builtinvar/tst.id_ERROR.r   |  3 +++
> > > >   test/unittest/builtinvar/tst.id_ERROR.r.p |  4 +++
> > > >   4 files changed, 42 insertions(+)
> > > >   create mode 100644 test/unittest/builtinvar/tst.id_ERROR.d
> > > >   create mode 100644 test/unittest/builtinvar/tst.id_ERROR.r
> > > >   create mode 100755 test/unittest/builtinvar/tst.id_ERROR.r.p
> > > > 
> > > > diff --git a/bpf/probe_error.c b/bpf/probe_error.c
> > > > index c8ddcdfa..ee1a1793 100644
> > > > --- a/bpf/probe_error.c
> > > > +++ b/bpf/probe_error.c
> > > > @@ -26,6 +26,7 @@ noinline void dt_probe_error(const dt_dctx_t *dctx, uint64_t pc, uint64_t fault,
> > > >   			     uint64_t illval)
> > > >   {
> > > >   	dt_mstate_t	*mst = dctx->mst;
> > > > +	int		oldprid = mst->prid;
> > > >   	mst->argv[0] = 0;
> > > >   	mst->argv[1] = mst->epid;
> > > > @@ -34,7 +35,9 @@ noinline void dt_probe_error(const dt_dctx_t *dctx, uint64_t pc, uint64_t fault,
> > > >   	mst->argv[4] = fault;
> > > >   	mst->argv[5] = illval;
> > > > +	mst->prid = 3;
> > > >   	dt_error(dctx);
> > > > +	mst->prid = oldprid;
> > > >   	mst->fault = fault;
> > > >   }
> > > > diff --git a/test/unittest/builtinvar/tst.id_ERROR.d b/test/unittest/builtinvar/tst.id_ERROR.d
> > > > new file mode 100644
> > > > index 00000000..59021c60
> > > > --- /dev/null
> > > > +++ b/test/unittest/builtinvar/tst.id_ERROR.d
> > > > @@ -0,0 +1,32 @@
> > > > +/*
> > > > + * Oracle Linux DTrace.
> > > > + * Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
> > > > + * Licensed under the Universal Permissive License v 1.0 as shown at
> > > > + * http://oss.oracle.com/licenses/upl.
> > > > + */
> > > > +
> > > > +/*
> > > > + * ASSERTION:
> > > > + * The id in the ERROR probe is 3.
> > > > + *
> > > > + * SECTION: Variables/Built-in Variables
> > > > + */
> > > > +
> > > > +#pragma D option quiet
> > > > +
> > > > +tick-1s
> > > > +{
> > > > +	/* trigger the ERROR probe */
> > > > +	trace(*((int*)0));
> > > > +}
> > > > +
> > > > +tick-2s
> > > > +{
> > > > +	exit(1);
> > > > +}
> > > > +
> > > > +ERROR
> > > > +{
> > > > +	printf("id of the ERROR probe = %d\n", id);
> > > > +	exit(0);
> > > > +}
> > > > diff --git a/test/unittest/builtinvar/tst.id_ERROR.r b/test/unittest/builtinvar/tst.id_ERROR.r
> > > > new file mode 100644
> > > > index 00000000..95974abe
> > > > --- /dev/null
> > > > +++ b/test/unittest/builtinvar/tst.id_ERROR.r
> > > > @@ -0,0 +1,3 @@
> > > > +id of the ERROR probe = 3
> > > > +
> > > > +-- @@stderr --
> > > > diff --git a/test/unittest/builtinvar/tst.id_ERROR.r.p b/test/unittest/builtinvar/tst.id_ERROR.r.p
> > > > new file mode 100755
> > > > index 00000000..884b43f4
> > > > --- /dev/null
> > > > +++ b/test/unittest/builtinvar/tst.id_ERROR.r.p
> > > > @@ -0,0 +1,4 @@
> > > > +#!/usr/bin/gawk -f
> > > > +
> > > > +# Drop the line with run-dependent PRID for profile probe.
> > > > +!/error on enabled probe ID/ { print }
> > > > -- 
> > > > 2.43.5
> > > > 
