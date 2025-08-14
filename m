Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AF20319860
	for <dtrace@lists.linux.dev>; Thu, 14 Aug 2025 19:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755201215; cv=fail; b=jb52yZI9RdpEs8uMpGvWSI0RXFdyVOkvQaOtPdR1DWzlQ5kI5qzlxjNvMkvVxj8W5V5WvNlZw9nIm4ze3BJi04Wf2sLPrrmGb+iYTDHPk8/3w55KTj462CcHMjFVle25bCQtyZnJhx/3ENU/UTV3b2P7m/XIAp87SFur+OVCxoc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755201215; c=relaxed/simple;
	bh=dm4beV0/3lAXZOJf1mnagjYQs2lme5huv77df0HD21Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=o9J5vCk7vlEoqFZiV3XnYUqs5wqOIM/ljO2UYhvmuZ6h82CdZtr0pBe3TBSh7TowRBWcIiGiVoMqB/EOd8SSrh/HPbCvDIOoyUEdg+I0anlI2UG243kkq+e4nMjUwPpcISxGZgxhYU7n8IN2AFEshs0M0jFGGuGKRZGI2pd4ISQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=S1lpLnxh; dkim=fail (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=YG7wJn3l reason="signature verification failed"; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="S1lpLnxh";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="YG7wJn3l"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57EHfrWN018379
	for <dtrace@lists.linux.dev>; Thu, 14 Aug 2025 19:53:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=qoyD6zxFI5ArXKmfoVdDZqLeB9+P4MkrHyArdTDNSqE=; b=
	S1lpLnxh9fyILkWXLdcdDm7sEku3OcYTDm8VMLmg3y8zFbsXAYh3ExnvEp2nnb5G
	Ht/IrxtaqsWYZ86td9uFHQdY8hkPVbeZbNH8jYGAD3WKwT6hMyNIniehqpXVWi8v
	597tc62ozusp7rU1sF5m1HRT65sW0ShiP62DS4D0I0XdrDYymAWU3tPw5b6p/5WE
	X/h2q3pQZ4lgIPvr9T2lLexHPxukbkdhXC6Faz0aJYNjStLJuGUTcgB284D52L4m
	GoIlU4uU2RHTPZ+mQ7qdcd0ZggklXEBTVOLQxuRrVyFG8G+0eWFAQgh7UArqy8rJ
	iAaGEDb6jN6GfQsevCcX9g==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48guchb9w0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 14 Aug 2025 19:53:32 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 57EJOPmC030376
	for <dtrace@lists.linux.dev>; Thu, 14 Aug 2025 19:53:31 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam04on2041.outbound.protection.outlook.com [40.107.102.41])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 48dvsd630t-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 14 Aug 2025 19:53:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eRjboVOSI/RSfy67vfipjIP3aMyOsDlMo8tYpz+q75JujCJCqkC612t4iIQUiL2+jf5fz4wKLfa48OQcaDWzU1YkzNRSnE0OTncQ0BSjRQNV1cqPBeiEJMsbxusoku3MHc1Yzgp0hn8DyWkz3xTd/tz4kjio044nXpTk3nOWQXUd7fFMYPGbq4xoF8mnbCaZNsmYQmbvtGLOdLVbgc4N/mcvnyJy+Jn8ZwcjsNL0r5nOCz3Szg4Y1IetsKC2k99gYoCG7u+XVnORKIRGDWr2czizgaRIPfKHEqrwhDc42PDgOL6audjCrZ5hMHv/Bci3EctNqFvW08vJapwjeGCRfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qXmA8NnLa/DrUR1d7CU+xusbjGz8CnNtoDa4t4/JBpY=;
 b=iUgWYhRD7pf54RPtI75rLBhvM1KFFrtw7f6l76YmNhAe1momVoAEYlm4dXmkWL6fBzBtB/78XHayPR2rqXI6EezNPJdbB4b+9zsCXEPN3GaeEokK1OxWuz9XeB1h+3JXq+x4jQSVUvh1KVwufnkogu7ezEvQqS/HJp+Y1er4OBfH79kWpGDA7HQ4wEMA68cSujQwEaEBdwAIy/dVT2oHTSKpS6NDN4VVLJKWXaOdZBybIWzHZIL88pLDXfdH0xCnEvFG/pRpECL6JFEFm2a+rZ70G50AVZX0jmNvv2iDSJj0UrzE2kYPK/L0tvMQdaTidu7m9fBJL0sCw35YNfHiTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qXmA8NnLa/DrUR1d7CU+xusbjGz8CnNtoDa4t4/JBpY=;
 b=YG7wJn3lghkmJAgciY9WxkrrNEEucPl3vt8/b8pL/O1bry0KMDKGWKjM2qWXMzt5Yuz8ReY/0NMCbY/GBfUp3DRkLuKvzwhhtzOq/5rNVV5Fu6hsHJtpI4XuHFNKF9oPXjoHcqmpmQUCi+Kc28hza8CW0fwc4o+Tjz+LhXOGC0o=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by IA3PR10MB8490.namprd10.prod.outlook.com (2603:10b6:208:572::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.16; Thu, 14 Aug
 2025 19:53:24 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%4]) with mapi id 15.20.9009.018; Thu, 14 Aug 2025
 19:53:24 +0000
Date: Thu, 14 Aug 2025 15:53:21 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Eugene Loh <eugene.loh@oracle.com>
Cc: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
Subject: Re: [DTrace-devel] [PATCH v2] string: ensure string size is handled
 correctly
Message-ID: <aJ4+sYd8FUP+weQd@oracle.com>
References: <SJ0PR10MB5672AF8E9BAC559BEDBB4F7DC235A@SJ0PR10MB5672.namprd10.prod.outlook.com>
 <9a3548cd-dde3-26ba-b9ad-0a3924839e66@oracle.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9a3548cd-dde3-26ba-b9ad-0a3924839e66@oracle.com>
X-ClientProxiedBy: BLAPR05CA0012.namprd05.prod.outlook.com
 (2603:10b6:208:36e::21) To SJ0PR10MB5672.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::21)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|IA3PR10MB8490:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ea5a47f-5728-4b88-4e67-08dddb6c3ad8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?lhctRKwOp4le6ps5mERghevmhyfPPvmFMXGdQuwyWKI8zG4KEwF0Ni0lcb?=
 =?iso-8859-1?Q?RE8HkcsHPgDNQ29O0O/DAtl6gKsuxSTLvc+IxY/D2W4gYZJgg0kLHRsQlN?=
 =?iso-8859-1?Q?sdh7toJY0A3zjkUW8sqVUYws1aTqFZD6N/L0La12MZD9Ee7Z8ycExkdDqc?=
 =?iso-8859-1?Q?TKvPJPMNxS2nta7JBFBWUdUvqVjBy5yv61m0SYQFJ6k5Gnzd2ASDQkQ8Eu?=
 =?iso-8859-1?Q?ncdZ3PXaAyE5eq/chAxk2YX7EDG2mfiW4sGnxGTMLCglcZ1U8Uc1lptPqi?=
 =?iso-8859-1?Q?bBMzKISxQExHBHFH55wtevSxrcl4TfiYPRGW/waYkNtk8O2HnVVjrKQbgm?=
 =?iso-8859-1?Q?5Vd1mI5Tzx0f+S4QA5VshVllsD/jondCoQefdQxdnborEOnpDMA3UAa4vX?=
 =?iso-8859-1?Q?9mAqcPcZ3I5Yi+u+6ZcCKCyaTzQjUcvJq62rSWftVvsM6R9PgJHsRGSQZY?=
 =?iso-8859-1?Q?i5dPPb/APwcYZInleBjUey+IMVlrGa9sfyaesOlcZ/AVXIZ4ApKDCLiCjt?=
 =?iso-8859-1?Q?VzHPSsTk/jfFNaLcuAh747Ex416Fp15CKNWdse6pMHuVxNPifvt7TVM3FM?=
 =?iso-8859-1?Q?4AuldjujFXM+ulSFscH0gPLuDsPLbJtZ5Q29rnUc3QntVyyNfKGbXzBSMR?=
 =?iso-8859-1?Q?A2RltrVFv2ls/XObGMCaM12rYoEcikmRvG4LnUlZz01RTCOaVvRdbDN/sQ?=
 =?iso-8859-1?Q?Rq6Xi7ZkW4eanX9EV4poyjwMu2u3FPjASqv8FrnM59eu6BhRpBxs5G5H3L?=
 =?iso-8859-1?Q?zPdysHN5ykauU907oU0lRd/fhUBT3Ss7uawTKDO5qqL+/NKCs0Uc55d6zr?=
 =?iso-8859-1?Q?wUz3ngRUcJ10JrPps7a5HSoT5Bp8g2atZHhAM/h4FL+YiYaUDPkLkl/D/A?=
 =?iso-8859-1?Q?subTI8C226GVmYE9wixtOkgt1VptRZT1E8ieYLYn5rB4RuirHqn6CFvrHr?=
 =?iso-8859-1?Q?+tIQk9O/X7vGvtFhlT0ucizvtFgs5YaCHd5Luy3H8T+aptOYfPdWHtWDLX?=
 =?iso-8859-1?Q?EFwVCEDAdo3PSeTITgkTzLqMpCcAn6zQBJO37TBtcN1sAC6vxgdc48nKPp?=
 =?iso-8859-1?Q?7WO8SkZF/i6Qkswcgb0w4+ZSxnWAXAt5FxeybQreZq9rKg9nnuQLVKgfhW?=
 =?iso-8859-1?Q?IVPqz5ETO22igIB+Q7vNiYJcRYZdXmZ4GMshaWpe7jN/Y5xswycntUOpkr?=
 =?iso-8859-1?Q?qL9Bm/npQheSbz1C+XFc0E5CU90e57al5IHotqx8RNZPf3IB9U5G/XRJ4b?=
 =?iso-8859-1?Q?4iKtnGc8aZ12S0TSuVPU9mzHdAeccvArZAZfEJ+C8ImbFlW8kKP5wkvpYm?=
 =?iso-8859-1?Q?3920kf+zVxp2qNwv1yLtcUUMQYhDTtydYGfbJaxYH8qvSuxWKl3sLpMw4i?=
 =?iso-8859-1?Q?LfTKQPS3d6BtmM1FpJm8+PBKWqS9yE5heDpDMkNQBDDKn6yQRdJ9KmEAc3?=
 =?iso-8859-1?Q?s7xce8JCESfaPPJWLrJ7L1y+/NXnQHPCJuOhvA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?/6rblNTg4OoaGmWFRzd8xJ5mjCV28KSRr3m8lPVvwIVFj2t7KeueitiFp4?=
 =?iso-8859-1?Q?VT3KrZBNDZvLebJdppFNl8HHDfrr8ZqiaffWry0IUU+H8VKe9ZSkQenrHp?=
 =?iso-8859-1?Q?bjleHt+xBeokuOpd250zoB/uhCVHqaKhC5a3TpauCx/vI73rx2CkByNiKN?=
 =?iso-8859-1?Q?g6y7yPHfW17gHk3kmKjhIG6dJ/317Of2EUY9afSRwEY9Jp3gm8HVGwUYaB?=
 =?iso-8859-1?Q?nY3oiWzBsdiZg/ZIRFAVCpNBTI1H3wfbYElwB5BFQq85lfZL9ql3Py3lSN?=
 =?iso-8859-1?Q?f08MawK4v4wtutKNprhaqUHwT3w5IwfVN4Gp59oU+J+EVxvTO1mOCr0EjC?=
 =?iso-8859-1?Q?Xm+zaiuz9OHJFzNCTZPU1dw+enUB/wQLtgMyzbpUwxTxFPQiT++IdOSLR0?=
 =?iso-8859-1?Q?CLnSqCFKZUaX0reQnONYL9KH5JreVfSBOK2ZecIy/7rC6ATYWymcnY8C5v?=
 =?iso-8859-1?Q?RFF1KvJ0moZeoFs56RJOlIVAMzvJtfXFroVKJPM0+XE6OnRtIpnj7fb4vm?=
 =?iso-8859-1?Q?yXLH25sLaPBOk5nezqxaPQg/Ju5Gzyl8TkukD8R5dGuodgBLCkEXeEVrYr?=
 =?iso-8859-1?Q?tlkpaCriEDLXZTCLUlsJi0llV8cZnOBOkaN7JY2hnxSa58eCJnhuR22RTP?=
 =?iso-8859-1?Q?+86bo2lJLMT/ZxgXFZoEOwmiggOLKS9mTS6ys09bO/OYbGsUTBhNP+WwFI?=
 =?iso-8859-1?Q?Bd858bG7ppLCB/9tsLRmDIShfJ6CscEtGUvsznG8WptvoO45DJxOH8pEiz?=
 =?iso-8859-1?Q?l+gxcBPgYwNwvfKgpHJinF5JKbKs8FJle5ltj+eiKBhkjfDBZLuSo2znkl?=
 =?iso-8859-1?Q?f+iORpo0Lg9RoLmogq4RDit0RnuEw/BVP7/9Q42v74FKTpIIqf1ZzSJG/3?=
 =?iso-8859-1?Q?DoPQLo5VsCnV5PQEVZm1KUhGPqUHJo2UhU1euZ5fBzCkJcBHtPrDLWUV7J?=
 =?iso-8859-1?Q?BZ3KjtwWmaxVBLcU7PQYiR0accruEOmAr6taB4XBPxWVPgSKNobe/obvkg?=
 =?iso-8859-1?Q?TdwoYIBR07lA8oxmetQ90r/MAzyfFuS9+1h3My8TSDPmNtFhQreCSZvUU/?=
 =?iso-8859-1?Q?kU5BbJ0z4uSjrc5sd9AIJSAiTXIVYOyjmLm028SD34VbpaVxE90cHk3obT?=
 =?iso-8859-1?Q?K8vOGhmrqcEQmp8ESkiVydVVOjgptThys0bTSEZiZc4L0RYhJg//Rr/cx9?=
 =?iso-8859-1?Q?6Lg9faOKL3eM+0Gy4bVU8snNlwonwTyO7GTFmg7laCa2CaX+v4fxSlLbHx?=
 =?iso-8859-1?Q?x1RIxI59AN1NE3FshbkYQfXrcx86YhkIdTq2gpyhpMWjayQ7JZQ3KAbazy?=
 =?iso-8859-1?Q?OSdDfiyGEpE6WlTeHMYt5Qf2MwuPmVuxXptyZt6QGcuPSEqNhI6Y+1E1xm?=
 =?iso-8859-1?Q?MalQAHMizifMTdu8IajOWoG1cxlojZ1o3UJ4N4WCtZuTmhCNpHRN34GSe6?=
 =?iso-8859-1?Q?veYPBpnOArfLYL3uwo0NnlPFQI3tjGba+AhXP4om7Acml/C+pHjrlGjdwk?=
 =?iso-8859-1?Q?EiLAi9tuq3Tafkrwefasyau+DTThW2eJFLLp7nSq0ya4CPoY34wUS9ksZL?=
 =?iso-8859-1?Q?aktPvb/EuNdmk2Xvhc8k37sTIDfvtoN+esLUZ0+7gZBMGANDdobj0beZ0l?=
 =?iso-8859-1?Q?D5TOKRoOtD/FyWCbKaKg3EJOZS/WeZsrrLM1+GzXfqnRiSCs+rMEa8tA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	n4ggV07mLQLB+GTeUyW+lVqLPEZ9qY/PfdSm3sm27AhlVpmv/4CBvOPf092wxAT5a3ohE7JBIWn7N/NENjd+DYjKeD1tLGwVElt5+QvwgCE0vI1D/s2bHEdM3slAorwX6MVNoTF/o60+SnfGGjlZyNksPX01U6Qql9qGxMjpazD2c4j4eZzWug75LNzs2oMd2ani1kQdNZaBU13XsJY9J3fJGMPEL3N810CoIGXUxMgHdjzeYRlw0Fs9r8G2Jyk4aLOty5lDiyB3Cb7DsdbCAYIzRXYEHAVGi9jiqlxxd6tq/GebZ7d97gO6ErSpYdwuLcvkUrSw45fgzY4ZguPSiv9nc4oupcRVv3s50N6vZWWd9qFSAW5aY7PcDS+hFBmClF6BrsnOtUhpOMlftHlWyTsmPMs4A/AkBFGxVe6l9CN2sTBMn4/m3MFV2LGARiNbJj42nz2wrroN9LHsI0n/8uOIwTRCSgHcMvadI1rdg+iva7zwym/4dymRg6Gif53JQIayvtvIfz0eWVmnGBuhxIU9aEGF1cuRo1+74fX/35hli27+tlZ48p0dxyabawxzv/De8f64XWJfY1lXzpqwoCPq/sLteY33q2AsOVmMJNA=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ea5a47f-5728-4b88-4e67-08dddb6c3ad8
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2025 19:53:24.8377
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8DvRJ/UuZvOxhW8K8B04j99NcDfnusWDatto/WyHxuC/03JQx8n+soi9FG/IvNW5yZRqPRF4M8LfUZnwSmbGVxFB5htwdVog850V8r/qWr8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB8490
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_02,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 phishscore=0
 adultscore=0 mlxscore=0 bulkscore=0 spamscore=0 mlxlogscore=999
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2507300000 definitions=main-2508140170
X-Authority-Analysis: v=2.4 cv=Eo/SrTcA c=1 sm=1 tr=0 ts=689e3ebc cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=2OwXVqhp2XgA:10 a=GoEa3M9JfhUA:10 a=TV6DJfI1-ybVIX1OErwA:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
X-Proofpoint-ORIG-GUID: Abs2WxgueAScYLaxk9f8l74nFUtgDV29
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE0MDE3MCBTYWx0ZWRfXwiuwG76dLcEz
 B8GVBAM7G++/eYrDNbOzup4tPQo2Hio8oemuJVHSDrqAT3TqZhXzxfVqLi11CEWKLhFgByhJz8R
 t/GHon21wI7ZxGRKbvcVEfV72KPSdlVtPeuPzt200rixU5e4sO1C5DazPRE1dbYsM32Oq5vgAFq
 JBp83CoqV7WJl7QpaFoRVnpyU7DAEl5GXzlFATIR2VHVNbNqJLNVaurTUZvrK41g8L8uqcOiqU7
 oqmqyXVJ0rPPb0+j2Fj1vRwiMqd7nuKggb97qP5dxc+hoLN19ZygCSONvNYCz0U9DwgWhZrfrZN
 zU5mCfkqwgLzmrDTZYrcT1csq5AhIkxxfFroYB0evMy1AO3dL05+NZumtN4itbx5pDx7K7Javlh
 uxYy1OVyzGj4oMBvmcaeb0zT3ChcTACyzay3cO0LCMOoYUEZB5McNY7FuREjkHG2OrkSwBiD
X-Proofpoint-GUID: Abs2WxgueAScYLaxk9f8l74nFUtgDV29

On Thu, Aug 14, 2025 at 12:29:10PM -0400, Eugene Loh wrote:
> Typo:  s/strsuze/strsize/
> 
> For tracking purposes, should this patch be prefaced 5/5?

Either way.  The tracking I do does not actually use the 5/5 etc because
revisions in oatch series often cause thosse numbers to get skewed, e.g.
when we need to add an additional patch somewhere in the series to address
an issue.

> I think the .r files need to be updated for

Woops, forgot to git add them.  v3 on the way

> 
> test/unittest/codegen/tst.str_const_length.r
> -         0: 61 62 63 64 65 00 abcde.
> +         0: 61 62 63 64 00 abcd.
> 
> test/unittest/codegen/tst.str_data_size.r
> -         0: 64 74 72 61 63 00 dtrac.
> +         0: 64 74 72 61 00 dtra.
> 
> test/unittest/variables/tvar/tst.str-size.r
> -abcdabcdabcd
> +abcabcabc
> 
> Also, need to check test/unittest/funcs/strlen/tst.capped-sizw.d.
> 
> On 8/13/25 23:57, Kris Van Hees via DTrace-devel wrote:
> > A string is defined as a character array of size strsize.  Strings
> > that are less that strsize in length are terminated by a NUL byte.
> > This implies that the NUL byte is part of the array and therefore,
> > strsuze is indeed the size of the array and not the maximum number
> > of characters in the string.
